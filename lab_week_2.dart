import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  // List of words
  List<String> ListOfWords = ["Banana", "Ear", "Apple", "Blue", "Destruction", "Security", "Cat"];

  // Pick a random word
  Random random = Random();
  String randomWord = ListOfWords[random.nextInt(ListOfWords.length)].toLowerCase();

  // === Constructors from flowchart ===
  List<String> letterGuess = []; // LetterGuess = []
  int loopCheck = 0;             // LoopCheck = 0
  int lives = 6;                 // Lives = 6
  int lettersUsed = 0;           // Letters used = 0
  List<String> letterSpace = []; // LetterSpace = []

  // Fill LetterGuess with "*"
  for (int i = 0; i < randomWord.length; i++) {
    letterGuess.add("*");
  }

  print("Letter guess: ${letterGuess.join()}");
  print("Welcome to hangman, let's start playing!");

  while (letterGuess.join('') != randomWord && lives > 0) {
    print("You have $lives lives left.");
    print("Please enter a letter to guess:");
    String? userInput = stdin.readLineSync();

    if (userInput == null || userInput.length != 1 || !RegExp(r'^[a-zA-Z]$').hasMatch(userInput)) {
      print("Invalid input. Please enter a single letter.");
      continue;
    }

    String guessedLetter = userInput.toLowerCase();

    if (letterSpace.contains(guessedLetter)) {
      print("You have already guessed that letter. Try again.");
      continue;
    }

    letterSpace.add(guessedLetter);
    lettersUsed++;

    bool found = false;
    for (int i = 0; i < randomWord.length; i++) {
      if (randomWord[i] == guessedLetter) {
        letterGuess[i] = guessedLetter;
        found = true;
      }
    }
    if (found) {
      print("Good guess!");
    } else {
      lives--;
      print("Wrong guess!");
    }

    print("Letter guess: ${letterGuess.join()}");
    print("Letters used: ${letterSpace.join(", ")}");
    loopCheck++;
    print("LoopCheck count this round: $loopCheck");
  }
  if (letterGuess.join('') == randomWord) {
    print("\nCongratulations! You've guessed the word: $randomWord");
  } else {
    print("\nGame over! The word was: $randomWord");
  }
}