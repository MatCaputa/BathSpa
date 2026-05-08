# S1 — Programming Skills Portfolio
**Language:** C++

A portfolio of ten C++ exercises that demonstrate the fundamental programming techniques covered in the module — from basic I/O and primitive types through control flow, loops, arrays and functions.

---

## Solutions

| # | Exercise | File | Topics |
| --- | --- | --- | --- |
| 1 | Coding is Cool | [1-CodingIsCool.cpp](1-CodingIsCool.cpp) | `cout`, output streams |
| 2 | Simple Sums | [2-SimpleSums.cpp](2-SimpleSums.cpp) | Variables, integer arithmetic, `constexpr` |
| 3 | Biography | [3-Biography.cpp](3-Biography.cpp) | Strings, `getline`, function overloading, exception handling |
| 4 | Primitive Quiz | [4-PrimitiveQuiz.cpp](4-PrimitiveQuiz.cpp) | 2D arrays, range-based `for`, case-insensitive comparison |
| 5 | Days of the Month | [5-DaysOfTheMonth.cpp](5-DaysOfTheMonth.cpp) | `switch` statement |
| 6 | Brute Force Attack | [6-BruteForceAttack.cpp](6-BruteForceAttack.cpp) | `while` loop, attempt counter |
| 7 | Some Counting | [7-SomeCounting.cpp](7-SomeCounting.cpp) | `for` loops with custom step values |
| 8 | Simple Search | [8-SimpleSearch.cpp](8-SimpleSearch.cpp) | Arrays, linear search |
| 9 | Hello | [9-Hello.cpp](9-Hello.cpp) | Function definition and call |
| 10 | Is it Even? | [10-IsItEven.cpp](10-IsItEven.cpp) | Functions, parameters, return values |

---

## Building and Running

Each `.cpp` file is a standalone program. Compile and run any of them with `g++` (C++17 or later):

```bash
g++ -std=c++17 -Wall -Wextra -o coding_is_cool 1-CodingIsCool.cpp
./coding_is_cool
```

To compile every solution at once:

```bash
for f in *.cpp; do g++ -std=c++17 -Wall -Wextra -o "${f%.cpp}" "$f"; done
```

---

## Assignment Brief

Your task is to develop solutions to a series of coding exercises that will test your knowledge of the fundamental programming techniques introduced through the course of the module. These exercises complement the content delivered in class each week and allow you to put into practice what you have learned.

When completing the exercises you should create a new project for each one and save them to this folder. Each exercise should be appropriately named (e.g. `1-CodingIsCool`) so they are easy to find.

---

## Exercises

### 1. Coding is Cool

Fill in the blanks in the code below so the program outputs "Coding is Cool" to the console.

```cpp
#include <iostream>
#include <string>
using namespace std;

int main() {
     _____ << _____ << endl;
}
```

> Solution: [1-CodingIsCool.cpp](1-CodingIsCool.cpp)

---

### 2. Simple Sums

* Declare a variable with data type integer. Initialise with a value of 8.
* Declare a variable with data type integer. Initialise with a value of 10.
* Declare a third variable of data type integer that adds the previous variables together.
* Print the value of the sum to the console.

> Solution: [2-SimpleSums.cpp](2-SimpleSums.cpp)

---

### 3. Biography

Create a program that prints your name, hometown and age to the console:

* Each item should be stored using a variable of an appropriate data type.
* Each item should be printed on a new line.
* You can only use `cout` once.

**Advanced requirements**

* Have the user input the values for name, hometown and age.
* Try giving the program both your first and second name when asked. What do you notice? Can you provide a fix?
* Try entering a string or letter value when asked to enter your age. What happens? Can you provide a fix?

*If completing the optional requirements you may use `cout` more than once to request user input. However the output of information must be performed with a single `cout`.*

> Solution: [3-Biography.cpp](3-Biography.cpp) — uses `getline` for multi-word input and `try/catch` around `stoi` for numeric validation.

---

### 4. Primitive Quiz

You have been asked to write a simple question-and-answer programme. There is only one question to answer: *"What is the capital of France?"*.

* The programme should ask the user this question, then prompt for a response.
* The user then types in an answer.
* If the answer is correct, the programme should tell the user that their answer was correct.
* If the answer is incorrect, the programme should tell the user that their answer was wrong.

**Advanced requirements**

* What about capital letters? (e.g. `paris` vs `Paris` vs `PaRis`)
* Add additional questions (e.g. 10 Capital Cities of Europe Quiz).

> Solution: [4-PrimitiveQuiz.cpp](4-PrimitiveQuiz.cpp) — implements a 10-question European capitals quiz with case-insensitive matching.

---

### 5. Days of the Month

Write a program that uses a `switch` statement to tell a user how many days there are in a month. Cases should test a number corresponding to the months (e.g. `1` = January, `12` = December), and each case should print out how many days are in that month.

> Solution: [5-DaysOfTheMonth.cpp](5-DaysOfTheMonth.cpp)

---

### 6. Brute Force Attack

You are an inexperienced hacker trying to find the correct password to enter a safe.

Write a programme that defines the correct password as `12345` and allows users to enter password attempts until they reach the correct answer. The programme should use a **while loop** to allow the user to keep entering password attempts until correct. Once the correct password is entered the program should output an appropriate message, e.g. *"Welcome to the Secure Area"*.

**Optional requirements**

Modify the solution to include a maximum of 5 password attempts. Each time the user enters an incorrect password, they should be told how many attempts remain. If there are 5 failed password attempts, the **while loop** should end and the program should inform the user that the authorities have been alerted!

> Solution: [6-BruteForceAttack.cpp](6-BruteForceAttack.cpp)

---

### 7. Some Counting

Use the `for` loop to complete the following tasks. Print all values to the console in each case:

* Count up from 0 to 50 in increments of 1.
* Count down from 50 to 0 in decrements of 1.
* Count up from 30 to 50 in increments of 1.
* Count down from 50 to 10 in decrements of 2.
* Count up from 100 to 200 in increments of 5.

*All loops may be in a single project.*

> Solution: [7-SomeCounting.cpp](7-SomeCounting.cpp)

---

### 8. Simple Search

Write a simple search engine that tests if a string is present in a string array. The array should be initialised with `"Jake"`, `"Zac"`, `"Ian"`, `"Ron"`, `"Sam"`, `"Dave"`. The string being searched for is `"Sam"`.

The program should loop the array and test each index against the search term. If the search term is found, the program should output an appropriate message.

**Optional requirements**

Allow the user to enter the name to be searched.

> Solution: [8-SimpleSearch.cpp](8-SimpleSearch.cpp)

---

### 9. Hello

Fill in the blanks to complete the code so the function runs and outputs "Hello" to the console.

```cpp
#include <iostream>
using namespace std;

____ hello(){
  ____ << "Hello" << ___;
}

int main(){

  _______

  return 0;
}
```

> Solution: [9-Hello.cpp](9-Hello.cpp)

---

### 10. Is it Even?

Write a program that tests if a value is even. The programme should adhere to the following rules:

* The program should ask the user for a number from within the `main` function.
* The entered number should be **passed** to a function which determines if the value is an even number.
* If the number is even the function should **return** the message *"The provided number is even"*.
* If the number is odd the function should **return** the message *"The provided number is odd"*.
* The returned message should be output from within the `main` function.

> Solution: [10-IsItEven.cpp](10-IsItEven.cpp)
