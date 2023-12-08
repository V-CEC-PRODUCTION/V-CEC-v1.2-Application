import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/main_menu/timetable/timetable_cubit.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/common_widgets/sub_heading.dart';
import 'package:vcec/presentation/mainmenu/subpages/cec_gallery_screen1.dart';
//import 'package:vcec/presentation/mainmenu/subpages/cec_gallery_screen.dart';
import 'package:vcec/presentation/mainmenu/widgets/appbar.dart';
import 'package:vcec/presentation/mainmenu/widgets/carousel.dart';
import 'package:vcec/presentation/mainmenu/widgets/cec_gallery.dart';
//import 'package:vcec/presentation/mainmenu/widgets/highlights.dart';
import 'package:vcec/presentation/mainmenu/widgets/highlights1.dart';
import 'package:vcec/presentation/mainmenu/widgets/story_widget.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<TimetableCubit>(context).getTimetable();
    });
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            BlocBuilder<TimetableCubit, TimetableState>(
              builder: (context, state) {
                return state.timetableFailureOrSuccess.fold(
                  () {
                    return MainmenuAppbar(
                        currentPeriod: '...', duration: 'Loading...');
                  },
                  (either) {
                    return either.fold(
                      (failure) {
                        return MainmenuAppbar(
                          currentPeriod: 'Error',
                          duration: '00-00',
                        );
                      },
                      (success) {
                        return MainmenuAppbar(
                          currentPeriod: success.current ?? '...',
                          duration: success.durationTime ?? '..',
                          timeTable: success.timeTable,
                        );
                      },
                    );
                  },
                );
              },
            )
          ],
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kheight10,
                StoryWidget(),
                kheight10,
                CarouselMainManu(),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: SubHeading(text: 'Highlights'),
                ),
                kheight10,
                Highlights(),
                kheight10,
                //  Padding(
                //     padding: const EdgeInsets.only(left: 20, top: 10),
                //     child: SubHeading(text: 'CEC Today'),
                //   ),
                //   CecToday(),
                Row(
                  children: [
                    kwidth20,
                    SubHeading(text: 'CEC Gallery'),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CecGalleryScreen(),
                            ));
                      },
                      child: Text('view all'),
                    ),
                    kwidth20,
                  ],
                ),
                CecGallery(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
