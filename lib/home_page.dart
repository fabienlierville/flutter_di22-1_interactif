import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TextField
  String textValue = "";
  bool obscure = true;

  //Checkbox
  Map<String,bool> listeCourse = {
    "Carottes": false,
    "Bananes": false,
    "Yaourt": false,
    "Pain": false,
  };
  /*
      Carottes []
      Bananes []
   */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets Interactifs"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                obscureText: obscure,
                onChanged: (String? value){
                  setState(() {
                    textValue = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Entrez votre mail",
                  hintText: "test@test.com",
                  suffixIcon: IconButton(
                    icon: Icon((obscure) ? Icons.visibility_off : Icons.visibility),
                    onPressed: (){
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                  )
                ),
              ),
              Text(textValue),
              Divider(),
              Container(
                child: Column(
                  children: checkList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> checkList() {
    List<Widget> l =[];
    listeCourse.forEach((produit, achete) {
      //1 Fabriquer une Row : [] produit
      Row row = Row(
        children: [
          Checkbox(
              value: achete,
              onChanged: (bool? b){
                setState(() {
                  listeCourse[produit] = b!;
                });
              }
          ),
          Text(produit),
        ],
      );

      //2 Insérer cette Row dans la liste de Widget : l
      l.add(row);
    });

    return l;
  }


}

