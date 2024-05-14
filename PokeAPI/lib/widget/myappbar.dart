import 'package:flutter/material.dart';


class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String titulo;

  const MyAppBar({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(titulo, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.yellow[700])),
      centerTitle: true,

    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}