import 'dart:convert';
/// weight : {"imperial":"40 - 65","metric":"18 - 29"}
/// height : {"imperial":"21 - 23","metric":"53 - 58"}
/// id : 4
/// name : "Airedale Terrier"
/// bred_for : "Badger, otter hunting"
/// breed_group : "Terrier"
/// life_span : "10 - 13 years"
/// temperament : "Outgoing, Friendly, Alert, Confident, Intelligent, Courageous"
/// origin : "United Kingdom, England"
/// reference_image_id : "1-7cgoZSh"

BreedInfo breedInfoFromJson(String str) => BreedInfo.fromJson(json.decode(str));
String breedInfoToJson(BreedInfo data) => json.encode(data.toJson());
class BreedInfo {
  BreedInfo({
      this.weight, 
      this.height, 
      this.id, 
      this.name, 
      this.bredFor, 
      this.breedGroup, 
      this.lifeSpan, 
      this.temperament, 
      this.origin, 
      this.referenceImageId,});

  BreedInfo.fromJson(dynamic json) {
    weight = json['weight'] != null ? Weight.fromJson(json['weight']) : null;
    height = json['height'] != null ? Height.fromJson(json['height']) : null;
    id = json['id'];
    name = json['name'];
    bredFor = json['bred_for'];
    breedGroup = json['breed_group'];
    lifeSpan = json['life_span'];
    temperament = json['temperament'];
    origin = json['origin'];
    referenceImageId = json['reference_image_id'];
  }
  Weight? weight;
  Height? height;
  int? id;
  String? name;
  String? bredFor;
  String? breedGroup;
  String? lifeSpan;
  String? temperament;
  String? origin;
  String? referenceImageId;
BreedInfo copyWith({  Weight? weight,
  Height? height,
  int? id,
  String? name,
  String? bredFor,
  String? breedGroup,
  String? lifeSpan,
  String? temperament,
  String? origin,
  String? referenceImageId,
}) => BreedInfo(  weight: weight ?? this.weight,
  height: height ?? this.height,
  id: id ?? this.id,
  name: name ?? this.name,
  bredFor: bredFor ?? this.bredFor,
  breedGroup: breedGroup ?? this.breedGroup,
  lifeSpan: lifeSpan ?? this.lifeSpan,
  temperament: temperament ?? this.temperament,
  origin: origin ?? this.origin,
  referenceImageId: referenceImageId ?? this.referenceImageId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (weight != null) {
      map['weight'] = weight?.toJson();
    }
    if (height != null) {
      map['height'] = height?.toJson();
    }
    map['id'] = id;
    map['name'] = name;
    map['bred_for'] = bredFor;
    map['breed_group'] = breedGroup;
    map['life_span'] = lifeSpan;
    map['temperament'] = temperament;
    map['origin'] = origin;
    map['reference_image_id'] = referenceImageId;
    return map;
  }

}

/// imperial : "21 - 23"
/// metric : "53 - 58"

Height heightFromJson(String str) => Height.fromJson(json.decode(str));
String heightToJson(Height data) => json.encode(data.toJson());
class Height {
  Height({
      this.imperial, 
      this.metric,});

  Height.fromJson(dynamic json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }
  String? imperial;
  String? metric;
Height copyWith({  String? imperial,
  String? metric,
}) => Height(  imperial: imperial ?? this.imperial,
  metric: metric ?? this.metric,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['imperial'] = imperial;
    map['metric'] = metric;
    return map;
  }

}

/// imperial : "40 - 65"
/// metric : "18 - 29"

Weight weightFromJson(String str) => Weight.fromJson(json.decode(str));
String weightToJson(Weight data) => json.encode(data.toJson());
class Weight {
  Weight({
      this.imperial, 
      this.metric,});

  Weight.fromJson(dynamic json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }
  String? imperial;
  String? metric;
Weight copyWith({  String? imperial,
  String? metric,
}) => Weight(  imperial: imperial ?? this.imperial,
  metric: metric ?? this.metric,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['imperial'] = imperial;
    map['metric'] = metric;
    return map;
  }

}