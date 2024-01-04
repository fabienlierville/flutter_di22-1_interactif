import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String textValue = "";
  bool obscure = true;

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
              Text(textValue)
            ],
          ),
        ),
      ),
    );
  }
}
