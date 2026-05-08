// This is a 10 Capitals Cities of Europe Quiz.
// User is required to answer what is the capital city of each country.
// Program validates user answer and informs user if the answer was correct or wrong.
// Answers can be camelCase.

// Header inclusion directives, library headers will be included here.
#include <iostream>
#include <string>
#include <cstdlib>

// Using declarations, to use below names in global scope without :: resolution operator.
using std::cin;
using std::cout;
using std::endl;
using std::string;

// main function definition
// Program entry point; the main function of the program that will be executed first.
// This function executes 10-question console quiz.
// Returns status code 0 to operating system added by compiler to the end of the function or by typing exit in the console.
int main()
{
    // Output user instructions.
    cout << "10 Capitals Cities of Europe Quiz\n"
         << "Answer questions below or type `exit` to exit the program.\n"
         << endl;

    // Definition and initialization of const 2d array with country capital pairs.
    const std::string country_capital[10][2] = {
        {"France", "Paris"},
        {"Germany", "Berlin"},
        {"Belgium", "Brussels"},
        {"Czech Republic", "Prague"},
        {"Finland", "Helsinki"},
        {"Greece", "Athens"},
        {"Italy", "Rome"},
        {"Norway", "Oslo"},
        {"Poland", "Warsaw"},
        {"Spain", "Madrid"}};

    // Loop country_capital array and unpack values to const country, capital variables as reference instead of making a copy.
    for (const auto &[country, capital] : country_capital)
    {
        // Prompt user question about current country.
        cout << "What is the capital of " << country << "?: " << endl;

        // Definition user_answer variable to store user answer for current country.
        string user_answer;
        getline(cin, user_answer); // Read user input from cin and store it in user_answer variable.

        for (char &letter : user_answer) // Loop for each letter in user answer and store each letter as reference.
            letter = tolower(letter);    // set user_answer letters to lowercase.

        if (user_answer == "exit") // if user_answer value is "exit" conditional statement
            return EXIT_SUCCESS;   // exit program with success status code 0

        user_answer[0] = toupper(user_answer[0]); // Convert first letter of user answer to upper case.

        // Print message if the answer was correct or wrong using ternary operator.
        cout << (user_answer == capital ? "Your answer was correct!" : "Your answer was wrong!") << endl;
    }
}