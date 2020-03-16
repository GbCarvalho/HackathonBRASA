class QuestoesProva {
  String enunciado;
  String id;
  String idMateria;
  String points;

  QuestoesProva({this.id, this.enunciado, this.idMateria});

  QuestoesProva.fromJson(Map<String, dynamic> json) {
    enunciado = json['enunciado'];
    id = json['id'];
    idMateria = json['idMateria'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enunciado'] = this.enunciado;
    data['id'] = this.id;
    data['idMateria'] = this.idMateria;
    return data;
  }
}
