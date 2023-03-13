import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

class AppCard extends StatefulWidget {
  AppCard({Key? key, this.title = '', this.freq, this.time = ''})
      : super(key: key);

  final String title;

  final String time;

  final List? freq;

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    // return buildDecoratedBox();
    return test();
  }

  DecoratedBox test() {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0xff28272A),
        borderRadius: BorderRadius.all(Radius.circular(35)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xff444746),
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 28,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Container(
              margin: widget.title.isEmpty
                  ? const EdgeInsets.all(0)
                  : const EdgeInsets.only(top: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.time,
                style: const TextStyle(
                    fontSize: 58,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff8E8E8E)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      frequency(widget.freq),
                    ],
                  ),
                  SliderButton(
                    radius: 50,
                    width: 70,
                    height: 35,
                    buttonSize: 25,
                    buttonColor: const Color(0xffC3E8FF),
                    action: () => {},
                    backgroundColor: const Color(0xff444746),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DecoratedBox buildDecoratedBox() {
    return test();
  }

  textGrey(String tx, {double size = 12}) {
    return Text(
      tx,
      style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.normal,
          color: const Color(0xff8E8E8E)),
    );
  }

  Row frequency(List? f) {
    f = f ?? [];
    if (f.isEmpty) {
      return Row(
        children: [textGrey('Não programado', size: 20)],
      );
    }
    List<Widget> t = <Widget>[];
    t.add(textGrey(f.first, size: 18));
    f.removeAt(0);
    for (String element in f) {
      t.add(textGrey(", $element", size: 18));
    }
    return Row(
      children: t,
    );
  }
}
