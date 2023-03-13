import 'package:flutter/material.dart';

import '../components/app_card.dart';
import '../components/app_head.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 120,
        height: 120,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Color(0xff9FBDED),
            child: Icon(
              Icons.add,
              size: 17,
            ),
            onPressed: () {},
          ),
        ),
      ),
      bottomNavigationBar: const FooterNav(),
      backgroundColor: const Color(0xff1E1E1E),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const AppHeader(),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              runSpacing: 15,
              children: [
                AppCard(
                  title: 'Trabalho',
                  freq: ['Seg.', 'Ter.', 'Qua.', 'Qui.', 'Sex.'],
                  time: '06:20',
                ),
                AppCard(
                  time: '07:00',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FooterNav extends StatefulWidget {
  const FooterNav({super.key});

  @override
  State<FooterNav> createState() => _FooterNavState();
}

class _FooterNavState extends State<FooterNav> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: BottomAppBar(
        elevation: 0,
        color: const Color(0xff2C2D31),
        child: SizedBox(
          height: 110,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                footItem(
                  icon: Icons.access_alarm,
                  tx: 'Alarme',
                  setIndex: 0,
                  selected: _selectedIndex,
                ),
                footItem(
                  icon: Icons.access_time,
                  tx: 'Relogio',
                  setIndex: 1,
                  selected: _selectedIndex,
                ),
                footItem(
                  icon: Icons.hourglass_bottom_outlined,
                  tx: 'Timer',
                  setIndex: 2,
                  selected: _selectedIndex,
                ),
                footItem(
                  icon: Icons.timer_outlined,
                  tx: 'Cronometro',
                  setIndex: 3,
                  selected: _selectedIndex,
                ),
                footItem(
                  icon: Icons.hotel_rounded,
                  tx: 'Dormir',
                  setIndex: 4,
                  selected: _selectedIndex,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column footItem({
    required IconData icon,
    required String tx,
    required int selected,
    required int setIndex,
  }) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 50,
          decoration: BoxDecoration(
            color:
                selected == setIndex ? Color(0xff004A78) : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: IconButton(
            icon: Icon(
              icon,
              size: 35,
            ),
            color: selected == setIndex ? Colors.white : Colors.white60,
            onPressed: () {
              setState(() {
                _selectedIndex = setIndex;
              });
            },
          ),
        ),
        Text(
          tx,
          style: TextStyle(
              color: selected == setIndex ? Colors.white : Colors.white60,
              fontSize: 20,
              fontWeight:
                  selected == setIndex ? FontWeight.w600 : FontWeight.w400),
        ),
      ],
    );
  }
}
