import 'package:flutter/material.dart';

class CartaoModel {
  int id;
  String nome;
  String razaoSocial;
  MaterialColor cor;
  String telefone;
  String conteudo;
  String endereco;
  String imagem;
  String website;
  double avaliacao;

  CartaoModel({
    this.id,
    this.nome,
    this.razaoSocial,
    this.conteudo,
    this.cor,
    this.telefone,
    this.endereco,
    this.imagem,
    this.avaliacao,
    this.website,
  });
}