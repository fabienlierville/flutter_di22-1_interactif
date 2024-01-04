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

  //Slider
  double taille = 0.0;

  // DateTime
  DateTime? dateNaissance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Widgets Interactifs"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
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
                  Divider(),
                  Slider(
                      value: taille,
                      min: 0,
                      max: 300,
                      divisions: 30,
                      label: taille.toStringAsFixed(0),
                      inactiveColor: Colors.black87,
                      activeColor: Colors.pinkAccent,
                      onChanged: (double d){
                        setState(() {
                          taille = d;
                          print(int.tryParse(taille.toStringAsFixed(0)));
                        });
                      }
                  ),
                  Text("Valeur Slider = ${taille}"),
                  Divider(),
                  FilledButton(
                      onPressed: (){
                        selectionDate();
                      },
                      child: Text("Choisir une date")
                  ),
                  Text((dateNaissance==null) ? "Pas de date" : "${dateNaissance!.day} / ${dateNaissance!.month} / ${dateNaissance!.year}")
          
                ],
              ),
            ),
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

  Future<void> selectionDate() async{
    DateTime? datechoisie = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      initialDate: DateTime(2000),
      locale: Locale('fr','FR')
    );

    TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 10, minute: 25)
    );
    
    if(datechoisie != null && time !=null){
      setState(() {
        dateNaissance = datechoisie.add(Duration(hours: time.hour, minutes: time.minute));
      });
      print(dateNaissance);
    }

  }
}

enum ChoixTransport {
  Voiture,
  Avion,
  Bateau
}
// o Avion o Bateau o Voiture
// Icon correspondant
