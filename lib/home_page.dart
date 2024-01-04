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

  //RadioBox
  ChoixTransport choixTransport = ChoixTransport.Avion;
  Icon iconTransport = Icon(Icons.airplanemode_active);

  //Switch
  bool interrupteur = false;

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
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // o Text o Text o Text
                  Radio(
                      value: ChoixTransport.Avion,
                      groupValue: choixTransport,
                      onChanged: (ChoixTransport? value){
                        setState(() {
                          choixTransport = value!;
                          iconTransport = Icon(Icons.airplanemode_active);
                        });
                      }
                  ),
                  Text("Avion"),
                  Radio(
                      value: ChoixTransport.Bateau,
                      groupValue: choixTransport,
                      onChanged: (ChoixTransport? value){
                        setState(() {
                          choixTransport = value!;
                          iconTransport = Icon(Icons.directions_boat);
                        });
                      }
                  ),
                  Text("Bateau"),
                  Radio(
                      value: ChoixTransport.Voiture,
                      groupValue: choixTransport,
                      onChanged: (ChoixTransport? value){
                        setState(() {
                          choixTransport = value!;
                          iconTransport = Icon(Icons.directions_car);
                        });
                      }
                  ),
                  Text("Voiture"),
                ],
              ),
              iconTransport,
              Divider(),
              Switch(
                inactiveTrackColor: Colors.red,
                  activeColor: Colors.green,
                  value: interrupteur,
                  onChanged: (bool b){
                    setState(() {
                      interrupteur = b;
                    });
                  }
              ),
              Text((interrupteur) ? "Pour" : "Contre"),

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
          Text(produit, style: TextStyle(decoration: (achete) ? TextDecoration.lineThrough : TextDecoration.none),),
        ],
      );

      //2 Insérer cette Row dans la liste de Widget : l
      l.add(row);
    });

    return l;
  }
}

enum ChoixTransport {
  Voiture,
  Avion,
  Bateau
}
// o Avion o Bateau o Voiture
// Icon correspondant
