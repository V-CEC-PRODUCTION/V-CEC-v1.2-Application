import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/main_menu/timetable/timetable_cubit.dart';
import 'package:vcec/application/profile/profile_cubit.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/presentation/mainmenu/widgets/appbar.dart';
import 'package:vcec/presentation/mainmenu/widgets/carousel.dart';
import 'package:vcec/presentation/mainmenu/widgets/cec_gallery.dart';
import 'package:vcec/presentation/mainmenu/widgets/cecify_radio_widget.dart';
import 'package:vcec/presentation/mainmenu/widgets/highlights1.dart';

String myUri = "";

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<TimetableCubit>(context).getTimetable();
      BlocProvider.of<ProfileCubit>(context).getProfileDetails();
    });
    return Scaffold(
      body: BlocBuilder<TimetableCubit, TimetableState>(
          builder: (context, state) {
        return NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            state.timetableFailureOrSuccess.fold(
              () {
                return const MainmenuAppbar(
                  currentPeriod: '...',
                  duration: 'Loading...',
                  imageUrl: '',
                );
              },
              (either) {
                return either.fold(
                  (failure) {
                    return const MainmenuAppbar(
                      currentPeriod: 'Error',
                      duration: '00-00',
                    );
                  },
                  (success) {
                    print('Success: ${success.result[0].currentcode}');
                    log("Success: ${success.imageThumbnailUrl}");
                    log("Success: ${success.thumbnailUrl}");
                    if (AuthTokenManager.instance.userRole ==
                        UserRole.student) {
                      return MainmenuAppbar(
                        currentPeriod: success.result[0].currentcode,
                        duration: success.result[0].currenttime,
                        timeTable: success.result[0],
                        imageUrl: success.imageThumbnailUrl,
                        thumbnailUrl: success.thumbnailUrl,
                      );
                    } else {
                      return MainmenuAppbar(
                        currentPeriod: "",
                        duration: "",
                        imageUrl: success.imageThumbnailUrl,
                        thumbnailUrl: success.thumbnailUrl,
                      );
                    }
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
                const CarouselMainManu(),
                kheight10,
                const Highlights(),
                kheight10,
                CecifyRadioWidget(),
                kheight10,
                //  Padding(
                //     padding: const EdgeInsets.only(left: 20, top: 10),
                //     child: SubHeading(text: 'CEC Today'),
                //   ),
                //   CecToday(),

                CecGallery(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
