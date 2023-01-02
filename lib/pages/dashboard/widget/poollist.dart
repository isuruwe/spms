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
class poollist extends StatefulWidget {
  final Function() notifyParent;
  poollist({required this.notifyParent});
  @override
  _poollistState createState() => _poollistState();
}

class _poollistState extends State<poollist> {
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
                "SPORTS POOL",
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
              Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.txtGry,
                size: 20,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          IntrinsicHeight(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                child: itemWidget2(
                    name: "Cricket", amount: "", icon: Icons.sports_cricket),
              ),
              Expanded(
                child: Column(children: [
                  itemWidget(
                      name: "Staff",
                      amount: "",
                      icon: Icons.person,
                      type: '2',
                      pool: '1'),
                  itemWidget(
                      name: "Players",
                      amount: "",
                      icon: Icons.people,
                      type: '1',
                      pool: '1')
                ]),
              ),
            ]),
          ),
          const Divider(
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 0,
            color: Colors.black,
          ),
          IntrinsicHeight(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                child: itemWidget2(
                    name: "Volley Ball",
                    amount: "",
                    icon: Icons.sports_volleyball),
              ),
              Expanded(
                child: Column(children: [
                  itemWidget(
                      name: "Staff",
                      amount: "",
                      icon: Icons.person,
                      type: '2',
                      pool: '8'),
                  itemWidget(
                      name: "Players",
                      amount: "",
                      icon: Icons.people,
                      type: '1',
                      pool: '8')
                ]),
              ),
            ]),
          ),
          const Divider(
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 0,
            color: Colors.black,
          ),
          IntrinsicHeight(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                child: itemWidget2(
                    name: "Rugby", amount: "", icon: Icons.sports_rugby),
              ),
              Expanded(
                child: Column(children: [
                  itemWidget(
                      name: "Staff",
                      amount: "",
                      icon: Icons.person,
                      type: '2',
                      pool: '9'),
                  itemWidget(
                      name: "Players",
                      amount: "",
                      icon: Icons.people,
                      type: '1',
                      pool: '9')
                ]),
              ),
            ]),
          ),
          const Divider(
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 0,
            color: Colors.black,
          ),
          IntrinsicHeight(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                child: itemWidget2(
                    name: "Motor Racing",
                    amount: "",
                    icon: Icons.sports_motorsports),
              ),
              Expanded(
                child: Column(children: [
                  itemWidget(
                      name: "Staff",
                      amount: "",
                      icon: Icons.person,
                      type: '2',
                      pool: '2'),
                  itemWidget(
                      name: "Players",
                      amount: "",
                      icon: Icons.people,
                      type: '1',
                      pool: '2')
                ]),
              ),
            ]),
          ),
          const Divider(
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 0,
            color: Colors.black,
          ),
          IntrinsicHeight(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                child: itemWidget2(
                    name: "Angampora",
                    amount: "",
                    icon: Icons.sports_martial_arts),
              ),
              Expanded(
                child: Column(children: [
                  itemWidget(
                      name: "Staff",
                      amount: "",
                      icon: Icons.person,
                      type: '2',
                      pool: '3'),
                  itemWidget(
                      name: "Players",
                      amount: "",
                      icon: Icons.people,
                      type: '1',
                      pool: '3')
                ]),
              ),
            ]),
          ),
          const Divider(
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 0,
            color: Colors.black,
          ),
          IntrinsicHeight(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                child: itemWidget2(
                    name: "Aquatic", amount: "", icon: Icons.sports_handball),
              ),
              Expanded(
                child: Column(children: [
                  itemWidget(
                      name: "Staff",
                      amount: "",
                      icon: Icons.person,
                      type: '2',
                      pool: '4'),
                  itemWidget(
                      name: "Players",
                      amount: "",
                      icon: Icons.people,
                      type: '1',
                      pool: '4')
                ]),
              ),
            ]),
          ),
          const Divider(
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 0,
            color: Colors.black,
          ),
          IntrinsicHeight(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                child: itemWidget2(
                    name: "Aquatic", amount: "", icon: Icons.sports_handball),
              ),
              Expanded(
                child: Column(children: [
                  itemWidget(
                      name: "Staff",
                      amount: "",
                      icon: Icons.person,
                      type: '2',
                      pool: '4'),
                  itemWidget(
                      name: "Players",
                      amount: "",
                      icon: Icons.people,
                      type: '1',
                      pool: '4')
                ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget itemWidget({
    IconData? icon,
    String? name,
    String? amount,
    required String type,
    required String pool,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.jiraBgColor,
              ),
              // padding: EdgeInsets.all(10),
              child: Icon(
                icon,
                color: Colors.deepOrangeAccent,
                size: 36.0,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
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
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Color(0xfe7e3e3),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_right_alt),
              onPressed: () {
                isshownplayer = true!;
                appno = type;
                poolno = pool;
                widget.notifyParent();
              },
              color: AppColors.white,
              iconSize: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget itemWidget2({
    IconData? icon,
    String? name,
    String? amount,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.jiraBgColor,
              ),
              // padding: EdgeInsets.all(10),

              child: Icon(
                icon,
                color: Colors.blue,
                size: 36.0,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
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
        ],
      ),
    );
  }
}
