import 'package:formiojs/all_widgets_json_model/base_all_widgets.dart';

class DropdownButtonJson extends BaseAllWidgets{
  String? label;
  String? widget;
  bool? tableView;
  Data? data;
  String? key;
  String? type;
  bool? input;
  bool? disableOnInvalid;

  DropdownButtonJson(
      {this.label,
        this.widget,
        this.tableView,
        this.data,
        this.key,
        this.type,
        this.input,
        this.disableOnInvalid});

  DropdownButtonJson.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    widget = json['widget'];
    tableView = json['tableView'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    key = json['key'];
    type = json['type'];
    input = json['input'];
    disableOnInvalid = json['disableOnInvalid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['widget'] = this.widget;
    data['tableView'] = this.tableView;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['key'] = this.key;
    data['type'] = this.type;
    data['input'] = this.input;
    data['disableOnInvalid'] = this.disableOnInvalid;
    return data;
  }
}

class Data {
  List<ValuesOfDropdownButtonJson>? values;

  Data({this.values});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['values'] != null) {
      values = <ValuesOfDropdownButtonJson>[];
      json['values'].forEach((v) {
        values!.add(new ValuesOfDropdownButtonJson.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ValuesOfDropdownButtonJson {
  String? label;
  String? value;

  ValuesOfDropdownButtonJson({this.label, this.value});

  ValuesOfDropdownButtonJson.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['value'] = this.value;
    return data;
  }
}