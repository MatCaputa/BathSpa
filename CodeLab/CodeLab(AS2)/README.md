# S2 — Utility App
**Language:** C++

A console-based **Vending Machine** application that demonstrates the more advanced techniques covered in the module — functions, error checking, and object-oriented programming — built on top of the fundamentals from [S1](../CodeLab(AS1)/).

---

## Solution

| File | Description |
| --- | --- |
| [main.cpp](main.cpp) | Vending Machine entry point — menu, item selection, payment handling and change calculation. |

---

## Building and Running

The program is a single C++ application. Compile and run it with `g++` (C++17 or later):

```bash
g++ -std=c++17 -Wall -Wextra -o vending_machine main.cpp
./vending_machine
```

---

## Assignment Brief

Your task is to create a **Vending Machine** program using the C++ programming language.

The Vending Machine must include the following minimum features:

* A menu of drinks and snacks presented via the console. The number and range of items is up to you.
* A set of codes that the user can input to select a particular drink or snack.
* A way of capturing the user's inputted code.
* A way of managing money — the user should be able to input any amount and have the correct change returned.
* A message that tells the user that a particular drink or snack has been dispensed.
* A message that tells the user how much change they have received.
* Comments in the code to explain key operations.

Higher marks are available for additional advanced features such as:

* Categorising menu items to improve the user experience (e.g. *Chocolate*, *Hot Drinks*).
* Allowing users to buy additional items in the same session.
* Appropriate error checking to validate inputs and ensure the user has enough credit.
* An intelligence system for suggesting purchases (e.g. suggesting biscuits after a coffee).
* A stock system so the machine may run out of products.

To achieve marks in the higher boundaries, the implementation should make use of functions and object-oriented programming.

---

## Deliverables

### The Application

The C++ code (e.g. `main.cpp`) and any supplementary assets required to run the vending machine. Submitted as a project saved to this folder and pushed to GitHub before the deadline.

### Development Document

A 1,000–1,500 word document accompanying the code, containing:

* **Specification** *(≈100 words)* — what the program does, the feature list, and a link to the GitHub repository.
* **System Flowchart** *(≈50 words)* — visual depiction of the program's logical flow with a short explanation.
* **Technical Description & Walkthrough** *(500–800 words)* — a 5–8 minute video walkthrough showing the program running and a technical breakdown of the key features. (Approx. 100 words/min counts toward the word total.)
* **Critical Reflection** *(≈250 words)* — what works well, what could be improved, and what skills are needed to make those improvements.
* **Appendix** *(not counted)* — a copy of the source code.
