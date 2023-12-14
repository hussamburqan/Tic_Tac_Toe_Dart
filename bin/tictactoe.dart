import 'dart:io';

void main() {
  GameTicTacToe TicTacToe = GameTicTacToe();
  //Start game
  TicTacToe.start();
}

class GameTicTacToe{
  List<dynamic> board = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  String playerSymbol = 'X';
  int playerNumber = 1;
  late int put;
  int playTimes = 0;
  bool noOneWin = true ;

  void start(){
    SelectSymbol();
    noOneWin == true;

    while(noOneWin){
      getBoard();
      stdout.write('Player $playerNumber Enter your place to place $playerSymbol\n');
      put = int.parse(stdin.readLineSync()!); //Taking input from player
      checkSavePut();
    }
    playagain();
  }

  void SelectSymbol(){
    stdout.write('Player $playerNumber Select \n1 for Symbol \'O\' \n2 for Symbol \'X\'\n');
    int No = int.parse(stdin.readLineSync()!);
    if (No == 1){
      playerSymbol = 'O';
    }else if(No == 2) {
      playerSymbol = 'X';
    }
  }

  void playagain(){
    stdout.write('-------------------------------------------------------------------------\n');
    stdout.write('If you want to play again, press 1, and if not, press 0\n');
    stdout.write('-------------------------------------------------------------------------\n');

    int playagain = int.parse(stdin.readLineSync()!);

    if(playagain == 1){
      board = [0, 1, 2, 3, 4, 5, 6, 7, 8];
      playTimes = 0;
      noOneWin = true ;
      start();
    } else
    if(playagain == 0){
      stdout.write('Thank you for playing the game');
    }else {
      stdout.write('Invaild input\n');
    }
  }

  void checkSavePut(){
    //The site is checked if it is empty.
    if(board[put] == 'X'|| board[put] == 'O'){
      stdout.write('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
      stdout.write('Invaild input\n');
      stdout.write('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
    }
    else
    {
      board[put] = playerSymbol;
      playTimes++;
      playerSymbol = getPlayerSymbols(playerSymbol);
      playerNumber = getPlayerNumber(playerNumber);
      noOneWin = checkWin();
    }
  }

  bool checkWin() {
    for (int i = 0; i < 3; i++) {
      //I check the columns and rows when it wins ,Ex:
      // X|1|2
      // X|4|5
      // X|7|8
      if ((board[i] == board[i + 3] && board[i + 3] == board[i + 6])
          || (board[i * 3] == board[i * 3 + 1] && board[i * 3 + 1] == board[i * 3 + 2]))
      {
        stdout.write('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
        stdout.write('Player ${board[i]} wins!\n');
        stdout.write('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
        getBoard();
        return false;
      }
    }

    // I check the diameter when it wins ,Ex:
    // X|1|2
    // 3|X|5
    // 6|7|X
    if ((board[0] == board[4] && board[0] == board[8]) ||
        (board[2] == board[4] && board[2] == board[6]))
    {
      stdout.write('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
      stdout.write('Player ${board[4]} wins!\n');
      stdout.write('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
      getBoard();
      return false;
    }
    //This checks how many times they have played and they cannot play more than 9 times,
    if (playTimes == 9) {
      stdout.write('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
      stdout.write('It\'s a draw!\n');
      stdout.write('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
      getBoard();
      return false;
    }
    //If any condition is not met, the game continues,
    return true;
  }

  int getPlayerNumber(int playerNumber){
    //Change player
    return  playerNumber = playerNumber == 1 ? 2 : 1;
  }

  String getPlayerSymbols(String playerSymbol){
    //Change the player's symbol
    return playerSymbol = playerSymbol == 'X' ? 'O' : 'X';
  }

  void getBoard() {
    //Print Board ,Ex:
    // 0|1|2
    // 3|4|5
    // 6|7|8
    for (int i = 0; i < board.length; i++) {
      stdout.write('${board[i]}');
      if (i == 2 || i == 5 || i == 8)
      {
        stdout.write('\n');
      } else  {stdout.write('|');}
    }
  }
}
