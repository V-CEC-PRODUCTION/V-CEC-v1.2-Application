import 'package:flutter/material.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';

class EventsDetailedScreen extends StatelessWidget {
  const EventsDetailedScreen({super.key});
  final String title = "MVP 4.0";
  final String time = "4:00 pm";
  final String date = "15 July";
  final String venue = "AC Auditorium";
  final String content =
      'IEEE Student Branch College of Engineering Chengannur is gearing up to introduce the latest iteration of the Micro-Volunteering Program, MVP 4.0.This endeavour presents unique opportunities for students to enhance their volunteering skills. \n\n The objective of MVP 4.0 is to introduce participants to the advantages of IEEE, providing them with an advanced platform to exchange knowledge, cultivate skills, and engage in various meaningful activities.\n\nVisit our official site for the latest updates: www.mvp4.cecieee.org\n\nPoint of contact:\n\nGopika Chandran: +91 8289820924\nAkash M Nandan: +91 7356511419';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: ListView(
          children: [
            kheight15,
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                SizedBox(
                  width: size * .8,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size * .06, vertical: size * .025),
              child: Container(
                height: size * .88,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1504600770771-fb03a6961d33?auto=format&fit=crop&q=80&w=1782&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    )),
              ),
            ),
            kheight5,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _TimeDateVenueTextWidget(title: time),
                      const _TimeDateVenueTextWidget(title: "|"),
                      _TimeDateVenueTextWidget(title: date),
                      const _TimeDateVenueTextWidget(title: "|"),
                      _TimeDateVenueTextWidget(title: venue)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 5, vertical: size * .05),
                    child: Text(
                      content,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Text(
                    'Conducted By',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  kheight10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 50,
                          child: const _ConductedLogoWidget(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 90,
            )
          ],
        ),
      )),
      floatingActionButton: Row(mainAxisSize: MainAxisSize.min, children: [
        _EventsButtonWidget(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 13),
            child: Text(
              'Register',
              style: TextStyle(color: kwhite, fontSize: 22),
            ),
          ),
          onTap: () {},
        ),
        kwidth10,
        _EventsButtonWidget(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: size * .0435),
              child: const Icon(
                Icons.thumb_up,
                color: kwhite,
              ),
            ))
      ]),
    );
  }
}

class _ConductedLogoWidget extends StatelessWidget {
  const _ConductedLogoWidget();

  @override
  Widget build(BuildContext context) {
    return const Image(
        image: NetworkImage(
            'https://images.unsplash.com/photo-1504600770771-fb03a6961d33?auto=format&fit=crop&q=80&w=1782&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'));
  }
}

class _EventsButtonWidget extends StatelessWidget {
  const _EventsButtonWidget({
    required this.onTap,
    required this.child,
  });

  final VoidCallback onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: const Color.fromARGB(255, 39, 38, 38),
        ),
        child: child);
  }
}

class _TimeDateVenueTextWidget extends StatelessWidget {
  const _TimeDateVenueTextWidget({
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
