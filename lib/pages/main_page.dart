import 'package:flutter/material.dart';
import 'package:minerva/model/word_model.dart';
import 'package:minerva/pages/item_page.dart';

class MainPage extends StatefulWidget {
  MainPage({
    Key key
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  
  List<WordModel> _listDummy =  [
      WordModel(
        word:"swimming",
        example : "It also meant, if the worst came to the worst, I could actually jump in and swim across and drag the sledge over after me."
      ),
      WordModel(
        word:"read",
        example : "what are you reading at the moment?"
      ),
      WordModel(
        word:"home",
        example : "It turns out your hospitals are killing people, and they should be at home. "
      ),
      WordModel(
        word:"epoch",
        example : "Epoch is defined as an important period in history or an era."
      )
  ];
  
  Widget _buildBody() {
    double width = MediaQuery. of(context). size. width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(

        // padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical:40, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Minerva",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Word",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            SizedBox(height: 48),
            SizedBox(
              width: width,
              height: 568,
              child: PageView.builder(
                controller: PageController(
                    viewportFraction: 0.9,
                    initialPage: 0,
                ),
                itemCount: _listDummy.length,
                itemBuilder: (context, index){
                  return ItemPage(
                    text: _listDummy[index].word,
                    example: _listDummy[index].example,
                  );
                }
              )
            )
          ],
        ),

      )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildBody()
    );
  }
}