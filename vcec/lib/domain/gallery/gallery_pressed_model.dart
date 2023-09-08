import 'dart:convert';

class GalleryPressedModel {
	int? id;
	String? mediaFile;
	String? thumbnail;
	String? mediaUrl;
	String? thumbnailUrl;
	String? tag;
	DateTime? uploadTime;

	GalleryPressedModel({
		this.id, 
		this.mediaFile, 
		this.thumbnail, 
		this.mediaUrl, 
		this.thumbnailUrl, 
		this.tag, 
		this.uploadTime, 
	});

	@override
	String toString() {
		return 'GalleryPressedModel(id: $id, mediaFile: $mediaFile, thumbnail: $thumbnail, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, tag: $tag, uploadTime: $uploadTime)';
	}

	factory GalleryPressedModel.fromMap(Map<String, dynamic> data) {
		return GalleryPressedModel(
			id: data['id'] as int?,
			mediaFile: data['media_file'] as String?,
			thumbnail: data['thumbnail'] as String?,
			mediaUrl: data['media_url'] as String?,
			thumbnailUrl: data['thumbnail_url'] as String?,
			tag: data['tag'] as String?,
			uploadTime: data['upload_time'] == null
						? null
						: DateTime.parse(data['upload_time'] as String),
		);
	}



	Map<String, dynamic> toMap() => {
				'id': id,
				'media_file': mediaFile,
				'thumbnail': thumbnail,
				'media_url': mediaUrl,
				'thumbnail_url': thumbnailUrl,
				'tag': tag,
				'upload_time': uploadTime?.toIso8601String(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GalleryPressedModel].
	factory GalleryPressedModel.fromJson(String data) {
		return GalleryPressedModel.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [GalleryPressedModel] to a JSON string.
	String toJson() => json.encode(toMap());
}
