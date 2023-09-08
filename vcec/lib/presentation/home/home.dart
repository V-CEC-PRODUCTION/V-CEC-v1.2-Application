import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/presentation/departments/departments_screen.dart';
import 'package:vcec/presentation/events/events_screen.dart';
import 'package:vcec/presentation/forums/forum_screen.dart';
import 'package:vcec/presentation/mainmenu/mainmenu_screen.dart';
import 'package:vcec/presentation/notices/notices_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ValueNotifier<int> pagenotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: pagenotifier,
          builder: (context, newIndex, _) {
            return IndexedStack(
              index: newIndex,
              children: [
                MainMenuScreen(),
                EventsScreen(),
                NoticesScreen(),
                DepartmentsScreen(),
                ForumScreen(name: 'Riya'),
              ],
            );
          }),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: pagenotifier,
          builder: (context, newIndex, _) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: newIndex,
              // iconSize: 30,
              selectedItemColor: kblack,
              unselectedItemColor: kBlackBlurr,
              showSelectedLabels: false, showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                      size: 29.5,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.calendar_month_sharp,
                      size: 26,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.notifications_none,
                      size: 29.5,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.group_outlined,
                      size: 29,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.insert_drive_file_outlined,
                      size: 23,
                    ),
                    label: ''),
              ],
              onTap: (value) {
                pagenotifier.value = value;
                pagenotifier.notifyListeners();
              },
            );
          }),
    );
  }
}
