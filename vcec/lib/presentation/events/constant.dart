import 'events_functions/forum_filter_button_functions.dart';

String commonimg =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbdT9q3Pf_h4_XIVDWiL_F2YDquviajia7N7IusK3DScEGHkCvTqwP5QMLNhFhPAMe1QU';
String eventname = 'Event Name';
String commontime = "9:00 am";
String description = "description in a few words";
String commondate = "2023-12-12";

List<String> forumNames = [
  'PRODDEC',
  'IEEE',
  'IEDC',
  'NSS',
  'NCC',
  'ARC',
  'TPC',
  'Tinkerhub',
  'Media Cell',
  'FOCES',
  'ExESS',
  'Surge',
  'ED Club',
];
List<Function> forumOnTap = [
  proddecButtonFunc,
  ieeeButtonFunc,
  iedcButtonFunc,
  nssButtonFunc,
  nccButtonFunc,
  arcButtonFunc,
  tpcButtonFunc,
  tinkerhubButtonFunc,
  mediacellButtonFunc,
  focesButtonFunc,
  exessButtonFunc,
  surgeButtonFunc,
  edclubButtonFunc,
];
