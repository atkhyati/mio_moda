import 'package:json_annotation/json_annotation.dart';

part 'terms_and_condition_model.g.dart';

@JsonSerializable()
class TermsAndConditionsModel {
  TermsAndConditionsModel({
    this.id,
    this.identifier,
    this.title,
    this.pageLayout,
    this.metaTitle,
    this.metaKeywords,
    this.metaDescription,
    this.contentHeading,
    this.content,
    this.creationTime,
    this.updateTime,
    this.sortOrder,
    this.layoutUpdateXml,
    this.customTheme,
    this.customRootTemplate,
    this.active,
  });

  int? id;
  String? identifier;
  String? title;
  @JsonKey(name: 'page_layout')
  String? pageLayout;
  @JsonKey(name: 'meta_title')
  String? metaTitle;
  @JsonKey(name: 'meta_keywords')
  String? metaKeywords;
  @JsonKey(name: 'meta_description')
  String? metaDescription;
  @JsonKey(name: 'content_heading')
  String? contentHeading;
  String? content;
  @JsonKey(name: 'creation_time')
  String? creationTime;
  @JsonKey(name: 'update_time')
  String? updateTime;
  @JsonKey(name: 'sort_order')
  String? sortOrder;
  @JsonKey(name: 'layout_update_xml')
  String? layoutUpdateXml;
  @JsonKey(name: 'custom_theme')
  String? customTheme;
  @JsonKey(name: 'custom_root_template')
  String? customRootTemplate;
  bool? active;

  factory TermsAndConditionsModel.fromJson(Map<String, dynamic> json) =>
      _$TermsAndConditionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TermsAndConditionsModelToJson(this);
}
