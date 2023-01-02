import 'package:flutter/material.dart';
import 'package:spms/common/app_colors.dart';

/*
Title:SettingButton 
Purpose:SettingButton
Created By:Isuru Weerasinghe
Created Date:20 Feb 2022
*/

class SettingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: AppColors.txtGry,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.settings,
      ),
    );
  }
}
