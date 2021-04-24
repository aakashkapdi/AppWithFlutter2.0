import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vpa/Initialisation.dart';
import 'package:vpa/Mute.dart';
import 'package:vpa/Utilities.dart';
import 'Size_Config.dart';
import 'TextToSpeech.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final tts = TextToSpeech();

  @override
  Widget build(BuildContext context) {
    tts.tellCurrentScreen("home");
    SizeConfig().init(context);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("360 VPA"),
          backgroundColor: Color(0xFF1C3BC8),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragUpdate: (details) {
            if (details.primaryDelta < -20) {
              tts.tellDateTime();
            }
            if (details.primaryDelta > 20) {
              tts.tellCurrentScreen("Home");
            }
          },
          child: Column(
            children: <Widget>[
              Container(
                height: SizeConfig.safeBlockVertical * 49.5 - 28,
                width: SizeConfig.safeBlockHorizontal * 100,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Container(
                        height: SizeConfig.safeBlockVertical * 49.5 - 28,
                        width: SizeConfig.safeBlockHorizontal * 49,
                        color: Colors.purple,
                        child: ElevatedButton(
                          onPressed: () {
                            tts.tellPress("Send S O S");
                          },
                          onLongPress: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF266EC0)),
                          child: Text(
                            "SEND SOS",
                            style: TextStyle(
                                fontSize: 21.0,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          ),
                        )),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 49.5 - 28,
                      width: SizeConfig.safeBlockHorizontal * 2,
                    ),
                    Container(
                        height: SizeConfig.safeBlockVertical * 49.5 - 28,
                        width: SizeConfig.safeBlockHorizontal * 49,
                        color: Colors.purple,
                        child: ElevatedButton(
                          onPressed: () {
                            tts.tellPress("MUTE AUDIO");
                          },
                          onLongPress: () {
                            Navigator.pushNamed(context, '/mute');
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF00B1D2)),
                          child: Text(
                            "MUTE AUDIO",
                            style: TextStyle(
                                fontSize: 21.0,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 1,
                width: SizeConfig.safeBlockHorizontal * 100,
              ),
              Container(
                height: SizeConfig.safeBlockVertical * 49.5 - 28,
                width: SizeConfig.safeBlockHorizontal * 100,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Container(
                        height: SizeConfig.safeBlockVertical * 49.5 - 28,
                        width: SizeConfig.safeBlockHorizontal * 49,
                        color: Colors.purple,
                        child: ElevatedButton(
                          onPressed: () {
                            tts.tellPress("UTILITIES");
                          },
                          onLongPress: () {
                            Navigator.pushNamed(context, '/utilities');
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF00B1D2)),
                          child: Text(
                            "UTILITIES",
                            style: TextStyle(
                                fontSize: 21.0,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          ),
                        )),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 49.5 - 28,
                      width: SizeConfig.safeBlockHorizontal * 2,
                    ),
                    Container(
                        height: SizeConfig.safeBlockVertical * 49.5 - 28,
                        width: SizeConfig.safeBlockHorizontal * 49,
                        color: Colors.purple,
                        child: ElevatedButton(
                          onPressed: () {
                            tts.tellPress("INITIALISATION");
                          },
                          onLongPress: () {
                            Navigator.pushNamed(context, '/initialisation');
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF266EC0)),
                          child: Text(
                            "INITIALISATION",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
