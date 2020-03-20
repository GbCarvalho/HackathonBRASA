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
  List items;
  dynamic jsonNfData;
  String tipoTransacao;

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
    this.categoria = 'Categoria',
    this.items,
    this.icon = Icons.edit,
    this.tipo,
    this.jsonNfData,
    this.tipoTransacao,
  }) {
    valor = tipo > 0 ? valor : valor * -1;
  }
}
