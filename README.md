# Tic Tac Toe

## steps to run the game
- using android studio plateform
- select the main dart file "tictactoe"
- press run button
---

```dart 
void main() {
  GameTicTacToe TicTacToe = GameTicTacToe();
  //Start game
  TicTacToe.start();
}
```
---
```dart 
  void start(){
    SelectSymbol();
    noOneWin == true;
    while(noOneWin){
      getBoard();
      stdout.write('Player $playerNumber Enter your place to place $playerSymbol\n');
      put = int.parse(stdin.readLineSync()!);
      checkSaveMove();
    }
    playagain();
  }
```
`1SelectSymbol` The function allows you to choose between X or O

