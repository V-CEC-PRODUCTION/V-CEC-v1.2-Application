class WholeEventsModel {
  WholeEventsModel({
    required this.events,
  });

  final List<EventModel> events;

  factory WholeEventsModel.fromJson(Map<String, dynamic> json) =>
      WholeEventsModel(
        events: List<EventModel>.from(
            json["events"].map((x) => EventModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class EventModel {
  EventModel({
    required this.id,
    required this.title,
    required this.content,
    required this.registerButtonLink,
    required this.posterImageUrl,
    required this.thumbnailPosterImageUrl,
    required this.whatsappLink,
    required this.status,
    required this.publishDate,
    required this.publishedBy,
    required this.hashtags,
    required this.eventDate,
  });

  final int id;
  final String title;
  final String content;
  final String registerButtonLink;
  final String posterImageUrl;
  final String thumbnailPosterImageUrl;
  final dynamic whatsappLink;
  final String status;
  final DateTime publishDate;
  final String publishedBy;
  final String hashtags;
  final String eventDate;
  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"] ?? "" ?? "",
        title: json["title"] ?? "",
        content: json["content"] ?? "",
        registerButtonLink: json["register_button_link"] ?? "",
        posterImageUrl: json["poster_image_url"] ?? "",
        thumbnailPosterImageUrl: json["thumbnail_poster_image_url"] ?? "",
        whatsappLink: json["whatsapp_link"] ?? "" ?? "",
        status: json["status"] ?? "",
        publishDate: DateTime.parse(json["publish_date"]),
        publishedBy: json["published_by"] ?? "",
        hashtags: json["hashtags"] ?? "",
        eventDate: json["event_date"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "register_button_link": registerButtonLink,
        "poster_image_url": posterImageUrl,
        "thumbnail_poster_image_url": thumbnailPosterImageUrl,
        "whatsapp_link": whatsappLink,
        "status": status,
        "publish_date": publishDate.toIso8601String(),
        "published_by": publishedBy,
        "hashtags": hashtags,
        "event_date": eventDate,
      };
}
