#include "Product.h"

Product::Product(std::string label, double price, Category category)
    : label_(std::move(label)), price_(price), category_(category) {}

std::string Product::toString(Category c) {
    switch (c) {
        case Category::DRINK:
            return "Drink";
        case Category::SNACK:
            return "Snack";
    }
    return "Item";
}
