// The program outputs sum of two variables stored in third variable.

// Header inclusion directives, library headers will be included here.
#include <iostream>

// Using directive allow to use below names in global scope without :: resolution operator.
using std::cout;
using std::endl;

// main function definition
// Program entry point; the main function of the program that will be executed first.
// This function prints the sum of two variables stored in third variable.
// Returns status code 0 to operating system added by compiler to the end of the function.
int main()
{
    constexpr int FIRST_VALUE = 8;                         // Variable definition with constant expression specifier.
    constexpr int SECOND_VALUE = 10;                       // Variable definition with constant expression specifier.
    constexpr int VALUES_SUM = FIRST_VALUE + SECOND_VALUE; // Variable definition with constant expression evaluation.

    // Output VALUES_SUM value using insertion operator.
    cout << VALUES_SUM << endl;
}