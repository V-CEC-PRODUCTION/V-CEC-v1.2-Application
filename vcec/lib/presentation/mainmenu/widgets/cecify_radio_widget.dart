import 'package:flutter/material.dart';
import 'package:vcec/core/colors.dart';

const List<String> SeasonLabel = ['One', 'Two', 'Three', 'Four'];

class CecifyRadioWidget extends StatelessWidget {
  CecifyRadioWidget({super.key});

  final ValueNotifier<String> selectedSeason = ValueNotifier(SeasonLabel.first);

  final bool isTileSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Color(0xff0C4383),
              Color(0xff072166),
              Color(0xff071D63),
              Color(0xff0C4383),
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CECify Radio',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                  ValueListenableBuilder(
                    valueListenable: selectedSeason,
                    builder: (context, value, child) {
                      return DropdownButton(
                        value: selectedSeason.value,
                        underline: Container(),
                        dropdownColor: Colors.transparent,
                        items: SeasonLabel.map<DropdownMenuItem<String>>(
                            (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          selectedSeason.value = value!;
                        },
                      );
                    },
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    9,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: kblack,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        foregroundDecoration: BoxDecoration(
                                            color: Colors.black26),
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                print('object1');
                                              },
                                              icon: Icon(Icons.play_arrow)),
                                          IconButton(
                                              onPressed: () {
                                                print('object2');
                                              },
                                              icon: Icon(Icons.wifi)),
                                          IconButton(
                                              onPressed: () {
                                                print('object3');
                                              },
                                              icon: Icon(Icons.menu)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Column(children: [
                                      Text(
                                        'Title',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 11.0),
                                        child: Text(
                                          'Subtitle',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ]),
                                  )
                                ],
                              )),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
