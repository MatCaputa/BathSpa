/* File: 08-SimpleSearch.cpp
 * - The program checks if a string exists in a string array.
 * - If strig is found program outputs message with the index of found string.
 * - If strig is not found program outputs message that the string was not found.
 */
#include <iostream>
#include <string>
#include <cstdlib>

using std::cerr;
using std::cin;
using std::cout;
using std::endl;
using std::string;

int main()
{
    // Define array of strings
    string names[6] = {"Jake", "Zac", "Ian", "Ron", "Sam", "Dave"};
    // Declare variable for searched name
    string search_name;

    cout << "Enter searched name: "; // Prompt user for input
    getline(cin, search_name);       // Read the input

    cout << "Searching for name: " << search_name << endl; // Output searched name

    // Loop through the array to find the searched name
    for (int i = 0; i < 6; i++)
    {
        // Check if current name matches the searched name
        if (names[i] == search_name)
        {
            // If found, output the index and exit successfully
            cout << "Name " << search_name << " found at index " << i;
            return EXIT_SUCCESS;
        }
    }

    // If not found, output not found message and exit with failure
    cerr << "Name " << search_name << " not found" << endl;
    return EXIT_FAILURE;
}