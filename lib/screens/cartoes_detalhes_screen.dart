import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_cursos/models/cartao_model.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:share/share.dart';

class CartoesDetalhesScreen extends StatelessWidget {
  CartaoModel cartaoModel;

  @override
  Widget build(BuildContext context) {
    cartaoModel = ModalRoute.of(context).settings.arguments;

    // Seção da imagem
    Image buildImage() {
      return Image.asset(
        'assets/' + cartaoModel.imagem,
        width: 600,
        height: 240,
        fit: BoxFit.cover,
      );
    }

    // Seção de título
    Widget titleSection = Container(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 3),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    cartaoModel.nome,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  cartaoModel.razaoSocial,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  'Telefone: ' + cartaoModel.telefone,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  'Endereço: ' + cartaoModel.endereco,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Text(cartaoModel.avaliacao.toString()),
          Icon(
            Icons.star,
            color: cartaoModel.cor,
          ),
        ],
      ),
    );

    // Construção do botões de ação
    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(icon),
            color: color,
            onPressed: () {
              switch (label) {
                case 'LIGAR':
                  UrlLauncher.launch('tel:+${cartaoModel.telefone}');
                  break;
                case 'COMO CHEGAR':
                  UrlLauncher.launch('https://www.google.com/maps/search/${cartaoModel.endereco}');
                  break;
                case 'SHARE':
                  Share.share('Olha só que cartão legal! ${cartaoModel.website}');
                  break;                  
                default:
                  print('ERRO nos botões de ação');
              }
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    // Seção de botões de ação
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(cartaoModel.cor, Icons.call, 'LIGAR'),
          _buildButtonColumn(cartaoModel.cor, Icons.near_me, 'COMO CHEGAR'),
          _buildButtonColumn(cartaoModel.cor, Icons.share, 'SHARE'),
        ],
      ),
    );

    // Seção de texto
    Widget textSection = Container(
      //padding: const EdgeInsets.all(32),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Text(
            cartaoModel.conteudo,
            textAlign: TextAlign.justify,
            style: new TextStyle(
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );

    // Código para interação com o sistema
    _launchURL() async {
      var url = cartaoModel.website;
      if (await UrlLauncher.canLaunch(url)) {
        await UrlLauncher.launch(url);
      } else {
        throw 'Não foi possível abrir: $url';
      }
    }

    // Botão inferior
    RaisedButton buildRaisedButton(Future<dynamic> _launchURL()) {
      return RaisedButton(
        onPressed: _launchURL,
        color: cartaoModel.cor,
        textColor: Colors.white,
        child: Text('Peça seu cartão!'),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          buildImage(),
          titleSection,
          buttonSection,
          textSection,
          buildRaisedButton(_launchURL),
        ],
      ),
    );
  }
}
