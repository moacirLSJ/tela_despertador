import 'package:flutter/material.dart';

class AppHeader extends StatefulWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Alarme',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 28,
              color: Color(0xffBDBDBD)
            ),
          ),
          PopupMenuButton<int>(
            color: Color(0xffBDBDBD),
              iconSize: 35,
              itemBuilder: (item) => [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text('logout'),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Settings'),
                ),
              ])
        ],
      ),
    );
  }
}
