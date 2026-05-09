#include "GridSlot.h"
#include "Product.h"

GridSlot::GridSlot(char column_label, int row_label, std::optional<Product> product)
    : column_label_(column_label), row_label_(row_label), product_(std::move(product)) {}

std::string GridSlot::label() const {
    return std::string(1, column_label_) + std::to_string(row_label_);
}
