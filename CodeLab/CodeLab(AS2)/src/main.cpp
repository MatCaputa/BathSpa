
#include "Product.h"
#include "VendingMachine.h"

#include <iostream>

int main() {

    std::cout << "Loading vending machine...\n";

    VendingMachine vm("Vending Machine 1", 4, 3);

    // Row A — Drinks
    vm.stock("A1", Product("Fanta", 2.40, Product::Category::DRINK));
    vm.stock("A2", Product("Coca-Cola", 2.50, Product::Category::DRINK));
    vm.stock("A3", Product("Sprite", 2.40, Product::Category::DRINK));
    // vm.stock("A4", Product("Water", 1.50, Product::Category::DRINK));
    // vm.stock("A5", Product("Iced Tea", 2.75, Product::Category::DRINK));

    // Row B — Drinks
    vm.stock("B1", Product("Orange Juice", 3.00, Product::Category::DRINK));
    vm.stock("B2", Product("Lemonade", 2.25, Product::Category::DRINK));
    vm.stock("B3", Product("Energy Drink", 3.50, Product::Category::DRINK));
    // vm.stock("B4", Product("Coffee", 2.00, Product::Category::DRINK));
    // vm.stock("B5", Product("Hot Chocolate", 2.50, Product::Category::DRINK));

    // Row C — Snacks (chips)
    vm.stock("C1", Product("Potato Chips", 1.75, Product::Category::SNACK));
    vm.stock("C2", Product("Pretzels", 1.50, Product::Category::SNACK));
    vm.stock("C3", Product("Doritos", 1.95, Product::Category::SNACK));
    // vm.stock("C4", Product("Cheetos", 1.95, Product::Category::SNACK));
    // vm.stock("C5", Product("Popcorn", 2.00, Product::Category::SNACK));

    // Row D — Snacks (sweet)
    vm.stock("D1", Product("Snickers", 1.50, Product::Category::SNACK));
    vm.stock("D2", Product("KitKat", 1.50, Product::Category::SNACK));
    vm.stock("D3", Product("M&Ms", 1.75, Product::Category::SNACK));
    // vm.stock("D4", Product("Twix", 1.50, Product::Category::SNACK));
    // vm.stock("D5", Product("Gummy Bears", 2.25, Product::Category::SNACK));

    // Row E — Snacks (cookies & bars)
    // vm.stock("E1", Product("Oreos", 2.00, Product::Category::SNACK));
    // vm.stock("E2", Product("Granola Bar", 1.75, Product::Category::SNACK));
    // vm.stock("E3", Product("Trail Mix", 2.50, Product::Category::SNACK));
    // vm.stock("E4", Product("Chocolate Bar", 1.95, Product::Category::SNACK));
    // vm.stock("E5", Product("Cookies", 2.25, Product::Category::SNACK));

    vm.render(std::cout);

    return 0;
}
