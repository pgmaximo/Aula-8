import 'package:aula_requisicoes/widget/myappbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

class PokePage extends StatefulWidget {
  final String nomeDoPokemon;

  const PokePage({super.key, required this.nomeDoPokemon});

  @override
  State<PokePage> createState() => _PokePageState();
}

class _PokePageState extends State<PokePage> {
  String nome = '';
  int id = 0;
  List<String> tipos = [];
  String spriteUrl = '';
  bool isLoading = true; 


  @override
  void initState() {
    super.initState();
    _carregarDadosPokemon();
  }

  Future<void> _carregarDadosPokemon() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
          'https://pokeapi.co/api/v2/pokemon/${widget.nomeDoPokemon}');
      setState(() {
        nome = response.data['name'];
        id = response.data['id'];
        for (var type in response.data['types']) {
          tipos.add(type['type']['name']);
        }
        spriteUrl = response.data['sprites']['front_default'];
        isLoading = false;
      });
    } catch (e) {
      print('Erro ao carregar dados do Pokémon: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: const MyAppBar(titulo: 'Pokemon Page'),
      body: Center(
        child: isLoading ? const CircularProgressIndicator() : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(spriteUrl),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text('NOME: ', style: TextStyle(color: Colors.white, fontSize: 24),),
              Text(nome.toUpperCase(), style: TextStyle(color: Colors.yellow[700], fontSize: 24),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text('ID: ', style: TextStyle(color: Colors.white, fontSize: 24),),
              Text(id.toString(), style: TextStyle(color: Colors.yellow[700], fontSize: 24),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('TIPOS: ', style: TextStyle(color: Colors.white, fontSize: 24),),
                ...tipos.mapIndexed((index, tipo) {
                  final text = Text(tipo.toUpperCase(), style: TextStyle(color: Colors.yellow[700], fontSize: 24));
                  if (index < tipos.length - 1) {
                    return Row(children: [text, const SizedBox(width: 4), const Text('e', style: TextStyle(color: Colors.white, fontSize: 24)), const SizedBox(width: 4)]);
                  } else {
                    return text;
                  }
                }).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}