import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spms/common/app_colors.dart';
import 'package:spms/common/app_responsive.dart';
import 'package:spms/pages/dashboard/widget/meddet.dart';
import 'package:spms/pages/dashboard/widget/playerdet.dart';
import 'package:spms/pages/dashboard/widget/players.dart';
import 'package:spms/pages/dashboard/widget/poollist.dart';
import 'package:spms/pages/dashboard/widget/precord.dart';
import 'package:http/http.dart' as http;

import '../../common/common.dart';
import 'widget/bottom_widget.dart';
import 'widget/download_card_widget.dart';
import 'widget/my_card_widget.dart';
import 'widget/playerupdate.dart';
import 'widget/send_money_widget.dart';
import 'widget/statistic_widget.dart';
import 'widget/time_spend_widget.dart';
import 'widget/trafiic_source_widget.dart';
import 'widget/transaction_widget.dart';



class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var plist=null;
  var pinfo=null;



  Future<List<dynamic>> getplayers(String p1,String p2) async {
    try {
      plist=null;
      String domaine = "135.22.67.71";
      String linkToPhp = "/spms/getplayer.ashx";
      var data = {
        "p1": p1, "p2": p2,
      };
      var uri = Uri.http('135.22.67.71', '/spms/getplayer.ashx',data);
      var response =await http.get(uri);



      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var result = jsonDecode(response.body);
          // print(result.toString());
          if (result == false) {
            return [];
          }
          // name = result['Table'];
          return result['Table'];
          //return [];
        }
        return [];
      } else {
        return [];
        // throw Exception('Erreur connection serveur.');
      }
    }catch(e){
      // print(e.toString());
      return [];
    }
  }
  Future<List<dynamic>> getplayerinfo(String p1,String p2) async {
    try {
      plist=null;
      String domaine = "135.22.67.71";
      String linkToPhp = "/spms/getplayerinfo.ashx";
      var data = {
        "p1": p1, "p2": p2,
      };
      var uri = Uri.http('135.22.67.71', '/spms/getplayerinfo.ashx',data);
      var response =await http.get(uri);



      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var result = jsonDecode(response.body);
          // print(result.toString());
          if (result == false) {
            return [];
          }
          // name = result['Table'];
          return result['Table'];
          //return [];
        }
        return [];
      } else {
        return [];
        // throw Exception('Erreur connection serveur.');
      }
    }catch(e){
      // print(e.toString());
      return [];
    }
  }
  refresh() {
    setState(() {
      getplayers(appno,poolno).then((value) {
        plist = value;


        setState(() {});

        // value.forEach((entry) {
        //   String id = entry["Serviceno"];
        //   String nom = entry["Rank"];
        //   String adresse = entry["Name"];
        //
        //   print("id: $id, nom: $nom, adresse: $adresse");
        // });




      });

      isshownplayer==true;

    });
  }
  refresh2() {
    setState(() {
      getplayerinfo(selserno!,poolno).then((value) {
        pinfo = value;
        if(isselfplay==true){
          flx=1;
        }
        else{
          flx=3;
        }
        setState(() {});

        // value.forEach((entry) {
        //   String id = entry["Serviceno"];
        //   String nom = entry["Rank"];
        //   String adresse = entry["Name"];
        //
        //   print("id: $id, nom: $nom, adresse: $adresse");
        // });




      });

      isshownplayer==true;

    });
  }
  refresh3() {
    setState(() {
      getplayerinfo(selserno!,poolno).then((value) {
        pinfo = value;
        if(isupdateplayer==true){
          flx=1;
        }
        else{
          flx=3;
        }
        setState(() {});


      });

      isshownplayer==true;

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: flx,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (isselfplay==true)...{
                                  BottomWidget(plist: selserno),

                                },
                                if (isshowndb==true)...{

                                  TrafficSourceWidget(),
                                },
                                if (isshown==true)...{
                                  new poollist( notifyParent: refresh, ),
                                },
                                if (isupdateplayer==true)...{
                                  new playerupdate( notifyParent: refresh3, ),
                                },
                                // SizedBox(
                                //   height: 20,
                                // ),
                                // TimeSpendWidget(),
                                if (AppResponsive.isMobile(context)) ...{
                                  SizedBox(
                                    height: 20,
                                  ),

                                  StatisticWidget(),

                                  SizedBox(
                                    height: 20,
                                  ),
                                  SendMoneyWidget(),
                                }
                              ],
                            ),
                          ),
                        ),
                        if (isselfplay==true)...{
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  if (isselfplay==true)...{

                                    playerdet(notifyParent:refresh2,plist: pinfo, ),
                                  },



                                ],
                              ),
                            ),
                          ),
                        },

                        if (!AppResponsive.isMobile(context))
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  if (isselfplay==true)...{

                                    meddet(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    precord(plist: null,notifyParent: refresh2,),
                                  },
                                  if (isshowndb==true)...{
                                    StatisticWidget(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  },

                                  if (isshowndb==true)...{
                                    SendMoneyWidget(),
                                  },
                                  if (isshownplayer==true)...{
                                    players(plist: plist,notifyParent: refresh2,),
                                  },
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),


                    if (AppResponsive.isMobile(context)) ...{
                      TransactionWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      MyCardWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      DownloadCardWidget(),
                    }
                  ],
                ),
              ),
            ),
            if (AppResponsive.isMobile(context))
              Expanded(
                child: Container(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      MyCardWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      TransactionWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      DownloadCardWidget(),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
