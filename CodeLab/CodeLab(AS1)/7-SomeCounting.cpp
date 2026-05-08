/* File: 07-SomeCounting.cpp
 * The program using a loop:
 *
 * - counts up from 0 to 50 in increments of 1.
 * - counts down from 50 to 0 in decrements of 1.
 * - counts up from 30 to 50 in increments of 1.
 * - counts down from 50 to 10 in decrements of 2.
 * - counts up from 100 to 200 in increments of 5.
 */
#include <iostream>

// Function: main
int main()
{
    // Loop implementations
    std::cout << "A loop that counts up from 0 to 50 in increments of 1." << std::endl;
    // First loop: counts up from 0 to 50
    for (int i = 0; i <= 50; i++)
    {
        std::cout << i << " ";
    }

    std::cout << "\n\nA loop that counts down from 50 to 0 in decrements of 1." << std::endl;
    // Second loop: counts down from 50 to 0
    for (int i = 50; i >= 0; i--)
    {
        std::cout << i << " ";
    }

    std::cout << "\n\nA loop that counts up from 30 to 50 in increments of 1." << std::endl;
    // Third loop: counts up from 30 to 50
    for (int i = 30; i <= 50; i++)
    {
        std::cout << i << " ";
    }

    std::cout << "\n\nA loop that counts down from 50 to 10 in decrements of 2." << std::endl;
    // Fourth loop: counts down from 50 to 10 in decrements of 2
    for (int i = 50; i >= 10; i -= 2)
    {
        std::cout << i << " ";
    }

    std::cout << "\n\nA loop that counts up from 100 to 200 in increments of 5." << std::endl;
    // Fifth loop: counts up from 100 to 200 in increments of 5
    for (int i = 100; i <= 200; i += 5)
    {
        std::cout << i << " ";
    }
}