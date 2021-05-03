import 'package:flutter/material.dart';

class CountryScreen extends StatelessWidget {
  static const routeName = '/country';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: SizedBox(
          height: 43,
          width: 315,
          child: TextField(
            controller: TextEditingController(),
            decoration: InputDecoration(
              labelText: 'Search by country',
              labelStyle: TextStyle(
                color: Color(0x55FFFFFF),
              ),
              suffixIcon: Icon(
                Icons.search,
                color: Color(0x55FFFFFF),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Color.fromARGB(
                30,
                255,
                255,
                255,
              ),
              filled: true,
            ),
          ),
        ),
      ),
      body: ListView(
        children: List.generate(
          20,
          (index) => ListTile(
            leading: Image.asset(
              'assets/images/nigerian-flag.png',
              width: 30,
              height: 50,
            ),
            title: Text('(+234) Nigeria'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
