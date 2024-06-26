import 'package:xpert_autism/features/patient/domain/entities/results_entity.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ResultsModel extends Results {
  ResultsModel({required super.emotions});

  ResultsModel copyWith({
    Map<String, String>? emotions,
  }) {
    return ResultsModel(
      emotions: emotions ?? this.emotions,
    );
  }

  Map<String, dynamic> toMap() {
    return {'emotions': emotions};
  }

  factory ResultsModel.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> rawEmotions = map['emotions'] ?? map;
    Map<String, String> emotions = rawEmotions.map((key, value) => MapEntry(key, value.toString()));
    return ResultsModel(emotions: emotions);
  }

  String toJson() => json.encode(toMap());

  factory ResultsModel.fromJson(String source) =>
      ResultsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ResultsModel(emotions: $emotions)';

  @override
  bool operator ==(covariant ResultsModel other) {
    if (identical(this, other)) return true;

    return mapEquals(other.emotions, emotions);
  }

  @override
  int get hashCode => emotions.hashCode;
}
