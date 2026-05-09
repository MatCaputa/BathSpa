#pragma once

#include <map>
#include <ostream>
#include <string>

#include "GridSlot.h"

class VendingMachine {
private:
    std::string machine_label_;
    int columns_;
    int rows_;
    std::map<std::string, GridSlot> grid_;

public:
    VendingMachine(std::string machine_label, int columns, int rows);
    void stock(const std::string& slot_label, Product product);
    void render(std::ostream& os) const;
};
