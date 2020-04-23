//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_cursos/models/cartao_model.dart';

import 'database.dart';

class CartaoRepository {
  Future<List<CartaoModel>> findAllAsync() async {
    var db = Database();
    await db.createDatabase();

    List<CartaoModel> cartoes = new List<CartaoModel>();

    if (db.created) {
      cartoes = new List<CartaoModel>();
      cartoes.add(
        new CartaoModel(
          id: 1,
          nome: 'Nubank',
          razaoSocial: 'Nu Pagamentos S.A.',
          cor: Colors.purple,
          telefone: '0800 608 6236',
          endereco: 'R. Capote Valente, 39 - Pinheiros, São Paulo - SP, 05409-000',
          imagem: 'nubank.jpg',
          avaliacao: 4.4,
          website: 'https://www.nubank.com.br',
          conteudo:
              'Com milhares de clientes, o Nubank vem ganhando popularidade entre os consumidores brasileiros. O cartão de crédito é internacional, sem anuidade e com a bandeira Mastercard. Um grande diferencial é o fato de poder gerenciar os gastos com o cartão, em tempo real, através do smartphone.',
        ),
      );
      cartoes.add(
        CartaoModel(
          id: 2,
          nome: 'Digio',
          razaoSocial: 'Banco Digio S.A.',
          cor: Colors.blueGrey,
          telefone: '3004-9920',
          endereco: 'Alameda Xingu, 512 - Alphaville Industrial, Barueri - SP, 06455-030',
          imagem: 'digio.png',
          avaliacao: 4.6,
          website: 'https://www.digio.com.br',
          conteudo:
              'Segue a mesma linha do cartão Nubank. Só que este cartão é emitido pelo banco CBSS. Com o Digio você tem a liberdade de solucionar seus problemas sem sair de casa. É possível fazer tudo pelo seu smartphone. E também sem anuidade.',
        ),
      );
      cartoes.add(
        CartaoModel(
          id: 3,
          nome: 'Neon',
          razaoSocial: 'Neon Pagamentos S.A.',
          cor: Colors.blue,
          telefone: '0800 326 0844',
          endereco: 'R. Hungria, 1400 – Jardim Europa, São Paulo – SP, 01455-000',
          imagem: 'neon.jpg',
          avaliacao: 4.2,
          website: 'https://neon.com.br',
          conteudo:
              'A proposta do Banco Neon é ser 100% digital, totalmente integrado com o seu smartphone e sem cobrar tarifas de anuidade. Para você obter o cartão Neon é preciso abrir uma conta no banco. O cartão é vinculado à conta 100% digital do Neon, sem taxa de manutenção. Ele compete com pelo menos outros sete sem anuidade, de fintechs e bancos tradicionais que entraram no páreo.',
        ),
      );
      cartoes.add(
        CartaoModel(
          id: 4,
          nome: 'Banco Original',
          razaoSocial: 'Banco Original SA',
          cor: Colors.lightGreen,
          telefone: '0800 744 0744',
          endereco: 'Rua General Furtado do Nascimento, 66 - Alto de Pinheiros, São Paulo - SP, 05465-070',
          imagem: 'original.jpg',
          avaliacao: 3.5,
          website: 'https://www.original.com.br',
          conteudo:
              'O cartão de crédito do Banco Original é sem anuidade e internacional. Ele possui programa de pontos Cashback Original. Isso significa que é devolvida parte dos gastos de seus clientes.',
        ),
      );
      cartoes.add(
        CartaoModel(
          id: 5,
          nome: 'Banco Inter',
          razaoSocial: 'Banco Inter SA',
          cor: Colors.orange,
          telefone: '0800 744 0744',
          endereco: 'Avenida do Contorno, 7777 - Lourdes, Belo Horizonte - MG, 30110-051',
          imagem: 'inter.png',
          avaliacao: 4.4,
          website: 'https://www.bancointer.com.br/',
          conteudo:
              'O Banco Inter, antes Banco Intermedium, oferece um cartão de crédito internacional sem anuidade, com a bandeira Mastercard, aos seus correntistas. Para solicitar, basta abrir uma conta digital no banco, através do site ou do aplicativo. Todo processo do cartão, como recebimento e pagamento da fatura, também será feito através do site ou do aplicativo.',
        ),
      );
    }

    return new Future.value(cartoes);
  }
}
