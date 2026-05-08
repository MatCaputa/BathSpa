/* File: 06-BruteForceAttack.cpp
 * - This program asks user to enter a password.
 * - The user has 5 attepms to enter a password.
 * - Program outputs "Welcome to the Secure Area" on correct password.
 * - Program outputs "The authorities have been alerted!" on invalid password after 5 attepms.
 */
#include <iostream>
#include <string>
#include <cstdlib>

using std::cerr;
using std::cin;
using std::cout;
using std::endl;
using std::string;

// Function: main
int main()
{
    const string CORRECT_PASSWORD = "12345"; // Correct password
    string entered_password = "";            // Define variable to store user input
    int attempts_left = 5;                   // Number of attempts

    // Loop until correct password is entered or attempts run out
    while (entered_password != CORRECT_PASSWORD && attempts_left > 0)
    {
        cout << "Enter password (" << attempts_left << " left): "; // Prompt user for password
        getline(cin, entered_password);                            // Get user input

        if (entered_password == CORRECT_PASSWORD) // Check if password is correct
        {
            cout << "Welcome to the Secure Area" << endl; // Output welcome message
            return EXIT_SUCCESS;                          // Exit program successfully
        }
        else
        {
            cerr << "Incorrect password." << endl; // Output error message
        }

        attempts_left--; // Decrement attempts left
    }

    cerr << "The authorities have been alerted!" << endl; // Output alert message
    return EXIT_FAILURE;                                  // Exit program with failure
}