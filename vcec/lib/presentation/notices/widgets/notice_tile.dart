import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/notices/notice_model/notices_result.dart';
import 'package:vcec/domain/notices/notices_service.dart';

class NoticeTileWidget extends StatelessWidget {
  NoticeTileWidget(
      {super.key,
      required this.expanpsionNeeded,
      required this.notice,
      required this.type});
  final NoticesResult notice;
  final bool expanpsionNeeded;
  final NoticeType type;
  ValueNotifier<bool> _isexpanded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (value) {
        print(value);
        _isexpanded.value = value;
        _isexpanded.notifyListeners();
      },
      tilePadding: EdgeInsets.only(
        top: 12,
        bottom: 12,
        left: 14,
        right: 10,
      ),
      leading: const CircleAvatar(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: _isexpanded,
                builder: (BuildContext ctx, bool _isexpanded, Widget? _) {
                  return Text(notice.headline!,
                      maxLines: _isexpanded != true ? 2 : 20,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ));
                }),
          ),
          Text(notice.dateOfUpload!,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ))
        ],
      ),
      subtitle: ValueListenableBuilder(
        valueListenable: _isexpanded,
        builder: (BuildContext ctx, bool _isexpanded, Widget? _) {
          return Text(
            notice.details!,
            maxLines: _isexpanded != true ? 2 : 30,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11,
            ),
          );
        },
      ),
      trailing: Visibility(
        visible: expanpsionNeeded,
        child: Icon(Icons.keyboard_arrow_down),
      ),
      textColor: Colors.black,
      iconColor: expanpsionNeeded ? Colors.black : null,
      children: expanpsionNeeded
          ? List.generate(
              notice.noticeUrls!.length,
              (index) => InnerTileWidget(
                notice: notice,
                index: index,
                type: type,
              ),
            )
          : const <Widget>[],
    );
  }
}

class InnerTileWidget extends StatelessWidget {
  final NoticesResult notice;
  final NoticeType type;
  final int index;
  const InnerTileWidget(
      {super.key,
      required this.notice,
      required this.index,
      required this.type});

  @override
  Widget build(BuildContext context) {
    final noticeUrl = notice.noticeUrls![index];
    final Uri _url = Uri.parse(noticeUrl.url!);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
      child: Row(
        children: [
          SizedBox(
            height: 60,
            width: 25,
          ),
          CircleAvatar(
            radius: 4,
            backgroundColor: Color.fromARGB(255, 123, 248, 109),
          ),
          kwidth5,
          SizedBox(
            width: MediaQuery.of(context).size.width - 135,
            child: Text(noticeUrl.urlHead!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                )),
          ),
          Expanded(child: Container()),
          IconButton(
              onPressed: () {
                _launchUrl(_url);
              },
              icon: Icon(
                Icons.link,
                size: 20,
              )),
          kwidth10,
          type == NoticeType.cec
              ? GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.file_download_outlined,
                    size: 20,
                  ),
                )
              : SizedBox(),
          kwidth10,
          type == NoticeType.cec
              ? GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.open_in_new,
                    size: 20,
                  ),
                )
              : SizedBox(),
          kwidth10,
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri url1) async {
    if (!await launchUrl(url1)) {
      throw Exception('Could not launch $url1');
    }
  }
}

// import 'package:flutter/material.dart';

// class DropdownExample extends StatelessWidget {
//   final ValueNotifier<String?> selectedValue =
//       ValueNotifier<String>('Option 1');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dropdown Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ValueListenableBuilder(
//               valueListenable: selectedValue,
//               builder: (context, value, child) {
//                 return Text(
//                   'Selected value: ${value ?? 'None'}',
//                   style: TextStyle(fontSize: 18),
//                 );
//               },
//             ),
//             SizedBox(height: 20),
//             DropdownButton<String>(
//               value: ValueListenableBuilder(
//                 valueListenable: selectedValue,
//                 builder: (context, value, child) {
//                   return Text(
//                     'Selected value: ${value ?? 'None'}',
//                     style: TextStyle(fontSize: 18),
//                   );
//                 },
//               ).toString(),
//               onChanged: (newValue) {
//                 selectedValue.value = newValue;
//               },
//               items: [
//                 DropdownMenuItem(
//                   value: 'Option 1',
//                   child: Text('Option 1'),
//                 ),
//                 DropdownMenuItem(
//                   value: 'Option 2',
//                   child: Text('Option 2'),
//                 ),
//                 DropdownMenuItem(
//                   value: 'Option 3',
//                   child: Text('Option 3'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
