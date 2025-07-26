import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_web_project/utils/menu_item.dart';


class Navbar extends StatefulWidget {
  const Navbar({super.key,required this.onTapLanguage,required this.onTapProfile});

  final void Function() onTapLanguage;
  final void Function() onTapProfile;

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool isSwitch = false;
  int value = 0;
  int? nullableValue;
  bool positive = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const BeveledRectangleBorder(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 100,width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/fav.png',fit: BoxFit.cover,),
                SizedBox(width: 10,),
                Text('Suvchilar maktabi',style: TextStyle(fontFamily: "Merriweather",fontSize: 20),)
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text("Menu",style: TextStyle(fontFamily: "Merriweather"),),
            ),
            SizedBox(height: 8,),
            MenuItem(),
            SizedBox(height: 14,),
            MenuItem(),
            SizedBox(height: 14,),
            MenuItem(),
            SizedBox(height: 14,),
            MenuItem(),
          ],
        ),
      ),
    );
  }
}
