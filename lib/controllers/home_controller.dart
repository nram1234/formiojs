import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundel;
import 'package:get/get.dart';

import '../all_widgets/base_all_widgets.dart';
import '../all_widgets/button_from_json.dart';
import '../all_widgets/checkbox_from_json.dart';
import '../all_widgets/radio_from_json.dart';
import '../all_widgets/t.dart';
import '../all_widgets/textfiled_from_json.dart';

enum JsonWidgets {
  button,
  textfield,
  radio,
  checkbox
}


class HomeController extends GetxController{

List<Widget>form=[];
List<BaseAllWidgets>baseAllWidgets=[];
Map<String,bool>checkboxValMap={};
Map<String,String>ridoValMap={};
 String aaaaa="";
@override
  void onInit() {
super.onInit();
//checkboxValMap["a"]=false;
getJson();

  }

  getJson() async {
  form.clear();
    final jsondata = await rootBundel.rootBundle
        .loadString("assets/json/form1.json");



    var a=jsonDecode(jsondata);

List ttr=a['components'];
ttr.forEach((element) {


  if(element["type"]=="button"){

    ButtonFromJson b=ButtonFromJson.fromJson(element);


    form.add(TextButton(onPressed: (){}, child: Text(b.label!)));
    baseAllWidgets.add(b);


  }
  else if(element["type"]=="textfield"){

    TextFiledFromJson b=TextFiledFromJson.fromJson(element);

    TextFormField a=TextFormField(validator: vvv,);
    form.add( a);
    baseAllWidgets.add(b);
  }
  else if(element["type"]=="radio"){

    RadioFromJson radioFromJson=RadioFromJson.fromJson(element);

    if( ridoValMap[radioFromJson.key]==null){

      ridoValMap[radioFromJson.key!]="";
    }


    List <Widget>ri=[];
    for(int i=0;i<radioFromJson.values!.length;i++){

      ri.add(Radio(value: radioFromJson.values![i].value, groupValue:ridoValMap[radioFromJson.key!] , onChanged: (v){

        ridioUpdate(key:radioFromJson.key!,val: v! );
      }));
    }

    form.add(Column(children: [Text(radioFromJson.label!,),...ri],));

  }

  else if(element["type"]=="checkbox"){

    CheckboxFromJson b=CheckboxFromJson.fromJson(element);
if(checkboxValMap[b.key]==null){
  checkboxValMap[b.key!]=false;
}
print("===============================");
    form.add(Checkbox(value:checkboxValMap[b.key], onChanged:(v){
      checkboxValMapUpdate(b.key,v);
    }));


 //   baseAllWidgets.add(b);



  }

});

update();


  }
checkboxValMapUpdate(key,v){
  print("object");

  checkboxValMap[key]=v;
  getJson();
  //update();
}
ridioUpdate({required String key,required String val}){
  print("$key  $val");
  aaaaa=val;
  ridoValMap[key]=val;
  getJson();
  //update();
}
 String? vvv(String? v){
  if((v?.length??0)<5){
    return "000000000000000000";

  }
  return null;
  }
}