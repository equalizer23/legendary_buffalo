class StringText {
  static String rules = '''
  Game Board: The game consists of a 5x5 grid, where each cell represents a box. One of the cells contains a bomb, while the others are regular boxes.
  Scoring: Each time you click on a regular box, your score increases by one point.
  Bomb Appearance: At the beginning of the game, the bomb is randomly placed in one of the cells on the game board.
  Clicking: The player can click on any cell to reveal its content. If it is a regular box, the score increases. If it is the bomb, the game ends.
  Time Limit: The game does not have a time limit. The player can continue playing until they click on the bomb.
  Winning: There is no specific winning condition. The player can aim to achieve their highest score.
  Losing: The game ends if the player clicks on the bomb.
  High Score: The game keeps track of the players highest score across multiple plays.
  Restart Option: After the game ends (either by clicking on the bomb or when the player chooses to stop), the player can choose to play again to beat their high score
''';
}
