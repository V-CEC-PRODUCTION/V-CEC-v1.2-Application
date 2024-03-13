import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/application/cecify/cecify_cubit.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/cecify/episodes/episodes_model.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/cecify_radio/widgets/cecify_title_section_widget.dart';
import 'package:vcec/presentation/cecify_radio/widgets/episodes_list_widget.dart';
import 'package:vcec/presentation/common_widgets/common_snackbar.dart';
import 'package:vcec/presentation/common_widgets/loading_widget.dart';

class CecifyRadioScreen extends StatelessWidget {
  const CecifyRadioScreen({super.key, required this.index, required this.model});
  final int index;
  final List<EpisodeResult> model;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return BlocConsumer<CecifyCubit, CecifyState>(
      listener: (context, state) {
        state.isFailureOrSuccess.fold(
            () => {},
            (either) => either.fold(
                  (failure) {
                    if (!state.isLoading) {
                      if (failure == const MainFailure.serverFailure()) {
                        displaySnackBar(
                            context: context, text: "Server is down");
                      } else if (failure == const MainFailure.clientFailure()) {
                        displaySnackBar(
                            context: context,
                            text: "Something wrong with your network8");
                      } else if (failure == const MainFailure.authFailure()) {
                        displaySnackBar(
                            context: context, text: 'Access token timed out');
                      } else {
                        displaySnackBar(
                            context: context,
                            text: "Something Unexpected Happened");
                      }
                    }
                  },
                  (r) {},
                ));
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const Scaffold(
            body: Center(
              child: loadingWidget,
            ),
          );
        }
        state.isFailureOrSuccess.fold(() {}, (either) {
          either.fold((failure) {
            if (failure == const MainFailure.clientFailure()) {
              return const Center(child: Text('Network Error...'));
            } else if (failure == const MainFailure.serverFailure()) {
              return const Center(child: Text('Server Error...'));
            } else {
              const Center(child: Text('Impossible Error...'));
            }
          }, (r) {});
        });
        return state.episodes == null
            ? Scaffold(
                body: Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: size * 0.2),
                  child: const Column(
                    children: [
                      SizedBox(
                        width: 320,
                        height: 320,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/img/nothing.png')))),
                      ),
                      Text(
                        'Nothing to Report',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
              )
            : Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CecifyTitleSectionWidget(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0.w, vertical: 11.w),
                        child: Text(
                          "CECify presents, CEC's own podcasts, for all CECians College of Engineering, Chengannnur",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: kblack, fontSize: 16.w),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0.w),
                        child: Text(
                          'All Episodes',
                          style: TextStyle(
                              color: kblack,
                              fontSize: 29.w,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      EpisodesListWidget(
                        index: index,
                        model: model,
                      ),
                      kheight10,
                    ],
                  ),
                ),
              );
      },
    );
  }
}
