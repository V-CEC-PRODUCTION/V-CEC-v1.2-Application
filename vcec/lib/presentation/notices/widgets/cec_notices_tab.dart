import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/notices/notices_cubit_cubit.dart';
import 'package:vcec/presentation/notices/widgets/notice_tile.dart';

class CECNoticesTab extends StatelessWidget {
  const CECNoticesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<NoticesCubit, NoticesState>(
        builder: (context, state) {
          return state.cecfailureOrSuccess.fold(() {
            return Center(child: CircularProgressIndicator());
          }, (a) {
            return a.fold((l) {
              return SizedBox();
            }, (r) {
              return Column(
                children: List.generate(r.length, (index) {
                  return NoticeTileWidget(
                    notice: r[index],
                    expanpsionNeeded: true,
                  );
                }),
              );
            });
          });
        },
      ),
    );
  }
}
