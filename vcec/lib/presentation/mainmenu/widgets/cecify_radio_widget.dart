import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcec/application/cecify/cecify_cubit.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/cecify_radio/cecify_radio_screen.dart';
import 'package:vcec/presentation/common_widgets/common_snackbar.dart';
import 'package:vcec/presentation/mainmenu/widgets/cecify_radio_episodes_horizontal_widget.dart';
import 'package:vcec/presentation/mainmenu/widgets/cecify_season_dropdown_widget.dart';

class CecifyRadioWidget extends StatelessWidget {
  CecifyRadioWidget({super.key});

  final bool isTileSelected = false;
  final ValueNotifier<String> selectedSeason = ValueNotifier('Season 1');

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<CecifyCubit>(context).getSeasons();
      BlocProvider.of<CecifyCubit>(context).getColors();
      BlocProvider.of<CecifyCubit>(context).getEpisodes(1);
      AuthTokenManager.instance.setIndex(0);
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
        state.isFailureOrSuccessForColors.fold(
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
        state.isFailureOrSuccessForEpisodes.fold(
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
        return state.isFailureOrSuccessForColors.fold(
          () {
            return Shimmer.fromColors(
                baseColor: const Color.fromARGB(255, 0, 0, 0),
                highlightColor: const Color.fromARGB(255, 207, 207, 207),
                child: Padding(
                  padding: EdgeInsets.all(27.w),
                  child: Container(
                    height: 270,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(34, 0, 0, 0),
                        borderRadius: BorderRadius.circular(30.w)),
                  ),
                ));
          },
          (either) => either.fold(
            (failure) {
              return Padding(
                padding: EdgeInsets.all(30.w),
                child: Container(
                  height: 270,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(33, 28, 86, 246),
                      borderRadius: BorderRadius.circular(30.w)),
                ),
              );
            },
            (success) {
              return state.isFailureOrSuccessForEpisodes.fold(() {
                return Shimmer.fromColors(
                    baseColor: const Color.fromARGB(255, 0, 0, 0),
                    highlightColor: const Color.fromARGB(255, 207, 207, 207),
                    child: Padding(
                      padding: EdgeInsets.all(27.w),
                      child: Container(
                        height: 270,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(34, 0, 0, 0),
                            borderRadius: BorderRadius.circular(30.w)),
                      ),
                    ));
              },
                  (either) => either.fold((failure) {
                        return Padding(
                          padding: EdgeInsets.all(30.w),
                          child: Container(
                            height: 270,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(33, 28, 86, 246),
                                borderRadius: BorderRadius.circular(30.w)),
                          ),
                        );
                      }, (r) {
                        final index = AuthTokenManager.instance.index;
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.w),
                              gradient: LinearGradient(
                                // Where the linear gradient begins and ends
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                // Add one stop for each color. Stops should increase from 0 to 1
                                stops: [0.1, 0.25, 0.75, .9],
                                colors: [
                                  // Colors are easy thanks to Flutter's Colors class.
                                  Color(int.parse(
                                      'FF' + success[index!].color1!,
                                      radix: 16)),
                                  Color(int.parse('FF' + success[index].color2!,
                                      radix: 16)),
                                  Color(int.parse('FF' + success[index].color3!,
                                      radix: 16)),
                                  Color(int.parse('FF' + success[index].color4!,
                                      radix: 16)),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
final index = AuthTokenManager.instance.index;
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                       CecifyRadioScreen(index: index!+1,model: r,)));
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
                                        selectedSeason: selectedSeason,
                                        seasonLength: success.length,
                                      )
                                    ],
                                  ),
                                ),
                                CecifyRadioEpisodesHorizontalWidget(
                                  imageUrl: r,
                                  length: r.length,
                                ),
                                kheight20
                              ],
                            ),
                          ),
                        );
                      }));
            },
          ),
        );
      },
    );
  }
}
