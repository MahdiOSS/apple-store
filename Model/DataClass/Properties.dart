class Properties {
  String? title;
  String? value;

  Properties(this.title, this.value);

  factory Properties.fromJson(Map<String, dynamic> json) =>
      Properties(json['title'], json['value']);
}
