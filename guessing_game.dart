import 'dart:io';
import 'dart:math';

void main() {
  List<String> wordList = [
    "abruptly",
    "absurd",
    "abyss",
    "affix",
    "askew",
    // Add more words here
  ];

  String pickRandomWord() {
    return wordList[new Random().nextInt(wordList.length)];
  }

  List<String> makeWordClassified(String word) {
    return List.filled(word.length, "_");
  }

  void guess() {
    String word = pickRandomWord();
    List<String> classifiedWord = makeWordClassified(word);
    print(classifiedWord.join(" "));

    int totalAttempts = 0;
    while (totalAttempts < 7) {
      stdout.write("Guess a letter (Write only one letter): ");
      String answer = stdin.readLineSync()!.toLowerCase();
      if (answer.length != 1) {
        print("Only one letter at a time!");
        continue;
      }//helow again
      totalAttempts++;

      bool found = false;
      for (int i = 0; i < word.length; i++) {
        if (answer == word[i]) {
          classifiedWord[i] = answer;
          found = true;
        }//hellow how are 
      }

      if (classifiedWord.join() == word) {
        print("You won!");
        return;
      }

      print(classifiedWord.join(" "));
      print("Total attempts left: ${7 - totalAttempts}");
      if (!found && totalAttempts >= 7) {
        print("Sorry but you lost!");
        String tryAgain = "";
        while (tryAgain != "y" && tryAgain != "n") {
          stdout.write("Do you want to try again? (y/n): ");
          tryAgain = stdin.readLineSync()!.toLowerCase();
          if (tryAgain == "y") {
            guess();
          } else if (tryAgain == "n") {
            print("Goodbye!");
            return;
          }
        }
      }
    }
  }

  guess();
}