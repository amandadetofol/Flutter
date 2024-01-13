import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final class TesteDrawer extends StatelessWidget {
  const TesteDrawer({super.key});


  @override 
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://img.freepik.com/fotos-gratis/uma-imagem-de-um-planeta-com-um-buraco-negro-no-centro-e-um-buraco-negro-no-centro_1340-23795.jpg"),
                ),
                accountName: Text("Name Lastname"),
                accountEmail: Text("email@email.com")),
              _card(context),
              _card(context),
              _card(context)
            ],
          ),
      )
    );
  }

  _card(BuildContext context){
    return ListTile(
      leading: const Icon(Icons.star),
      title: const Text("Titulo"),
      subtitle: const Text("Subtítulo"),
      trailing: const Icon(Icons.arrow_circle_right),
      onTap: (){
        Navigator.pop(context);
      },
    );
  }
}