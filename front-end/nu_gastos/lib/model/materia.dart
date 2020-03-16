class Materia {
  String id;
  String url;
  String title;
  String imageURL;
  int reward;

  Materia(
      {this.id,
      this.url = 'https://www.google.com/',
      this.title,
      this.imageURL,
      this.reward});

  Materia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    title = json['title'];
    imageURL = json['imageURL'];
    reward = json['reward'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['title'] = this.title;
    data['imageURL'] = this.imageURL;
    data['reward'] = this.reward;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return '\n*************************\n     id: ${this.id}\n    url: ${this.url}\n   title: ${this.title}\n   imageUrl: ${this.imageURL}\n   reward: ${this.reward}';
  }
}
