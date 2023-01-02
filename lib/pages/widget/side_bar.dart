import 'package:flutter/material.dart';
import 'package:spms/common/app_assets.dart';
import 'package:spms/common/app_colors.dart';

import '../../common/common.dart';

/*
Title:SideBar 
Purpose:SideBar
Created By:Isuru Weerasinghe
Created Date:20 Feb 2022
*/
class SideBar extends StatefulWidget {
  final Function() notifyParent;
  SideBar({required this.notifyParent});
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool dbactive = true;
  bool poolactive = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: AppColors.primary,
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: ListView(
          shrinkWrap: true,
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            menuItem(
                title: "Dashboard",
                logo: AppAssets.dashboard,
                isActive: dbactive,
                ontap: '1',
                cntxt: context),
            menuItem(
                title: "Pool List",
                logo: AppAssets.chat,
                // notification: 2,
                ontap: '2',
                isActive: poolactive,
                cntxt: context),
            menuItem(
                title: "Performance Record",
                logo: AppAssets.calendar,
                cntxt: context),
            menuItem(
                title: "Physical Fitness",
                logo: AppAssets.file,
                cntxt: context),
            menuItem(
                title: "Nutritional Fitness",
                logo: AppAssets.jira,
                cntxt: context),
            menuItem(
                title: "Anti-Doping",
                logo: AppAssets.email,
                ontap: '',
                cntxt: context),
            menuItem(
                title: "Update Player",
                logo: AppAssets.figma,
                ontap: '4',
                cntxt: context),
            // menuItem(
            //   title: "Products",
            //   logo: AppAssets.products,
            // ),
            // SizedBox(
            //   height: 40,
            // ),
            // Text(
            //   "Integrations".toUpperCase(),
            //   style: TextStyle(
            //     color: AppColors.txtGry,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // integrationMenuItem(
            //   title: "Jira Integrations",
            //   logo: AppAssets.jira,
            //   bgColor: AppColors.jiraBgColor,
            // ),
            // integrationMenuItem(
            //   title: "Slack Integrations",
            //   logo: AppAssets.slack,
            //   bgColor: AppColors.slackBgColor,
            // ),
            // integrationMenuItem(
            //   title: "Intercom Integrations",
            //   logo: AppAssets.intercom,
            //   bgColor: AppColors.interComeBgColor,
            // ),
            // integrationMenuItem(
            //   title: "Bitbucket Integrations",
            //   logo: AppAssets.gitlab,
            //   bgColor: AppColors.bitBucketBgColor,
            // ),
            // SizedBox(
            //   height: 40,
            // ),
            // menuItem(
            //   title: "Settings",
            //   logo: AppAssets.dashboard,
            // ),
            // menuItem(
            //   title: "Help and knowledge Base",
            //   logo: AppAssets.dashboard,
            // ),
            menuItem(
                title: "Log Out",
                logo: AppAssets.dashboard,
                ontap: '',
                cntxt: context),
          ],
        ),
      ),
    );
  }

  Widget integrationMenuItem({String? title, String? logo, Color? bgColor}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            padding: EdgeInsets.all(10),
            child: Image.asset(
              logo!,
              height: 28,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Flexible(
            child: Text(
              title!,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget menuItem(
      {String? title,
      String? logo,
      int? notification,
      bool isActive = false,
      String? ontap,
      required BuildContext cntxt}) {
    return ListTile(
      onTap: () {
        print(ontap);
        if (ontap == '1') {
          isshown = false;
          isshowndb = true;
          isselfplay = false;
          isshownplayer = false;
          widget.notifyParent();
        }
        if (ontap == '2') {
          isshownplayer = false;
          isshown = true;
          isshowndb = false;
          isselfplay = false;
          widget.notifyParent();
        }
        if (ontap == '3') {
          isselfplay = true;
          widget.notifyParent();
        }
        if (ontap == '4') {
          isshownplayer = false;
          isshown = false;
          isshowndb = false;
          isselfplay = false;
          isupdateplayer = true;
          widget.notifyParent();
        }
      },
      title: Text(
        title!,
        style: TextStyle(
          color: isActive ? AppColors.white : AppColors.txtGry,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Image.asset(
        logo!,
        height: 18,
        color: isActive ? AppColors.menuSelected : AppColors.txtGry,
      ),
      trailing: notification != null
          ? Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: notification != null
                    ? Color(0xff33b6e0)
                    : AppColors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$notification",
                  style: TextStyle(
                    color: notification != null
                        ? AppColors.white
                        : AppColors.transparent,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          : null,
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
