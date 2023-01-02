import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:spms/common/app_colors.dart';
import 'package:spms/common/app_responsive.dart';
import 'package:spms/pages/dashboard/widget/setting_button.dart';

/*
Title:TrafficSourceWidget 
Purpose:TrafficSourceWidget
Created By:Isuru Weerasinghe
Created Date:20 Feb 2022
*/

class TrafficSourceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pool Strength",
                style: TextStyle(color: AppColors.white),
              ),
              SettingButton(),
            ],
          ),
          Container(
            height: AppResponsive.isMobile(context) ? 430 : 400,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  bottom: 0,
                  top: 0,
                  left: 0,
                  child: Container(
                    height: 300,
                    margin: EdgeInsets.only(top: 100),
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
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
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              _itemWidget(
                                  text: "Cricket", color: Color(0xffbd25ef)),
                              _itemWidget(
                                  text: "Volley Ball",
                                  color: Color(0xff7dd9ff)),
                              _itemWidget(
                                  text: "Rugby", color: Color(0xff47b588)),
                            ],
                          ),
                          Row(
                            children: [
                              _itemWidget(
                                  text: "Angampora", color: Color(0xffcd6df2)),
                              _itemWidget(
                                  text: "Badminton", color: Color(0xffd6854d)),
                              _itemWidget(
                                  text: "Carom", color: Color(0xfff1cc59)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: 50,
                      startDegreeOffset: -90,
                      pieTouchData: PieTouchData(
                        enabled: true,
                        touchCallback: (value) {},
                      ),
                      sections: paiChartSelectionDatas,
                    ),
                    swapAnimationCurve: Curves.bounceIn,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _itemWidget({String? text, Color? color}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  boxShadow: [
                    BoxShadow(
                      color: color!.withOpacity(0.5),
                      blurRadius: 1,
                      offset: Offset(0, 0.5),
                      spreadRadius: 1,
                    )
                  ]),
              height: 15,
              width: 15,
            ),
            SizedBox(
              width: 6,
            ),
            Expanded(
              child: Text(
                "$text",
                style: TextStyle(color: AppColors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<PieChartSectionData> paiChartSelectionDatas = [
  PieChartSectionData(
    color: Color(0xffab51e6),
    value: 39,
    showTitle: false,
    radius: 25 * 3.5,
  ),
  PieChartSectionData(
    color: Color(0xFFf69551),
    value: 7,
    showTitle: false,
    radius: 25 * 3.5,
  ),
  PieChartSectionData(
    color: Color(0xFF28b9e6),
    value: 47,
    showTitle: false,
    radius: 25 * 3.5,
  ),
  PieChartSectionData(
    color: Color(0xffe734bd),
    value: 37,
    showTitle: false,
    radius: 25 * 3.5,
  ),
  PieChartSectionData(
    color: Color(0xff6ddbae),
    value: 55,
    showTitle: false,
    radius: 25 * 3.5,
  ),
  PieChartSectionData(
    color: Color(0xfff1cc59),
    value: 13,
    showTitle: false,
    radius: 25 * 3.5,
  ),
];
