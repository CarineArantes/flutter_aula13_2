class DadosJSON {
  String title = '';
  // String s2 = '';
  // String s3 = '';

  DadosJSON({this.title = ''});

  DadosJSON.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}
