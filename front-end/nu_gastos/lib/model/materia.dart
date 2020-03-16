class Materia {
  String id;
  String uRL;
  String image;
  String title;
  String points;

  Materia({this.uRL, this.image, this.title, this.points});

  Materia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uRL = json['URL'];
    image = json['image'];
    title = json['title'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['URL'] = this.uRL;
    data['image'] = this.image;
    data['title'] = this.title;
    data['points'] = this.points;
    return data;
  }
}
