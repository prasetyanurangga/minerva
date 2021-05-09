import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_tts/flutter_tts.dart';

class ItemPage extends StatefulWidget {

  ItemPage({
    Key key,
    @required this.text,
    @required this.desc,
    @required this.pronounce,
    this.color
  }) : super(key: key);

  final String text;
  final String desc;
  final String pronounce;
  final Color color;

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage>   with SingleTickerProviderStateMixin {

  AnimationController _rotatenAnimationController;
  FlutterTts _flutterTts;
  bool _ttsStart = false;

  @override
  void initState() {
    super.initState();
     _flutterTts = FlutterTts();
    _rotatenAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 400),
    );

    _flutterTts.setStartHandler(() {
      setState(() => _ttsStart = true);
    });

    _flutterTts.setCompletionHandler(() {
      setState(() => _ttsStart = false);
    });
  }

  @override
  void dispose() {
    _rotatenAnimationController.dispose();
    super.dispose();
  }

  void _speak() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.8);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(widget.text);
  }

  bool _open = false;

  Widget _itemBuild() {

    double width = MediaQuery. of(context). size. width;
    return Container(
      padding: EdgeInsets.all(16),
      width: width,
      height: 568,
      child: Stack(
        children: [
          Container(
            width: width,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Theme.of(context).primaryColor,
            ),
          ),


          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOutQuart,
            bottom: _open ? 0 : 168,
            left: 0,
            right: 0,
            child: Container(
              width: width,
              height: 176,
              padding: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Theme.of(context).primaryColor,
              ),
              child : AnimatedOpacity(
                opacity: _open ? 1 : 0,
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOutQuart,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).backgroundColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      widget.desc.length > 180 ? widget.desc.substring(0,177)+"..." : widget.desc,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).backgroundColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),

          
      
          Container(
            height: 400,
            width: width,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).backgroundColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 24,
                      color: Color(0xFF5A54C2),
                      icon : Icon(Icons.volume_up_rounded),
                      onPressed: (){
                        print(_ttsStart);
                        _speak();
                      },
                    ),
                    TextButton(
                      onPressed: (){
                        print(_ttsStart);
                        _speak();
                      },
                      child: Text(
                        widget.pronounce,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).backgroundColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],

                ),
                SizedBox(height: 48),
                GestureDetector(
                  onTap: () {
                    if(!_open){

                      _rotatenAnimationController.forward(from : 0.0);
                    } else {

                      _rotatenAnimationController.reverse();
                    }


                  print(math.pi);
                    
                    setState(() => _open = !_open );
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOutQuart,
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Theme.of(context).backgroundColor,
                      boxShadow: [
                        // BoxShadow(
                        //   offset: Offset(0, 16),
                        //   color: _open ? Colors.grey[400].withOpacity(0.3) : Colors.transparent,
                        //   blurRadius: 10,
                        // )
                        BoxShadow(
                          offset: Offset(0, 22),
                          color: _open ? Colors.black.withOpacity(0.12) : Colors.transparent,
                          blurRadius: 40,
                        )
                      ]
                    ),
                    child: RotationTransition(
                      turns: Tween(begin: 0.0, end: 0.5).animate(_rotatenAnimationController),
                      child: Icon(
                        Icons.arrow_downward,
                        color: Theme.of(context).primaryColor
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return _itemBuild();
  }
}