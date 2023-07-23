import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'mydata.dart';

class DetailApp extends StatefulWidget {
  const DetailApp({super.key});

  @override
  State<DetailApp> createState() => _DetailAppState();
}

class _DetailAppState extends State<DetailApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Input your Informations',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          //
          CustomScrollView(
            anchor: 0.2,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  height: 700,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Colors.white,
                  ),
                  //in container add child with column
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text(
                            'Your Informations',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          //
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller: txtFirstName,
                              decoration: const InputDecoration(
                                labelText: 'Enter your first name',
                                prefixIcon: Icon(Icons.people),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                            ),
                          ),
                          //
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: txtLastName,
                              maxLength: 20,
                              decoration: const InputDecoration(
                                labelText: 'Enter your last name',
                                prefixIcon: Icon(Icons.people),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                            ),
                          ),
                          //
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 45,
                            color: Colors.grey[300],
                            child: MyGender(),
                          ),
                          //
                          CountryPickerDropdown(
                            initialValue: 'Us',
                            onValuePicked: (Country country) {
                              myCountry = country.name;
                            },
                          ),
                          //
                          Text('$result'),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MyGender extends StatefulWidget {
  const MyGender({super.key});

  @override
  State<MyGender> createState() => _MyGenderState();
}

class _MyGenderState extends State<MyGender> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          child: RadioListTile(
            title: const Text('Male'),
            value: GroupGender.Male,
            groupValue: gender,
            onChanged: ((value) {
              setState(() {
                gender = value;
                myGender = 'Male';
              });
            }),
          ),
        ),
        Container(
          width: 150,
          child: RadioListTile(
            title: const Text('Female'),
            value: GroupGender.Female,
            groupValue: gender,
            onChanged: ((value) {
              setState(() {
                gender = value;
                myGender = 'Female';
              });
            }),
          ),
        ),
      ],
    );
  }
}
