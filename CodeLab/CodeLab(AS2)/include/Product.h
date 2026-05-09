#pragma once

#include <string>

class Product {
public:
    enum class Category {
        DRINK,
        SNACK
    };

    static std::string toString(Category c);

private:
    std::string label_;
    double price_;
    Category category_;

public:
    Product(std::string label, double price, Category category);
    const std::string& label() const { return label_; };
    double price() const { return price_; };
    const Category& category() const { return category_; };
    std::string categoryText() const { return toString(category_); };
};
