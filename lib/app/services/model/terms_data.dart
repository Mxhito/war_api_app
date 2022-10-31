import 'package:json_annotation/json_annotation.dart';

part 'terms_data.g.dart';

@JsonSerializable()
class TermsData {
  TermsData({required this.title, required this.icon});
  final String? title;
  final String? icon;

  factory TermsData.fromJson(Map<String, dynamic> json) =>
      _$TermsDataFromJson(json);

  Map<String, dynamic> toJson() => _$TermsDataToJson(this);

  @override
  String toString() {
    return 'title: $title, icon: $icon';
  }
}
