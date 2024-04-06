import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcec/application/cecify/cecify_cubit.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/cecify_radio/cecify_radio_screen.dart';
import 'package:vcec/presentation/common_widgets/common_snackbar.dart';
import 'package:vcec/presentation/common_widgets/loading_widget.dart';
import 'package:vcec/presentation/mainmenu/widgets/cecify_radio_episodes_horizontal_widget.dart';
import 'package:vcec/presentation/mainmenu/widgets/cecify_season_dropdown_widget.dart';

class CecifyRadioWidget extends StatelessWidget {
  CecifyRadioWidget({super.key});

  final bool isTileSelected = false;
  final ValueNotifier<String> selectedSeason = ValueNotifier('Season 1');

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (BlocProvider.of<CecifyCubit>(context).state.colors.isEmpty) {
        BlocProvider.of<CecifyCubit>(context).getColors();
      }
    });
    return BlocConsumer<CecifyCubit, CecifyState>(
      listener: (context, state) {
        state.isFailureOrSuccess.fold(
          () {},
          (either) => either.fold(
            (failure) {
              if (!state.isLoading) {
                if (failure == const MainFailure.serverFailure()) {
                  displaySnackBar(context: context, text: "Server is down");
                } else if (failure == const MainFailure.clientFailure()) {
                  displaySnackBar(
                      context: context,
                      text: "Something wrong with your network6");
                } else if (failure == const MainFailure.authFailure()) {
                  displaySnackBar(
                      context: context, text: 'Access token timed out');
                } else {
                  displaySnackBar(
                      context: context, text: "Something Unexpected Happened");
                }
              }
            },
            (r) {},
          ),
        );
      },
      builder: (context, state) {
        if (state.isLoading && state.episodes.isEmpty) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 300.w,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30.w),
                  ),
                ),
              ),
            ),
          );
        }
        if (state.colors.isNotEmpty && state.episodes.isNotEmpty) {
          print('Season ${state.selectedSeason}'); 
          selectedSeason.value = 'Season ${state.selectedSeason}';
          selectedSeason.notifyListeners();
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 11.5.sp, horizontal: 17.sp),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 340.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.w),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [0.1, 0.25, 0.75, .9],
                  colors: [
                    Color(int.parse(
                        'FF' +
                            state
                                .colors[(state.colors.length -
                                        state.selectedSeason) %
                                    state.colors.length]
                                .color1!,
                        radix: 16)),
                    Color(int.parse(
                        'FF' +
                            state
                                .colors[(state.colors.length -
                                        state.selectedSeason) %
                                    state.colors.length]
                                .color2!,
                        radix: 16)),
                    Color(int.parse(
                        'FF' +
                            state
                                .colors[(state.colors.length -
                                        state.selectedSeason) %
                                    state.colors.length]
                                .color3!,
                        radix: 16)),
                    Color(int.parse(
                        'FF' +
                            state
                                .colors[(state.colors.length -
                                        state.selectedSeason) %
                                    state.colors.length]
                                .color4!,
                        radix: 16)),
                  ],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CecifyRadioScreen(
                                      index: state.selectedSeason,
                                      model: state.episodes,
                                    )));
                          },
                          child: Text(
                            'CECify Radio',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.w,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        CecifySeasonDropDownWidget(
                          colors: state.colors,
                          selectedSeason: selectedSeason,
                          seasonLength: state.colors.length,
                        )
                      ],
                    ),
                  ),
                  state.isLoading
                      ? Center(
                          child: SizedBox(
                            child: loadingWidget,
                            height: 220.w,
                          ),
                        )
                      : CecifyRadioEpisodesHorizontalWidget(
                          imageUrl: state.episodes,
                          length: state.colors.length,
                        ),
                  kheight20
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
