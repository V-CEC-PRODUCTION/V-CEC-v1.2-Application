import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/notices/notices_cubit_cubit.dart';
import 'package:vcec/domain/notices/notices_service.dart';
import 'package:vcec/presentation/notices/widgets/cec_notices_tab.dart';
import 'package:vcec/presentation/notices/widgets/ktu_notices_tab.dart';

class NoticesTabbar extends StatefulWidget {
  const NoticesTabbar({super.key});

  @override
  State<NoticesTabbar> createState() => _NoticesTabbarState();
}

class _NoticesTabbarState extends State<NoticesTabbar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<NoticesCubit>(context)
          .getNotices(type: NoticeType.cec);
      BlocProvider.of<NoticesCubit>(context).getNotices(type: NoticeType.ktu);
    });
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4.5),
                  child: TabBar(
                    indicatorColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: tabController,
                    tabs: const [
                      Text(
                        " CEC ",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Text(
                        ' KTU ',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Divider(
                    thickness: .8,
                  ),
                ],
              ))
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: const [CECNoticesTab(), KTUNoticesTab()],
          ),
        )
      ],
    );
  }
}
