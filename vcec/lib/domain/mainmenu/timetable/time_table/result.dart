class TimeTable {
  final String firstcode;
  final String secondcode;
  final String thirdcode;
  final String fourthcode;

  final String fifthcode;
  final String sixthcode;
  final String firsttime;
  final String secondtime;
  final String thirdtime;
  final String fourthtime;
  final String fifthtime;
  final String sixthtime;
  final String currentcode;
  final String currenttime;
  TimeTable({
    required this.firstcode,
    required this.secondcode,
    required this.thirdcode,
    required this.fourthcode,
    required this.fifthcode,
    required this.sixthcode,
    required this.firsttime,
    required this.secondtime,
    required this.thirdtime,
    required this.fourthtime,
    required this.fifthtime,
    required this.sixthtime,
    required this.currentcode,
    required this.currenttime,
  });
  factory TimeTable.fromJson(Map<String, dynamic> json) {
    return TimeTable(
      firstcode: json['firstcode'],
      secondcode: json['secondcode'],
      thirdcode: json['thirdcode'],
      fourthcode: json['fourthcode'],
      fifthcode: json['fifthcode'],
      sixthcode: json['sixthcode'],
      firsttime: json['firsttime'],
      secondtime: json['secondtime'],
      thirdtime: json['thirdtime'],
      fourthtime: json['fourthtime'],
      fifthtime: json['fifthtime'],
      sixthtime: json['sixthtime'],
      currentcode: json['currentcode'],
      currenttime: json['currenttime'],
    );
  }
}
