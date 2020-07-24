import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Linking up Images

  AssetImage Cross = AssetImage("images/cross.png");

  AssetImage Circle = AssetImage("images/Circle.png");

  AssetImage edit = AssetImage("images/edit.png");

  bool isCross = true;

  String message;

  List<String> gameState;

  //TODO : Initilize the state of the box with empty

  @override
  void initState() {
    super.initState();

    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];

      this.message = "";
    });
  }

  //PlayGame Method

  playGame(int index){
    if (this.gameState[index] == "empty"){
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "Cross";
        }
        else {
          this.gameState[index] = "Circle";
        }
        this.isCross = !this.isCross;
        checkWin();
      });
    }
  }

  // Reset Game Method

    ResetGame() {
     setState(() {
       this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];

      this.message = "";
     });
    }

  //Get Image Method

  AssetImage getImage(String value) {
    switch (value) {
      case ("empty"):
        return edit;
        break;

        case ("Cross"):
        return Cross;
        break;

        case ("Circle"):
        return Circle;
        break;
        }
    }

  //Check for win logic
  checkWin() {

    //ROW 1
     if  ((gameState[0] != "empty") &&
         (gameState[0] == gameState[1]) &&
         (gameState[1] == gameState[2])
     ){
       setState(() {
         this.message = "${gameState[0]} WINS !";
         this.gameState = ["empty","empty","empty","empty","empty","empty","empty","empty","empty"];
       });
     }

    //ROW 2
     else if((gameState[3] != "empty") &&
         (gameState[3] == gameState[4]) &&
         (gameState[4] == gameState[5])
     ){
       setState(() {
         this.message = "${gameState[3]} WINS !";
         this.gameState = ["empty","empty","empty","empty","empty","empty","empty","empty","empty"];
       });
     }
    
    //ROW 3
    else if((gameState[6] != "empty") &&
         (gameState[6] == gameState[7]) &&
         (gameState[7] == gameState[8])
     ){
       setState(() {
         this.message = "${gameState[6]} WINS !";
         this.gameState = ["empty","empty","empty","empty","empty","empty","empty","empty","empty"];
       });
     }

     //COLUMN 1
     else if((gameState[0] != "empty") &&
         (gameState[0] == gameState[3]) &&
         (gameState[3] == gameState[6])
     ){
       setState(() {
         this.message = "${gameState[0]} WINS !";
         this.gameState = ["empty","empty","empty","empty","empty","empty","empty","empty","empty"];
       });
     }

     //COLUMN 2
     else if((gameState[1] != "empty") &&
         (gameState[1] == gameState[4]) &&
         (gameState[4] == gameState[7])
     ){
       setState(() {
         this.message = "${gameState[1]} WINS !";
         this.gameState = ["empty","empty","empty","empty","empty","empty","empty","empty","empty"];
       });
     }

     //COLUMN 3
     else if((gameState[2] != "empty") &&
         (gameState[2] == gameState[5]) &&
         (gameState[5] == gameState[8])
     ){
       setState(() {
         this.message = "${gameState[2]} WINS !";
         this.gameState = ["empty","empty","empty","empty","empty","empty","empty","empty","empty"];
       });
     }

     //DIAGONAL 1 (\)
     else if((gameState[0] != "empty") &&
         (gameState[0] == gameState[4]) &&
         (gameState[4] == gameState[8])
     ){
       setState(() {
         this.message = "${gameState[0]} WINS !";
         this.gameState = ["empty","empty","empty","empty","empty","empty","empty","empty","empty"];
       });
     }

     //DIAGONAL 2 (/)
     else if((gameState[2] != "empty") &&
         (gameState[2] == gameState[4]) &&
         (gameState[4] == gameState[6])
     ){
       setState(() {
         this.message = "${gameState[2]} WINS !";
         this.gameState = ["empty","empty","empty","empty","empty","empty","empty","empty","empty"];
       });
     }

     else if (!gameState.contains("empty")){
       setState(() {
         this.message = "Game Draw !!";
       });
     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIC TAC TOE"),
        centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            // GRIDVIEW FOR THE GAME
            Expanded(child: 
            GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                ),
                itemCount: 9,
                itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: MaterialButton(
                    onPressed: () {
                      this.playGame(i);
                    },
                    child: Image(
                      image: this.getImage(this.gameState[i])
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(this.message,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold, 
                ),
              ),
            ),

            // RESET GAME BUTTON
            MaterialButton(
              color: Colors.purple,
              minWidth: 300.0,
              height: 50.0,
              child: Text("RESET GAME",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
              ),
              onPressed: (){
              this.ResetGame();
            }),

            // SOME WATERMARK :)
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "INDIAN DEV",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
    );
  }
}