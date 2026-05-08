// The program outputs my name, hometown and age in new line using single cout to the console.
// The output can be optionaly modified by user.

// Header inclusion directives, library headers will be included here.
#include <iostream>
#include <string>

// Using directive allows to use below names in global scope without :: resolution operator.
using std::cin;
using std::cout;
using std::endl;
using std::stoi;
using std::string;

// prompt_custom_value function definition.
// This function promts user to modyfiy value of a string variable passed by reference.
// User input is optional and orignal value is displayed to user.
// Orginal value can be retained by pressing Enter.
// Overloaed function on @param current_value data type.
// @param current_value reference to orginal variable that can be modified by user input.
// @param label describes the variable.
void prompt_custom_value(string &current_value, const string &label)
{
    // Promt user to enter custom value for a label and display current value.
    cout << "Enter a text for " << label << " or press Enter to use [" << current_value << "]: ";

    string custom_value;        // Declaration of temporary variable to store user input.
    getline(cin, custom_value); // Store user input from cin into custom_value

    if (custom_value.empty()) // Check if user input is empty using conditional statement.
    {
        return; // return if user input is empty, user must have pressed Enter.
    }

    current_value = custom_value; // Set value of the variable by current_value reference to a value o custom_value variable.
}

// prompt_custom_value function definition.
// This function promts user to modyfiy value of a int variable passed by reference.
// User input is optional and orignal value is displayed to user.
// Orginal value can be retained by pressing Enter.
// Overloaed function on @param current_value data type.
// @param current_value reference to orginal variable that can be modified by user input.
// @param label describes the variable.
void prompt_custom_value(int &current_value, const string &label)
{
    string custom_value; // Declaration of temporary variable to store user input.
    while (true)         // Loop until the user input will be correct.
    {
        // Promt user to enter custom numeric value for a label and display current value.
        cout << "Enter a number for " << label << " or press Enter to use [" << current_value << "]: ";
        getline(cin, custom_value);

        if (custom_value.empty()) // Check if user input is empty using conditional statement.
        {
            return; // return if user input is empty, user must have pressed Enter.
        }

        // Use try, catch blocks to validate user input.
        try
        {
            current_value = stoi(custom_value); // Try to set value of the variable by current_value reference to a value o custom_value variable.

            return; // return if user entered numbers and input string was correctly converted to int.
        }
        catch (...) // if user entered letters stoi will throw exception that will be catched here.
        {
            // Promt user to enter custom numeric value for a label and display current value.
            cout << "Invalid number entered." << endl;
        }
    }
}

// main function definition
// Program entry point; the main function of the program that will be executed first.
// This function prints my name, hometown and age variables value to the console.
// Prompts user to modify values by calling overloaded function prompt_custom_value.
// Returns status code 0 to operating system added by compiler to the end of the function.
int main()
{
    // Variable definition.
    string name = "Mateusz Caputa";
    // Invoke prompt_custom_value to prompt user for custom value.
    prompt_custom_value(name, "name");

    // Variable definition.
    string hometown = "Wroclaw, Poland";
    // Invoke prompt_custom_value to prompt user for custom value.
    prompt_custom_value(hometown, "hometown");

    // Variable definition.
    int age = 31;
    // Invoke prompt_custom_value to prompt user for custom value.
    prompt_custom_value(age, "age");

    // Output variable values using insertion operator.
    cout << name << "\n"
         << hometown << "\n"
         << age << endl;
}