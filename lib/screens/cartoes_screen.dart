import 'package:flutter/material.dart';
import 'package:lista_cursos/models/cartao_model.dart';
import 'package:lista_cursos/repository/cartao_repository.dart';

class CartoesScreen extends StatefulWidget {
  @override
  _CartoesScreenScreenState createState() => _CartoesScreenScreenState();
}

class _CartoesScreenScreenState extends State<CartoesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            children: <Widget>[
              Text("Cartões de Crédito "),
              IconButton(
                icon: Icon(Icons.credit_card),
                //color: color,
                onPressed: () => _showToast(context),
              ),
            ],
          )),
      body: FutureBuilder<List<CartaoModel>>(
        future: CartaoRepository().findAllAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildListView(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  // Mensagem Toast de Easter Egg
  void _showToast(BuildContext context) {
    print("Me dá nota boa pf Flaviao");
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  // Criar cards para os cartões
  Card cardCartao(CartaoModel cartao) {
    return Card(
        margin: EdgeInsets.only(left: 10, right: 10, top: 12),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          height: 135,
          child: Stack(children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Material(
                            child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/cartoes_detalhes",
                              arguments: cartao,
                            );
                          },
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                'assets/' + cartao.imagem,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ))
                      ],
                    ))),
            Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        child: Text(cartao.nome,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white),
                            textAlign: TextAlign.center),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/cartoes_detalhes",
                            arguments: cartao,
                          );
                        },
                      )
                    ],
                  ),
                )),
          ]),
        ));
  }

  // Criar lista de cartões
  ListView buildListView(List<CartaoModel> cartoes) {
    return ListView.builder(
      itemCount: cartoes == null ? 0 : cartoes.length,
      itemBuilder: (BuildContext ctx, int index) {
        return cardCartao(cartoes[index]);
      },
    );
  }
}
