import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/notices/notices_cubit_cubit.dart';
import 'package:vcec/domain/notices/notices_service.dart';
import 'package:vcec/presentation/notices/widgets/notice_tile.dart';

class CECNoticesTab extends StatelessWidget {
  const CECNoticesTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<NoticesCubit, NoticesState>(
        builder: (context, state) {
          return state.cecfailureOrSuccess.fold(() {
            return const Center(child: Text('Searching...'));
          }, (a) {
            return a.fold((l) {
              return Center(
                child: Container(
                  width: 320,
                  height: 320,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.nopcommerce.com/images/thumbs/0005720_coming-soon-page_550.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
