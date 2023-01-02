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

class SendMoneyWidget extends StatelessWidget {
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
                "Top Players",
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),
              Spacer(),
              Text(
                "Recent",
                style: TextStyle(color: AppColors.white),
              ),
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
          itemWidget(
              name: "LAC Samarasinghe NC",
              amount: "Cricket",
              icon: AppAssets.user1),
          itemWidget(
              name: "Cpl Wijekumara TR",
              amount: "Badminton",
              icon: AppAssets.user2),
          itemWidget(
              name: "LAC Wijesighe VC",
              amount: "Volley Ball",
              icon: AppAssets.user3),
          itemWidget(
              name: "Sgt Thissa DFD", amount: "Carom", icon: AppAssets.user4),
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
              child: Image.asset(
                icon!,
                fit: BoxFit.cover,
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
              color: Color(0xfffffff),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_right_alt,
              color: AppColors.white,
            ),
          )
        ],
      ),
    );
  }
}
