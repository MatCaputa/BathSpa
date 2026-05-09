#include <stdexcept>

#include "GridSlot.h"
#include "Product.h"
#include "VendingMachine.h"

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
    auto it = grid_.find(slot_label);
    if (it == grid_.end()) {
        throw std::out_of_range("VendingMachine stock, unknown slot " + slot_label);
    }
    it->second.product(std::move(product));
}

void VendingMachine::render(std::ostream& os) const {

    constexpr int CELL_WIDTH = 4;
    // os << std::string(CELL_WIDTH * columns_ * 2, '-') << "\n";

    char last_column = 'A';

    for (const auto& [key, slot] : grid_) {
        os << std::string(CELL_WIDTH, '-');
        os << "[" << key << "]";
        os << std::string(CELL_WIDTH, '-');

        if (const auto& product = slot.product()) {
            // os << product->label() << "(" << product->categoryText() << ")" << " | £" << product->price();
        } else {
            os << "Empty";
        }
        if (last_column != slot.column()) {
            last_column = slot.column();
            os << " \n";
        }
    }
}
