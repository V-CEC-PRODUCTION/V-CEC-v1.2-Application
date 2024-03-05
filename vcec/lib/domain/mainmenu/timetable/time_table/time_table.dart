import 'package:vcec/domain/mainmenu/timetable/time_table/result.dart';

class TimeTableModel {
  final String thumbnailUrl;
  final String imageThumbnailUrl;
  final List<TimeTable> result;
  final String name;
  TimeTableModel({
    required this.thumbnailUrl,
    required this.imageThumbnailUrl,
    required this.result,
    required this.name,
  });
  factory TimeTableModel.fromJson(Map<String, dynamic> json) {
    final List<TimeTable> timeTable = [];
    for (var i = 0; i < json['result'].length; i++) {
      timeTable.add(TimeTable.fromJson(json['result'][i]));
    }
    return TimeTableModel(
      thumbnailUrl: json['thumbnail_url'] ?? "",
      imageThumbnailUrl: json['image_thumbnail_url'] ?? "",
      result: timeTable,
      name: json.containsKey('name') ? json['name'] : 'Unknown',
    );
  }
}
