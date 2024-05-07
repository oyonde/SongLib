import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../common/utils/constants/app_constants.dart';

part 'draft.g.dart';

@Entity(tableName: AppConstants.booksTable)
@JsonSerializable()
class Draft {
  @PrimaryKey(autoGenerate: true)
  int? rid;
  int? book;
  int? songId;
  int? songNo;
  String? title;
  String? alias;
  String? content;
  String? key;
  String? author;
  int? views;
  int? likes;
  bool? liked;
  String? created;
  String? updated;

  Draft({
    this.rid,
    this.book,
    this.songId,
    this.songNo,
    this.title,
    this.alias,
    this.content,
    this.key,
    this.author,
    this.views,
    this.likes,
    this.liked,
    this.created,
    this.updated,
  });

  factory Draft.fromJson(Map<String, dynamic> json) => _$DraftFromJson(json);

  Map<String, dynamic> toJson() => _$DraftToJson(this);
}
