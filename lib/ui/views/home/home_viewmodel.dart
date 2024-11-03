import 'dart:math';

import 'package:rock_paper_scissors/app/app.dialogs.dart';
import 'package:rock_paper_scissors/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  String get scoreLabel => score.toString();

  int score = 0;
  String playerChoice = "";
  String cpuChoice = "";
  String result = "";

  void incrementScore() {
    score++;
    rebuildUi();
  }

  void decrementScore() {
    score--;
    rebuildUi();
  }

  void pick(String hand) async {
    playerChoice = hand;
    await showChoice();
  }

  Future<void> showChoice() async {
    rebuildUi();
    await Future.delayed(const Duration(milliseconds: 1000));
    cpuChoice = requestCPUChoice();
    rebuildUi();
    await Future.delayed(const Duration(milliseconds: 500));
    result = determineResult();
    rebuildUi();
  }

  String requestCPUChoice() {
    var availableChoices = ["paper", "scissors", "rock"];
    var randomIndex = Random().nextInt(availableChoices.length);
    return availableChoices[randomIndex];
  }

  String determineResult() {
    if (playerChoice == cpuChoice) {
      // If both players chose the same, it's a tie
      return "tie";
    }

    // Define the win conditions for player
    if ((playerChoice == "rock" && cpuChoice == "scissors") ||
        (playerChoice == "scissors" && cpuChoice == "paper") ||
        (playerChoice == "paper" && cpuChoice == "rock")) {
      incrementScore();
      return "win";  // Player wins
    } else {
      decrementScore();
      return "loose";  // Player loses
    }
  }

  void resetGame(){
    playerChoice = "";
    cpuChoice = "";
    result = "";
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.rules,
      title: 'RULES',
      description: '',
    );
  }
}
