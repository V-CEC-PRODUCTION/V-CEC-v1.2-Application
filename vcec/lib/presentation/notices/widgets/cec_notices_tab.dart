import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/notices/notices_cubit_cubit.dart';
import 'package:vcec/domain/notices/notices_service.dart';
import 'package:vcec/presentation/notices/widgets/notice_tile.dart';

class CECNoticesTab extends StatelessWidget {
 
  const CECNoticesTab({super.key, });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<NoticesCubit, NoticesState>(
        builder: (context, state) {
          return state.cecfailureOrSuccess.fold(() {
            return const Center(child: Text('Searching...'));
          }, (a) {
            return a.fold((l) {
              return const Center(
                child: Text('Error'),
              );
            }, (r) {
              return r.isEmpty
                  ? const Center(
                      child: Text('No results'),
                    )
                  : Column(
                      children: List.generate(r.length, (index) {
                        return NoticeTileWidget(
                          type: NoticeType.cec,
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
