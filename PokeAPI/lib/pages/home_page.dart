import 'package:flutter/material.dart';
import 'package:aula_requisicoes/pages/poke_page.dart';
import 'package:aula_requisicoes/widget/myappbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    // Variavel
    var controller = TextEditingController();
    const IconData pokeball = IconData(0xef36, fontFamily: 'MaterialIcons');
    final larguraTela = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: const MyAppBar(titulo: 'Home Page',),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: larguraTela/1.25,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Digite o nome do Pokemon:',
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  filled: true,
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.yellow, width: 3.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.yellow, width: 3.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            IconButton(
              onPressed: () {
                // Rota para a proxima pagina
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PokePage(
                      nomeDoPokemon: controller.text.toLowerCase(), 
                    )
                  )
                );
              }, 
              icon: Icon(pokeball, color: Colors.yellow[700], size: 50,),
            )
          ],
        ),
      )
    );
  }
}
