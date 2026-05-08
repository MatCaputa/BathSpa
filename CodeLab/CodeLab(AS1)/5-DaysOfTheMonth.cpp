// This program optupts number of days in a month.
// User is required to enter a month number (e.g. 1 = January, 12 = December).
// If the month is February user is required to enter a year to check for a leap year.

// Header inclusion directives, library headers will be included here.
#include <iostream>
#include <cstdlib>

// Using declarations, to use below names in global scope without :: resolution operator.
using std::cerr;
using std::cin;
using std::cout;
using std::endl;

// Enumerate moths starting from JANUARY = 1
enum Month
{
    JANUARY = 1,
    FEBRUARY,
    MARCH,
    APRIL,
    MAY,
    JUNE,
    JULY,
    AUGUST,
    SEPTEMBER,
    OCTOBER,
    NOVEMBER,
    DECEMBER
};

// main function definition
// Program entry point; the main function of the program that will be executed first.
// Returns EXIT_FAILURE if user enters wrong number or letters.
// Returns EXIT_SUCCESS if the after displaying message to user.
// Returns status code 0 to operating system added by compiler to the end of the function.
int main()
{
    // Prompt user to enter a month number
    cout << "Enter month number (e.g. 1 = January, 12 = December): "; // Prompt user to enter month number
    int selected_month;                                               // Declaration of selected_month variable to store user input.
    cin >> selected_month;                                            // Store user input in selected_month variable.

    // Switch statement to check number of days in a month.
    // Returns message to user and EXIT_SUCCESS status code instead of break statement because there is no need to continue.
    switch (selected_month)
    {
    case JANUARY:
    case MARCH:
    case MAY:
    case JULY:
    case AUGUST:
    case OCTOBER:
    case DECEMBER:
        cout << "This month has 31 days."; // Output message to user
        return EXIT_SUCCESS;               // Exit the main function and  return success status code to operating system
    case APRIL:
    case JUNE:
    case SEPTEMBER:
    case NOVEMBER:
        cout << "This month has 30 days."; // Output message to user
        return EXIT_SUCCESS;               // Exit the main function and return success status code to operating system
    case FEBRUARY:
        cout << "Enter a year: "; // Prompt user to enter a year for February month
        int year;                 // Declaration of year variable to store user input

        cin >> year;   // Store user input in year variable
        if (year <= 0) // Check if year is valid using conditional statement
        {
            cerr << "You have entered invalid year." << endl;
            return EXIT_FAILURE; // Exit the main function and return failure status code to operating system
        }

        // Check for leap year using conditional statement
        // https://www.geeksforgeeks.org/cpp/cpp-program-to-check-leap-year/

        if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
        {
            cout << "This month has " << 29 << " days"; // Output message to user
            return EXIT_SUCCESS;                        // Exit the main function and return success status code to operating system
        }

        cout << "This month has " << 28 << " days" << endl; // Output message to user
        return EXIT_SUCCESS;                                // Exit the main function and return success status code to operating system
    default:                                                // Default case if user entered invalid month number
        cerr << "You have entered invalid month number.";   // Output error message to user
        return EXIT_FAILURE;                                // Exit the main function and return failure status code to operating system
    }
}