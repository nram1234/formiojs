import 'package:formiojs/all_widgets/base_all_widgets.dart';

class CheckboxFromJson extends BaseAllWidgets{



  String? label;
  bool? showValidations;
  bool? tableView;
  String? key;
  String? type;
  bool? input;
  bool? saveOnEnter;

  CheckboxFromJson(
      {  this.label,
        this.showValidations,
        this.tableView,
        this.key,
        this.type,
        this.input,
        this.saveOnEnter});

  CheckboxFromJson.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    showValidations = json['showValidations'];
    tableView = json['tableView'];
    key = json['key'];
    type = json['type'];
    input = json['input'];
    saveOnEnter = json['saveOnEnter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['showValidations'] = this.showValidations;
    data['tableView'] = this.tableView;
    data['key'] = this.key;
    data['type'] = this.type;
    data['input'] = this.input;
    data['saveOnEnter'] = this.saveOnEnter;
    return data;
  }






}