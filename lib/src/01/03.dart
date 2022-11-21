import 'dart:io';

import 'package:flutter/material.dart';

// rgba(159,254,184,255)
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black
        ),
        canvasColor: Color.fromARGB(255, 159, 254, 184),
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1.define a variable that changes
  // 2. use the var in the build to create UI
  // 3. modify the value in SetState
  Alignment value = Alignment.bottomLeft;
  String output = (0.0).toStringAsFixed(2);

  String show = (0.0).toStringAsFixed(2);
  String? error;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('CURRENCY CONVERTER')
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/6800_8_03.jpg',
            width: 300,
            height: 300),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Enter the amount in Romanian RON',
                  errorText: error,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      output = (0.0).toStringAsFixed(2);
                      controller.clear();
                    },
                )
                ),
                keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: true),
                onChanged: (String value) {
                  setState(() {
                    final double? number = double.tryParse(value);

                    if(number == null) {
                      error = 'Enter a valid number';
                      output = (0.0).toStringAsFixed(2);
                    } else {
                      error = null;
                      output = (number * 4.91).toStringAsFixed(3);
                    }
                  });
                },
              ),
            ),
            IconButton(onPressed: () {
              setState(() {
                show = output;
              });
            }, icon: const Icon(
              Icons.euro) , splashColor: Colors.white,
            )
            ,Text('$show ',
                style: TextStyle(fontSize: 25)
            )
          ],
        ),
    );
  }
}
