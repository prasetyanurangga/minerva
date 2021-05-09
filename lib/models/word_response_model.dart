class WordResponseModel {
  List<Data> data;
  bool success;

  WordResponseModel({this.data, this.success});

  WordResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  int id;
  String indoDesc;
  String indoWord;
  String pronounce;
  String word;

  Data({this.id, this.indoDesc, this.indoWord, this.pronounce, this.word});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    indoDesc = json['indo_desc'];
    indoWord = json['indo_word'];
    pronounce = json['pronounce'];
    word = json['word'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['indo_desc'] = this.indoDesc;
    data['indo_word'] = this.indoWord;
    data['pronounce'] = this.pronounce;
    data['word'] = this.word;
    return data;
  }
}