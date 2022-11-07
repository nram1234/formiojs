import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundel;
import 'package:get/get.dart';

import '../all_widgets_json_model/base_all_widgets.dart';
import '../all_widgets_json_model/button_from_json.dart';
import '../all_widgets_json_model/checkbox_from_json.dart';
import '../all_widgets_json_model/dropdown_button_json.dart';
import '../all_widgets_json_model/radio_from_json.dart';
import '../all_widgets_json_model/textfiled_from_json.dart';

enum JsonWidgets { button, textfield, radio, checkbox }

class HomeController extends GetxController {
  List<Widget> form = [];
  List<BaseAllWidgets> baseAllWidgets = [];
  Map<String, bool> checkboxValMap = {};
  Map<String, String> ridoValMap = {};
  Map<String, int?> alldropdownButton = {};
  String aaaaa = "";

  @override
  void onInit() {
    super.onInit();
//checkboxValMap["a"]=false;
    getJson();
  }

  getJson() async {
    form.clear();
    final jsondata =
    await rootBundel.rootBundle.loadString("assets/json/form1.json");

    var a = jsonDecode(jsondata);

    List ttr = a['components'];
    ttr.forEach((element) {
      if (element["type"] == "button") {
        ButtonFromJson b = ButtonFromJson.fromJson(element);

        form.add(TextButton(onPressed: () {}, child: Text(b.label!)));
        baseAllWidgets.add(b);
      } else if (element["type"] == "textfield") {
        TextFiledFromJson b = TextFiledFromJson.fromJson(element);

        Widget a = Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1,
                  color: Colors.blueAccent,
                )),
            padding: EdgeInsets.all(8),
            child: TextFormField(
              validator: vvv,
            ));
        form.add(a);
        baseAllWidgets.add(b);
      }
      else if (element["type"] == "radio") {
        RadioFromJson radioFromJson = RadioFromJson.fromJson(element);

        if (ridoValMap[radioFromJson.key] == null) {
          ridoValMap[radioFromJson.key!] = "";
        }

        List<Widget> ri = [];
        for (int i = 0; i < radioFromJson.values!.length; i++) {
          ri.add(Row(
            children: [
              Text(radioFromJson.values![i].label!),
              SizedBox(
                width: 8,
              ),
              Radio(
                  value: radioFromJson.values![i].value,
                  groupValue: ridoValMap[radioFromJson.key!],
                  onChanged: (v) {
                    ridioUpdate(key: radioFromJson.key!, val: v!);
                  }),
            ],
          ));
        }

        form.add(Column(
          children: [
            Text(
              radioFromJson.label!,
            ),
            ...ri
          ],
        ));
      }
      else if (element["type"] == "checkbox") {
        CheckboxFromJson b = CheckboxFromJson.fromJson(element);
        if (checkboxValMap[b.key] == null) {
          checkboxValMap[b.key!] = false;
        }
        print("===============================");
        form.add(Row(
          children: [
            Text(b.label!),
            SizedBox(
              width: 8,
            ),
            Checkbox(
                value: checkboxValMap[b.key],
                onChanged: (v) {
                  checkboxValMapUpdate(b.key, v);
                }),
          ],
        ));

        //   baseAllWidgets.add(b);

      }
      else if (element["type"] == "select") {
        DropdownButtonJson     dropdownButtonJson = DropdownButtonJson.fromJson(
            element);
//List<ValuesOfDropdownButtonJson>? a=dropdownButtonJson?.data?.values;
        baseAllWidgets.add(dropdownButtonJson);
     //   alldropdownButton[dropdownButtonJson.key];
        DropdownButton dropdownButton = DropdownButton<
            ValuesOfDropdownButtonJson>(
            value: dropdownButtonJson.data?.values?[ alldropdownButton[dropdownButtonJson!.key]??0],
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(
                color: Colors.deepPurple
            ),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (ValuesOfDropdownButtonJson? newValue) {
              //updatdroballdropdownButton("dropdownButtonJson?.key",newValue);
         int? pos=     dropdownButtonJson?.data?.values?.indexOf(newValue!);
         updatdroballdropdownButton(dropdownButtonJson?.key,pos);
         print(pos);
            },
            items:dropdownButtonJson?.data?.values?.map<DropdownMenuItem<ValuesOfDropdownButtonJson>>((
            ValuesOfDropdownButtonJson value)
        {
          return DropdownMenuItem<ValuesOfDropdownButtonJson>(
            value: value,
            child: Text(value.label!),
          );
        })
          .toList(),
      );

     form.add(dropdownButton);
      }
      });

    update();
  }

  checkboxValMapUpdate(key, v) {
    print("object");

    checkboxValMap[key] = v;
    getJson();
    //update();
  }
updatdroballdropdownButton(key,val){
   alldropdownButton[key]=val;

 // update();
 getJson();
}
  ridioUpdate({required String key, required String val}) {
    print("$key  $val");
    aaaaa = val;
    ridoValMap[key] = val;
    getJson();
    //update();
  }

  String? vvv(String? v) {
    if ((v?.length ?? 0) < 5) {
      return "000000000000000000";
    }
    return null;
  }
}
