import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/infrastructure/notification/notification_handle.dart';
import 'package:vcec/presentation/departments/departments_screen.dart';
import 'package:vcec/presentation/events/events_screen.dart';
import 'package:vcec/presentation/mainmenu/mainmenu_screen.dart';
import 'package:vcec/presentation/notices/notices_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (message.data["type"] == null) {
      return;
    }
    final type = message.data["type"] ?? "&";
    final eventId = message.data["event_id"] ?? "&";
    final payload = "$type,$eventId";
    NotificationHandle().handleNotificationNavigation(
      context,
      payload: payload,
    );
  }

  Future<bool> showExitConfirmationDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit App?'),
        content: const Text('Are you sure you want to exit the app?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child:const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child:const Text('Yes'),
          ),
        ],
      ),
    );
  }

  final ValueNotifier<int> pagenotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setupInteractedMessage();
    });
    return WillPopScope(
      onWillPop: () async {
        if (pagenotifier.value != 0) {
          pagenotifier.value = 0;
          pagenotifier.notifyListeners();
          return false;
        }
        return await showExitConfirmationDialog();
      },
      child: Scaffold(
        body: ValueListenableBuilder(
            valueListenable: pagenotifier,
            builder: (context, newIndex, _) {
              return IndexedStack(
                index: newIndex,
                children: [
                  const MainMenuScreen(),
                  EventsScreen(),
                  NoticesScreen(),
                  DepartmentsScreen(),
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
                items: const [
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
                ],
                onTap: (value) {
                  pagenotifier.value = value;
                  pagenotifier.notifyListeners();
                },
              );
            }),
      ),
    );
  }
}
