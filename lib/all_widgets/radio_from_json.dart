import 'base_all_widgets.dart';

class RadioFromJson extends BaseAllWidgets{
  String? label;
  String? optionsLabelPosition;
  bool? inline;
  bool? tableView;
  List<Values>? values;
  String? key;
  String? type;
  bool? input;

  RadioFromJson(
      {this.label,
        this.optionsLabelPosition,
        this.inline,
        this.tableView,
        this.values,
        this.key,
        this.type,
        this.input});

  RadioFromJson.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    optionsLabelPosition = json['optionsLabelPosition'];
    inline = json['inline'];
    tableView = json['tableView'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(new Values.fromJson(v));
      });
    }
    key = json['key'];
    type = json['type'];
    input = json['input'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['optionsLabelPosition'] = this.optionsLabelPosition;
    data['inline'] = this.inline;
    data['tableView'] = this.tableView;
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
    }
    data['key'] = this.key;
    data['type'] = this.type;
    data['input'] = this.input;
    return data;
  }
}

class Values {
  String? label;
  String? value;
  String? shortcut;

  Values({this.label, this.value, this.shortcut});

  Values.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
    shortcut = json['shortcut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['value'] = this.value;
    data['shortcut'] = this.shortcut;
    return data;
  }
}