# Boggle Solver

This project is a MATLAB-based solution for programmatically controlling a mouse to solve a Boggle game. The script uses a recursive branching algorithm to navigate through a grid, starting from the top left and moving right and down, comparing potential word branches against a Scrabble dictionary to find valid words.

## Prerequisites

- MATLAB installed on your system.
- A Scrabble dictionary file named `words2.txt` in the same directory as the scripts.

## Setup Instructions

1. **Install MATLAB**: Ensure that MATLAB is installed on your system. You can download it from the [MathWorks website](https://www.mathworks.com/products/matlab.html).

2. **Prepare the Dictionary**: Place a text file named `words2.txt` in the same directory as the scripts. This file should contain a list of valid Scrabble words, one per line.

3. **Run the Script**:
   - Open MATLAB.
   - Navigate to the directory containing the scripts.
   - Run the `main_v2.m` script by typing `main_v2` in the MATLAB command window and pressing Enter.

4. **Interact with the Script**:
   - The script will prompt you to enter the letters on the Boggle board. Input them as a single string when prompted.
   - Follow the on-screen instructions to set the grid's corners by moving the mouse to the specified locations and pressing Enter.
   - The script will automatically attempt to solve the Boggle board by moving the mouse to trace out words.

5. **Video Demonstration**: For a visual demonstration of the script in action, you can watch the video [here](https://youtu.be/mM5ehtiW1OM).

## Script Descriptions

- **`main_v2.m`**: The primary script that initializes the board, takes user input for the letters, and controls the mouse to solve the Boggle game.
- **`dict.m`**: Loads the dictionary from `words2.txt` into a character array.
- **`fill_matrices.m`**: Fills the board matrix with the input letters and handles board rotation.
- **`find_complete_word.m`**: Checks if a complete word is found in the current path.
- **`find_next_letter.m`**: Determines the next letter to move to based on the most common next letters.
- **`move.m`**: Controls the mouse to trace out the found words on the screen.
- **`reduce_dict.m`**: Reduces the dictionary to only include words that start with the current letter.
- **`surrounding_letters.m`**: Finds the surrounding letters that have not been used in the current path.

## Additional Information

- The script uses Java's `Robot` class to control the mouse, so ensure that Java is properly configured in your MATLAB environment.
- The script is designed to work on a 4x4 Boggle board.

By following these instructions, you should be able to set up and run the Boggle solver script successfully. Enjoy solving Boggle games programmatically!