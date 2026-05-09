#pragma once

#include <optional>
#include <string>

#include "Product.h"

class GridSlot {
private:
    char column_label_;
    int row_label_;
    std::optional<Product> product_;

public:
    GridSlot(char column_label, int row_label, std::optional<Product> product);
    std::string label() const;
    char column() const { return column_label_; }
    char row() const { return row_label_; }

    const std::optional<Product>& product() const { return product_; };
    void product(Product p) { product_ = p; };
};
