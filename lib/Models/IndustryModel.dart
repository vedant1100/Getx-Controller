// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

IndustryModel welcomeFromJson(String str) => IndustryModel.fromJson(json.decode(str));

String welcomeToJson(IndustryModel data) => json.encode(data.toJson());

class IndustryModel {
    int statusCode;
    List<Industry> data;

    IndustryModel({
        required this.statusCode,
        required this.data,
    });

    factory IndustryModel.fromJson(Map<String, dynamic> json) => IndustryModel(
        statusCode: json["statusCode"],
        data: List<Industry>.from(json["data"].map((x) => Industry.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Industry {
    String? inParent;
    String? inCreatedBy;
    String inDescription;
    String inName;
    String? inUpdatedBy;
    String? inCreatedAt;
    String inUpdatedAt;
    String inId;
    String inDp;
    int inTotalLikeCount;

    Industry({
        this.inParent,
        this.inCreatedBy,
        required this.inDescription,
        required this.inName,
        this.inUpdatedBy,
        this.inCreatedAt,
        required this.inUpdatedAt,
        required this.inId,
        required this.inDp,
        required this.inTotalLikeCount,
    });

    factory Industry.fromJson(Map<String, dynamic> json) => Industry(
        inParent: json["IN_parent"],
        inCreatedBy: json["IN_createdBy"],
        inDescription: json["IN_description"],
        inName: json["IN_name"],
        inUpdatedBy: json["IN_updatedBy"],
        inCreatedAt: json["IN_createdAt"],
        inUpdatedAt: json["IN_updatedAt"],
        inId: json["IN_id"],
        inDp: json["IN_dp"],
        inTotalLikeCount: json["IN_totalLikeCount"],
    );

    Map<String, dynamic> toJson() => {
        "IN_parent": inParent,
        "IN_createdBy": inCreatedBy,
        "IN_description": inDescription,
        "IN_name": inName,
        "IN_updatedBy": inUpdatedBy,
        "IN_createdAt": inCreatedAt,
        "IN_updatedAt": inUpdatedAt,
        "IN_id": inId,
        "IN_dp": inDp,
        "IN_totalLikeCount": inTotalLikeCount,
    };
}
