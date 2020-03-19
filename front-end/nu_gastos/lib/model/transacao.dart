import 'package:flutter/material.dart';
import 'package:nu_gasto/model/nf_info.dart';
import 'dart:convert';

class Transacao {
  int tipo; // ? {0: "saída", 1 : "entrada", 2 : "meta"}
  String nome;
  String descricao;
  double valor;
  String data;
  String categoria;
  IconData icon;
  List<String> gastos;
  dynamic jsonNfData;

  set setJsonTransactionInfo(String stringJson) {
    jsonNfData = stringJson;
  }

  get formatedJsonNfData {
    return json.decode(jsonNfData);
  }

  Transacao({
    this.nome,
    this.descricao,
    this.valor,
    this.data,
    this.categoria,
    this.gastos,
    this.icon = Icons.edit,
    this.tipo,
    this.jsonNfData,
  }) {
    valor = tipo > 0 ? valor : valor * -1;
  }

  Transacao.fromJson(Map<String, dynamic> json) {
    tipo = json['tipo'];
    nome = json['nome'];
    descricao = json['descricao'];
    valor = json['valor'];
    data = json['data'];
    categoria = json['categoria'];
    gastos = json['gastos'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipo'] = this.tipo;
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['valor'] = this.valor;
    data['data'] = this.data;
    data['categoria'] = this.categoria;
    data['gastos'] = this.gastos;
    return data;
  }
}
