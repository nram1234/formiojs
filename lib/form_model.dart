class FormModel {
  String? display;
  Settings? settings;
  List<Components>? components;

  FormModel({this.display, this.settings, this.components});

  FormModel.fromJson(Map<String, dynamic> json) {
    display = json['display'];
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
    if (json['components'] != null) {
      components = <Components>[];
      json['components'].forEach((v) {
        components!.add(new Components.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display'] = this.display;
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    if (this.components != null) {
      data['components'] = this.components!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Settings {
  Pdf? pdf;

  Settings({this.pdf});

  Settings.fromJson(Map<String, dynamic> json) {
    pdf = json['pdf'] != null ? new Pdf.fromJson(json['pdf']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pdf != null) {
      data['pdf'] = this.pdf!.toJson();
    }
    return data;
  }
}

class Pdf {
  String? id;
  String? src;

  Pdf({this.id, this.src});

  Pdf.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['src'] = this.src;
    return data;
  }
}

class Components {
  String? label;
  bool? showWordCount;
  bool? showCharCount;
  bool? tableView;
  Validate? validate;
  String? key;
  String? type;
  bool? input;

  Components(
      {this.label,
        this.showWordCount,
        this.showCharCount,
        this.tableView,
        this.validate,
        this.key,
        this.type,
        this.input});

  Components.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    showWordCount = json['showWordCount'];
    showCharCount = json['showCharCount'];
    tableView = json['tableView'];
    validate = json['validate'] != null
        ? new Validate.fromJson(json['validate'])
        : null;
    key = json['key'];
    type = json['type'];
    input = json['input'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['showWordCount'] = this.showWordCount;
    data['showCharCount'] = this.showCharCount;
    data['tableView'] = this.tableView;
    if (this.validate != null) {
      data['validate'] = this.validate!.toJson();
    }
    data['key'] = this.key;
    data['type'] = this.type;
    data['input'] = this.input;
    return data;
  }
}

class Validate {
  bool? required;
  int? minLength;
  int? maxLength;

  Validate({this.required, this.minLength, this.maxLength});

  Validate.fromJson(Map<String, dynamic> json) {
    required = json['required'];
    minLength = json['minLength'];
    maxLength = json['maxLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['required'] = this.required;
    data['minLength'] = this.minLength;
    data['maxLength'] = this.maxLength;
    return data;
  }
}
