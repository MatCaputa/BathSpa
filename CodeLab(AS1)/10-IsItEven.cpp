// The program outputs message if the entered number by user is even or odd

// Header inclusion decretives, header files will be included here
#include <iostream>
#include <string>

// Using decredives, use names without :: resoltuion operator
using std::cerr;
using std::cin;
using std::cout;
using std::endl;
using std::string;

// is_even function definition
// Function checks if the provided number is even or odd and returns appropriate message
string is_even(int number)
{
    // return message based on even or odd check using ternary operator
    return number % 2 == 0 ? "The provided number is even" : "The provided number is odd";
}

// main function definition
// Program entry point
int main()
{
    cout << "Enter a number: "; // prompt user to enter a number

    int entered_number;                          // variable to store user entered number
    if (cin >> entered_number)                   // read user input and check if input is valid
        cout << is_even(entered_number) << endl; // output the result of is_even function
    else
        cerr << "You entered incorrect number." << endl; // output error message for invalid input
}