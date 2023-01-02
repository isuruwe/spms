import 'package:flutter/material.dart';
import 'package:spms/common/app_colors.dart';
import 'package:spms/common/app_responsive.dart';
import 'package:spms/controllers/menu_controller.dart';

import 'package:provider/provider.dart';

import '../common/common.dart';
import 'dashboard/dashboard_page.dart';
import 'widget/header_widget.dart';
import 'widget/side_bar.dart';

/*
Title:HomePage
Purpose:HomePage
Created By:Isuru Weerasinghe
Created Date:
*/

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  refresh() {
    // isshownplayer=false;
    setState(() {
      if(isupdateplayer==true){
        flx=4;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new SideBar(
        notifyParent: refresh,
      ),
      key: UniqueKey(),
      // Provider.of<MenuController>(context, listen: false).scaffoldKey,
      backgroundColor: AppColors.primary,

      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              /// Header
              HeaderWidget(),
              Divider(
                thickness: 0.5,
                color: AppColors.txtGry,
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Side Navigation Menu
                    if (AppResponsive.isDesktop(context))
                      Expanded(
                        child: new SideBar(
                          notifyParent: refresh,
                        ),
                      ),

                    /// Main Body Part
                    Expanded(
                      flex: 4,
                      child: DashboardPage(),
                    ),
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
