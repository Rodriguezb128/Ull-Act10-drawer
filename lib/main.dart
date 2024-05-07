import 'package:flutter/material.dart';
import 'package:rodriguez0403/formulario1.dart';
import 'package:rodriguez0403/formulario2.dart';
import 'package:rodriguez0403/formulario3.dart';
import 'package:rodriguez0403/formulario4.dart';
import 'package:rodriguez0403/formulario5.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
//s9s9s9s  rrrrrrr

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.formulario1;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.formulario1) {
      container = Formulario1();
    } else if (currentPage == DrawerSections.formulario2) {
      container = Formulario2();
    } else if (currentPage == DrawerSections.formulario3) {
      container = Formulario3();
    } else if (currentPage == DrawerSections.formulario4) {
      container = Formulario4();
    } else if (currentPage == DrawerSections.formulario5) {
      container = Formulario5();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3dbf99),
        title: Text("Formularios"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Formulario 1 ", Icons.airplanemode_active,
              currentPage == DrawerSections.formulario1 ? true : false),
          menuItem(2, "Formulario 2", Icons.airplay,
              currentPage == DrawerSections.formulario2 ? true : false),
          menuItem(3, "Formulario 3", Icons.crop,
              currentPage == DrawerSections.formulario3 ? true : false),
          menuItem(4, "Formulario 4", Icons.aspect_ratio,
              currentPage == DrawerSections.formulario4 ? true : false),
          Divider(),
          menuItem(5, "Formulario 5 ", Icons.contrast_sharp,
              currentPage == DrawerSections.formulario5 ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.formulario1;
            } else if (id == 2) {
              currentPage = DrawerSections.formulario2;
            } else if (id == 3) {
              currentPage = DrawerSections.formulario3;
            } else if (id == 4) {
              currentPage = DrawerSections.formulario4;
            } else if (id == 5) {}
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  formulario1,
  formulario2,
  formulario3,
  formulario4,
  formulario5,
}
