import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spms/common/app_assets.dart';
import 'package:spms/common/app_colors.dart';
import 'package:spms/common/common.dart';

/*
Title:SendMoneyWidget
Purpose:SendMoneyWidget
Created By:Isuru Weerasinghe
Created Date:20 Feb 2022
*/
class precord extends StatefulWidget {
  // final String p1;
  final plist;
  final Function() notifyParent;
  precord({required this.plist, required this.notifyParent});
  @override
  _precordState createState() => _precordState();
}

class _precordState extends State<precord> {
  @override
  void initState() {
    super.initState();
  }

  Widget getTextWidgets() {
    List<Widget> list = <Widget>[];
    if (widget.plist != null) {
      widget.plist.forEach((entry) {
        // String id = entry["Serviceno"];
        // String nom = entry["Rank"];
        // String adresse = entry["Name"];
        //
        // print("id: $id, nom: $nom, adresse: $adresse");
        list.add(itemWidget(
            name: entry["Serviceno"] + " " + entry["Rank"],
            amount: entry["Name"],
            icon: AppAssets.user1));
      });
    }
    ;

    return new Column(children: list);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: appContainerDecoration,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Performance Record",
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),
              Spacer(),
              // Text(
              //   "Recent",
              //   style: TextStyle(color: AppColors.white),
              // ),
              SizedBox(
                width: 5,
              ),
              // Icon(
              //   Icons.keyboard_arrow_down,
              //   color: AppColors.txtGry,
              //   size: 20,
              // ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // if(widget.plist!=null)...{
          //
          //   getTextWidgets(),
          // },
          itemWidget(
              name: 'Defence Service', amount: '', icon: AppAssets.user1),
          itemWidget(name: 'National Games', amount: '', icon: AppAssets.user1),
          itemWidget(
              name: 'International Games', amount: '', icon: AppAssets.user1),
          itemWidget(name: 'Other Games', amount: '', icon: AppAssets.user1),
        ],
      ),
    );
  }

  Widget itemWidget({
    String? icon,
    String? name,
    String? amount,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(1000),
          //   child: Container(
          //     height: 40,
          //     width: 40,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: AppColors.jiraBgColor,
          //     ),
          //     // padding: EdgeInsets.all(10),
          //     child: Image.asset(
          //       icon!,
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   width: 20,
          // ),
          Expanded(
            child: Text(
              "$name",
              style: TextStyle(color: AppColors.white),
            ),
          ),
          Text(
            "$amount",
            style: TextStyle(color: AppColors.white),
          ),
          SizedBox(
            width: 20,
          ),
          // Container(
          //   height: 35,
          //   width: 35,
          //   decoration: BoxDecoration(
          //     color: Color(0xfffffff),
          //     shape: BoxShape.circle,
          //   ),
          //   child: IconButton(icon:
          //   Icon(Icons.arrow_right_alt),onPressed: (){
          //     isselfplay=true!;
          //     isshown=false;
          //     isshowndb=false;
          //
          //     isshownplayer=false;
          //     widget.notifyParent();
          //   },
          //     color: AppColors.white,iconSize: 20,
          //   ),
          // )
        ],
      ),
    );
  }
}
