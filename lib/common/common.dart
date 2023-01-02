import 'package:flutter/cupertino.dart';
bool isshown=false;
bool isshowndb=true;
bool isshownplayer=false;
bool isselfplay=false;
bool isupdateplayer=false;
String appno="2";
String poolno="1";
String? selserno="";
int flx=3;
BoxDecoration appContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  border: Border.all(color: Color(0xff19253f), width: 2),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff19315d),
      Color(0xff19253f),
    ],
  ),
);
