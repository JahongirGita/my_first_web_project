import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({super.key});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_){
        setState(() {
          _hovering = true;
        });
      },
      onExit: (_){
        setState(() {
          _hovering = false;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            gradient: _hovering ? LinearGradient(colors: [Color(0xFF455DE4),Color(0xFF4D68FF),Color(0xFF455DE4)]) : null,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 16,horizontal: 10),child: Icon(Iconsax.status,color: _hovering ? Colors.white : Color(0xFFB3B3B3),),),
            Text("Dashboard",style: TextStyle(color: _hovering ? Colors.white : Color(0xFFB3B3B3),fontFamily: "Merriweather"),),
          ],
        ),
      ),
    );
  }
}
