import 'package:flutter/material.dart';
import 'package:vcec/presentation/cec_times/widgets/cec_times_list_widget.dart';
import 'package:vcec/presentation/common_widgets/appbar_with_search.dart';
import 'package:vcec/presentation/common_widgets/sub_heading.dart';

bool today = true;

class CecTimesScreen extends StatelessWidget {
  CecTimesScreen({super.key});

  final ValueNotifier<bool> isSearchingNotifier = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWithSearch(
          hintText: 'Search By Month', isSearchNotifier: isSearchingNotifier),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 14.0),
              child: SubHeading(text: 'CEC Times'),
            ),
            Visibility(
              visible: today,
              child: const CecTimesListWidget(
                title: 'Today',
              ),
            ),
            const CecTimesListWidget(title: 'May')
          ],
        ),
      ),
    );
  }
}
