import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundel;
import 'package:get/get.dart';

import '../all_widgets/base_all_widgets.dart';
import '../all_widgets/button_from_json.dart';
import '../all_widgets/checkbox_from_json.dart';
import '../all_widgets/radio_from_json.dart';
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
@override
  void onInit() {
super.onInit();
getJson();
  }

  getJson() async {
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
    List <Widget>ri=[];
    for(int i=0;i<(radioFromJson.values?.length??0);i++){
      Radio radio=Radio(value: radioFromJson.values![i].value, groupValue: radioFromJson.key, onChanged: (v){});
      ri.add(radio);
    }

    form.add(Column(children: [Text(radioFromJson!.label!,),...ri],));

  }

  else if(element["type"]=="checkbox"){

    CheckboxFromJson b=CheckboxFromJson.fromJson(element);
    checkboxValMap["a"]=false;

    form.add(Checkbox(value:checkboxValMap["a"] , onChanged: (bool? v){

      checkboxValMapUpdate( key: "a",val: v);


    }));
    baseAllWidgets.add(b);



  }

});

update();


  }
checkboxValMapUpdate({required key,val}){
  print("object");
  print("$key     $val");
  print(checkboxValMap[key]);
  checkboxValMap[key]=val;
  print(checkboxValMap[key]);
  update();
}
 String? vvv(String? v){
  if((v?.length??0)<5){
    return "000000000000000000";

  }
  return null;
  }
}