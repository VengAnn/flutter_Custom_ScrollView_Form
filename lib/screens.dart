import 'package:flutter/material.dart';
import 'mydata.dart';
import 'detailapp.dart';

class HomeScren extends StatefulWidget {
  const HomeScren({super.key});

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom scroll view'),
      ),
      body: SafeArea(child: DetailApp()),

      //
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          color: const Color.fromARGB(255, 0, 3, 5),
          child: TextButton(
              onPressed: () {
                setState(() {
                  result =
                      '${txtFirstName.text} ${txtLastName.text} \n ${myGender} \n ${myCountry}';
                });
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
        ),
      ),
    );
  }
}
