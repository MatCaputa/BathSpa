// The program outputs "Coding is Cool" to the console.

// Header inclusion directives, library headers will be included here.
#include <iostream>
#include <string>    // it is unused in the context of the program and should be removed.
using namespace std; // This using directive allows to use of all names from the std namespace without the :: resolution operator.

// main function definition.
// Program entry point; the main function of the program that will be executed first.
// This function prints "Coding is Cool" to the console.
// Returns status code 0 to operating system added by compiler to the end of the function.
int main()
{
    // Output character array using stream insertion operator. Add new line character and flush stream.
    cout << "Coding is Cool" << endl;
}