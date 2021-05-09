import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:minerva/bloc/word/word_bloc.dart';
import 'package:minerva/bloc/word/word_event.dart';
import 'package:minerva/bloc/word/word_state.dart';
import 'package:minerva/pages/item_page.dart';

class MainPage extends StatefulWidget {
  MainPage({
    Key key
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{

  @override
  void initState() { 
    super.initState();
    BlocProvider.of<WordBloc>(context).add(
      GetRandomWord(),
    );
  }

  
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
            SizedBox(height: 32),
            BlocBuilder<WordBloc, WordState>(
              builder: (context, state){
                if(state is WordSuccess) {
                  var data = state.data;
                  return SizedBox(
                    width: width,
                    height: 568,
                    child: PageView.builder(
                      controller: PageController(
                          viewportFraction: 0.88,
                          initialPage: 0,
                      ),
                      itemCount: data.length,
                      itemBuilder: (context, index){
                        return ItemPage(
                          text: data[index].word,
                          pronounce: data[index].pronounce,
                          desc: data[index].indoDesc,
                        );
                      }
                    ),
                  );
                } else if (state is WordLoading) {
                   return Container(
                    height: 400,
                    child: Center(
                      child : SpinKitChasingDots(
                        color: Theme.of(context).primaryColor,
                        size: 50.0,
                      )
                    ),
                  );
                } else {
                  return Center(
                    child : Text("Not Found")
                  );
                }
              }
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