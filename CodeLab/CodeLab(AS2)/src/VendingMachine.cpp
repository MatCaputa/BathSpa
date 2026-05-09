#include "VendingMachine.h"
#include "GridSlot.h"
#include "Product.h"
#include "Utils.h"
#include <iomanip>
#include <stdexcept>
#include <string>

VendingMachine::VendingMachine(std::string machine_label, int columns, int rows)
    : machine_label_(std::move(machine_label)), columns_(columns), rows_(rows) {

    for (int c = 0; c < columns_; c++) {
        for (int r = 0; r < rows_; r++) {

            char column_label = 'A' + c;
            int row_label = 1 + r;
            GridSlot slot(column_label, row_label, std::nullopt);

            grid_.emplace(slot.label(), std::move(slot));
        }
    }
}

void VendingMachine::stock(const std::string& slot_label, Product product) {
    clear_console();
    auto it = grid_.find(slot_label);
    if (it == grid_.end()) {
        throw std::out_of_range("VendingMachine stock, unknown slot " + slot_label);
    }
    it->second.product(std::move(product));
}

void VendingMachine::render(std::ostream& os) const {
    constexpr int CELL_WIDTH = 12;  // visible chars inside each cell

    // Counts visible characters in UTF-8 text (treats each codepoint as 1 column).
    auto visible_width = [](const std::string& s) -> int {
        int w = 0;
        for (size_t i = 0; i < s.size(); ++i) {
            unsigned char c = static_cast<unsigned char>(s[i]);
            if (c < 0x80) {
                w++;
            } else if ((c & 0xE0) == 0xC0) {
                w++;
                i += 1;
            } else if ((c & 0xF0) == 0xE0) {
                w++;
                i += 2;
            } else if ((c & 0xF8) == 0xF0) {
                w++;
                i += 3;
            }
        }
        return w;
    };

    auto pad_center = [&](const std::string& s, int target) {
        int vw = visible_width(s);
        if (vw >= target)
            return s;
        int pad = target - vw;
        return std::string(pad / 2, ' ') + s + std::string(pad - pad / 2, ' ');
    };

    auto center_visible = [&](const std::string& s) {
        int cw = get_console_width();
        int vw = visible_width(s);
        if (vw >= cw)
            return s;
        return std::string((cw - vw) / 2, ' ') + s;
    };

    auto shorten = [](const std::string& name, int max_len) {
        if (static_cast<int>(name.size()) <= max_len)
            return name;
        if (max_len <= 3)
            return name.substr(0, max_len);
        return name.substr(0, max_len - 3) + "...";
    };

    auto format_price = [](double price) {
        std::ostringstream oss;
        oss << "\xC2\xA3" << std::fixed << std::setprecision(2) << price;  // £
        return oss.str();
    };

    auto make_separator = [](int cells, int cell_width) {
        std::string sep = "+";
        for (int i = 0; i < cells; ++i)
            sep += std::string(cell_width, '-') + "+";
        return sep;
    };

    auto flush_row = [&](int cells, const std::string& labels,
                         const std::string& names, const std::string& prices) {
        if (labels.empty())
            return;
        std::string sep = make_separator(cells, CELL_WIDTH);
        os << center_visible(sep) << "\n";
        os << center_visible(labels) << "\n";
        os << center_visible(names) << "\n";
        os << center_visible(prices) << "\n";
    };

    char last_column = 0;
    std::string labels, names, prices;
    int cells_in_row = 0, last_cells = 0;

    for (const auto& [key, slot] : grid_) {
        if (last_column != 0 && last_column != slot.column()) {
            flush_row(cells_in_row, labels, names, prices);
            last_cells = cells_in_row;
            labels.clear();
            names.clear();
            prices.clear();
            cells_in_row = 0;
        }

        if (labels.empty()) {
            labels = "|";
            names = "|";
            prices = "|";
        }

        last_column = slot.column();
        cells_in_row++;

        labels += pad_center(key, CELL_WIDTH) + "|";

        if (const auto& product = slot.product()) {
            names += pad_center(shorten(product->label(), CELL_WIDTH), CELL_WIDTH) + "|";
            prices += pad_center(format_price(product->price()), CELL_WIDTH) + "|";
        } else {
            names += pad_center("(empty)", CELL_WIDTH) + "|";
            prices += pad_center("-", CELL_WIDTH) + "|";
        }
    }

    // flush the final group + closing separator
    if (!labels.empty()) {
        flush_row(cells_in_row, labels, names, prices);
        last_cells = cells_in_row;
    }
    if (last_cells > 0) {
        os << center_visible(make_separator(last_cells, CELL_WIDTH)) << "\n";
    }
}
