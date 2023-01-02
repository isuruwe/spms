import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spms/common/app_assets.dart';
import 'package:spms/common/app_colors.dart';
import 'package:spms/common/common.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
/*
Title:SendMoneyWidget
Purpose:SendMoneyWidget
Created By:Isuru Weerasinghe
Created Date:20 Feb 2022
*/
class playerupdate extends StatefulWidget {
  final Function() notifyParent;
  playerupdate({required this.notifyParent});
  @override
  _playerupdateState createState() => _playerupdateState();
}

class _playerupdateState extends State<playerupdate> {
  var  plinfo1=null;
  String serno="";
  DateTime dob=new DateTime.now();
  DateTime ped=new DateTime.now();
  String contactno="";
  String weight="";
  int appid=0;
  int poolid=0;
  String event="";
  String pop="";
  String name="";
  Future<List<dynamic>> getplayerinfo(String p1) async {
    try {

      // String domaine = "135.22.67.71";
      // String linkToPhp = "/spms/getplayerinfo.ashx";
      var data = {
        "p1": p1,
      };
      var uri = Uri.http('localhost', '/spms/getupdatepl.ashx',data);
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
  getplayers1(String serno) {
    getplayerinfo(serno).then((value) {
      plinfo1 = value;
      plinfo1.forEach((entry) {
try {
  String date =entry["dob"]!=null? entry["dob"].split("T")[0]:"";
  String peddate =entry["enlisteddate"]!=null? entry["enlisteddate"].split("T")[0]:'';
  dob = new DateFormat("yyyy/MM/dd").parse(date);
  ped= new DateFormat("yyyy/MM/dd").parse(peddate);
}catch(ex){

}
name=entry["Rank"]+' '+entry["Name"];
        serno = entry["Serviceno"];
        contactno = entry["contactno"]!=null?entry["contactno"]:'';
        weight = entry["weightclass"]!=null?entry["weightclass"]:'';
        appid = entry["aid"]!=null?entry["aid"]:'';
        poolid = entry["spid"]!=null?entry["spid"]:'';
        event = entry["eventofplay"]!=null?entry["eventofplay"]:'';
        pop = entry["positionofplay"]!=null?entry["positionofplay"]:'';
      });

      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    final _fbKey = GlobalKey<FormBuilderState>();


    List<String> appointopt = ['Chairman',
      'Secretary',
      'Assistant Secretary',
      'Manager',
      'Assistant Manager',
      'Masseur-1',
      'Masseur-2',
      'Support Staff-1',
      'Support Staff-2',
      'Coach',
      'Assistant Coach',
      'Physical Trainer',
      'Admin',
      'Qurator',
      'Player',
      'Captain',
      'Vice Captain',
      'Staff'];
    List<String> poolopt = ['Cricket Pool',
      'Motor Racing Pool',
      'Angampora Pool',
      'Aquatic Pool',
      'Archery Pool',
      'Athletic Pool',
      'Badminton Pool',
      'Volley Ball Pool',
      'Rugby Pool',
      'Base Ball',
      'Basketball Pool',
      'Boxing Pool',
      'Bodybuilding Pool',
      'Carrom Pool',
      'Cycling pool',
      'Shooting Pool',
      'Golf poll',
      'Hand Ball Pool',
      'Hockey Poll',
      'Judo pool',
      'Kabbadi Pool',
      'Karate Pool',
      'Netball Pool',
      'Parachuting Pool'
      'Roowing Pool',
      'Soccer Pool',
      'Squash Pool'
      'Table Tennis Pool',
      'Taekwondo Pool',
      'Weight lifting Pool'
      'Tennis Pool',
      'Wushu Pool',
      'Tug od War Pool',
      'Wrestling pool' ];
    return Container(
      padding: EdgeInsets.all(10),
      decoration: appContainerDecoration,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "UPDATE PLAYER",
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
          FormBuilder(
            key: _fbKey,
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FormBuilderTextField(initialValue: serno,
                        name: serno,onSubmitted: (value){
                          getplayers1(value!);
                        },
                        decoration: InputDecoration(
                            labelText: 'Service Number'),

                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Text(name,style:TextStyle(color:  Colors.white)),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FormBuilderDateTimePicker(
                        name: 'Date of Birth',initialValue: dob,
                        inputType: InputType.date,
                        format: DateFormat("dd/MM/yyyy"),
                        decoration: InputDecoration(labelText: "Pool Enlistment Date"),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: FormBuilderDateTimePicker(
                        name: 'Pool Enlistment Date',initialValue: ped,
                        inputType: InputType.date,
                        format: DateFormat("dd/MM/yyyy"),
                        decoration: InputDecoration(labelText: "Pool Enlistment Date"),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FormBuilderTextField(
                        name: contactno,initialValue: contactno,
                        decoration: InputDecoration(
                            labelText: 'Contact No'),
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: FormBuilderTextField(
                        name: weight,initialValue:weight ,
                        decoration: InputDecoration(
                            labelText: 'Weight Class'),
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: <Widget>[
                    Expanded(
                      child:
                      FormBuilderDropdown<String>(dropdownColor: Colors.blueAccent,
                        initialValue:appointopt.elementAt(appid-1==-1?0:appid-1) ,
                        name: 'pospl',
                        decoration: InputDecoration(
                          labelText: 'Appointment',

                          // suffix: IconButton(
                          //   icon: const Icon(Icons.close),
                          //   onPressed: () {
                          //     //_formKey.currentState!.fields['gender']
                          //       //  ?.reset();
                          //   },
                          // ),
                          hintText: 'Select Appointment',
                        ),
                        items: appointopt
                            .map((gender) => DropdownMenuItem(
                          alignment: AlignmentDirectional.center,
                          value: gender,
                          child: Text(gender,style:TextStyle(color:  Colors.white)),
                        ))
                            .toList(),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: FormBuilderTextField(
                        name: event,initialValue:event ,
                        decoration: InputDecoration(
                            labelText: 'Event'),
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child:
                      FormBuilderDropdown<String>(dropdownColor: Colors.blueAccent,
                        initialValue:poolopt.elementAt(poolid-1==-1?0:poolid-1) ,
                        name: 'poolopt',
                        decoration: InputDecoration(
                          labelText: 'Pool',

                          // suffix: IconButton(
                          //   icon: const Icon(Icons.close),
                          //   onPressed: () {
                          //     //_formKey.currentState!.fields['gender']
                          //     //  ?.reset();
                          //   },
                          // ),
                          hintText: 'Select Pool',
                        ),
                        items: poolopt
                            .map((gender) => DropdownMenuItem(
                          alignment: AlignmentDirectional.center,
                          value: gender,
                          child: Text(gender),
                        ))
                            .toList(),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: FormBuilderTextField(
                        name: pop,initialValue: pop,
                        decoration: InputDecoration(
                            labelText: 'Position of Play'),
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                ElevatedButton(
                    onPressed: () {
                      final valid = _fbKey.currentState
                          ?.saveAndValidate() ?? false;
                      if (!valid) {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                SimpleDialog(
                                  contentPadding: EdgeInsets.all(
                                      20),
                                  title: Text(
                                      'Please check the form'),
                                  children: [
                                    Text(
                                        'Some details are missing or incorrect. Please check the details and try again.')
                                  ],
                                ));
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              SimpleDialog(
                                contentPadding: EdgeInsets.all(20),
                                title: Text("All done!"),
                                children: [
                                  Text(
                                    "Thanks for all the details! We're going to check your pet in with the following details.",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .caption,
                                  ),
                                  // Card(
                                  //   child: Column(
                                  //     children: [
                                  //       Text('First name: ${_fbKey
                                  //           .currentState!
                                  //           .value[FIRST_NAME]}'),
                                  //       Text('Last name: ${_fbKey
                                  //           .currentState!
                                  //           .value[LAST_NAME]}'),
                                  //       Text('Number: ${_fbKey
                                  //           .currentState!
                                  //           .value[PHONE_NUMBER]}'),
                                  //       Text('Pet type: ${_fbKey
                                  //           .currentState!
                                  //           .value[PET_CHOICE]}'),
                                  //       Text('Response 1: ${_fbKey
                                  //           .currentState!
                                  //           .value[QUESTION_ANSWER_1]}'),
                                  //       Text('Response 2: ${_fbKey
                                  //           .currentState!
                                  //           .value[QUESTION_ANSWER_2]}'),
                                  //       Text('Response 3: ${_fbKey
                                  //           .currentState!
                                  //           .value[QUESTION_ANSWER_3]}'),
                                  //     ],
                                  //   ),
                                  // )
                                ],
                              ),
                        );
                      }
                    },
                    child: Text('Save'))
              ],
            ),
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
