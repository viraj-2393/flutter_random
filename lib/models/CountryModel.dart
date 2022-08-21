import 'dart:convert';
/// name : {"common":"India","official":"Republic of India"}
/// tld : [".in"]
/// cca2 : "IN"
/// ccn3 : "356"
/// cca3 : "IND"
/// cioc : "IND"
/// independent : true
/// status : "officially-assigned"
/// unMember : true
/// currencies : {"INR":{"name":"Indian rupee","symbol":"₹"}}
/// idd : {"root":"+9","suffixes":["1"]}
/// capital : ["New Delhi"]
/// region : "Asia"
/// subregion : "Southern Asia"
/// latlng : [20.0,77.0]
/// landlocked : false
/// borders : ["BGD","BTN","MMR","CHN","NPL","PAK"]
/// area : 3287590.0
/// flag : "🇮🇳"
/// maps : {"googleMaps":"https://goo.gl/maps/WSk3fLwG4vtPQetp7","openStreetMaps":"https://www.openstreetmap.org/relation/304716"}
/// population : 1380004385
/// gini : {"2011":35.7}
/// fifa : "IND"
/// car : {"signs":["IND"],"side":"left"}
/// timezones : ["UTC+05:30"]
/// continents : ["Asia"]
/// flags : {"png":"https://flagcdn.com/w320/in.png","svg":"https://flagcdn.com/in.svg"}
/// coatOfArms : {"png":"https://mainfacts.com/media/images/coats_of_arms/in.png","svg":"https://mainfacts.com/media/images/coats_of_arms/in.svg"}
/// startOfWeek : "monday"
/// capitalInfo : {"latlng":[28.6,77.2]}
/// postalCode : {"format":"######","regex":"^(\\d{6})$"}

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));
String countryModelToJson(CountryModel data) => json.encode(data.toJson());
class CountryModel {
  CountryModel({
      this.name, 
      this.tld, 
      this.cca2, 
      this.ccn3, 
      this.cca3, 
      this.cioc, 
      this.independent, 
      this.status, 
      this.unMember, 
      this.currencies, 
      this.idd, 
      this.capital, 
      this.region, 
      this.subregion, 
      this.latlng, 
      this.landlocked, 
      this.borders, 
      this.area, 
      this.flag, 
      this.maps, 
      this.population,
      this.fifa, 
      this.car, 
      this.timezones, 
      this.continents, 
      this.flags, 
      this.coatOfArms, 
      this.startOfWeek, 
      this.capitalInfo, 
      this.postalCode,});

  CountryModel.fromJson(dynamic json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    tld = json['tld'] != null ? json['tld'].cast<String>() : [];
    cca2 = json['cca2'];
    ccn3 = json['ccn3'];
    cca3 = json['cca3'];
    cioc = json['cioc'];
    independent = json['independent'];
    status = json['status'];
    unMember = json['unMember'];
    currencies = json['currencies'] != null ? json['currencies'] : null;
    idd = json['idd'] != null ? Idd.fromJson(json['idd']) : null;
    capital = json['capital'] != null ? json['capital'].cast<String>() : [];
    region = json['region'];
    subregion = json['subregion'];
    latlng = json['latlng'] != null ? json['latlng'].cast<double>() : [];
    landlocked = json['landlocked'];
    borders = json['borders'] != null ? json['borders'].cast<String>() : [];
    area = json['area'];
    flag = json['flag'];
    maps = json['maps'] != null ? Maps.fromJson(json['maps']) : null;
    population = json['population'];
    fifa = json['fifa'];
    car = json['car'] != null ? Car.fromJson(json['car']) : null;
    timezones = json['timezones'] != null ? json['timezones'].cast<String>() : [];
    continents = json['continents'] != null ? json['continents'].cast<String>() : [];
    flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    coatOfArms = json['coatOfArms'] != null ? CoatOfArms.fromJson(json['coatOfArms']) : null;
    startOfWeek = json['startOfWeek'];
    capitalInfo = json['capitalInfo'] != null ? CapitalInfo.fromJson(json['capitalInfo']) : null;
    postalCode = json['postalCode'] != null ? PostalCode.fromJson(json['postalCode']) : null;
  }
  Name? name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;
  bool? independent;
  String? status;
  bool? unMember;
  dynamic? currencies;
  Idd? idd;
  List<String>? capital;
  String? region;
  String? subregion;
  List<double>? latlng;
  bool? landlocked;
  List<String>? borders;
  double? area;
  String? flag;
  Maps? maps;
  int? population;
  String? fifa;
  Car? car;
  List<String>? timezones;
  List<String>? continents;
  Flags? flags;
  CoatOfArms? coatOfArms;
  String? startOfWeek;
  CapitalInfo? capitalInfo;
  PostalCode? postalCode;
CountryModel copyWith({  Name? name,
  List<String>? tld,
  String? cca2,
  String? ccn3,
  String? cca3,
  String? cioc,
  bool? independent,
  String? status,
  bool? unMember,
  dynamic? currencies,
  Idd? idd,
  List<String>? capital,
  String? region,
  String? subregion,
  List<double>? latlng,
  bool? landlocked,
  List<String>? borders,
  double? area,
  String? flag,
  Maps? maps,
  int? population,
  String? fifa,
  Car? car,
  List<String>? timezones,
  List<String>? continents,
  Flags? flags,
  CoatOfArms? coatOfArms,
  String? startOfWeek,
  CapitalInfo? capitalInfo,
  PostalCode? postalCode,
}) => CountryModel(  name: name ?? this.name,
  tld: tld ?? this.tld,
  cca2: cca2 ?? this.cca2,
  ccn3: ccn3 ?? this.ccn3,
  cca3: cca3 ?? this.cca3,
  cioc: cioc ?? this.cioc,
  independent: independent ?? this.independent,
  status: status ?? this.status,
  unMember: unMember ?? this.unMember,
  currencies: currencies ?? this.currencies,
  idd: idd ?? this.idd,
  capital: capital ?? this.capital,
  region: region ?? this.region,
  subregion: subregion ?? this.subregion,
  latlng: latlng ?? this.latlng,
  landlocked: landlocked ?? this.landlocked,
  borders: borders ?? this.borders,
  area: area ?? this.area,
  flag: flag ?? this.flag,
  maps: maps ?? this.maps,
  population: population ?? this.population,
  fifa: fifa ?? this.fifa,
  car: car ?? this.car,
  timezones: timezones ?? this.timezones,
  continents: continents ?? this.continents,
  flags: flags ?? this.flags,
  coatOfArms: coatOfArms ?? this.coatOfArms,
  startOfWeek: startOfWeek ?? this.startOfWeek,
  capitalInfo: capitalInfo ?? this.capitalInfo,
  postalCode: postalCode ?? this.postalCode,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (name != null) {
      map['name'] = name?.toJson();
    }
    map['tld'] = tld;
    map['cca2'] = cca2;
    map['ccn3'] = ccn3;
    map['cca3'] = cca3;
    map['cioc'] = cioc;
    map['independent'] = independent;
    map['status'] = status;
    map['unMember'] = unMember;
    if (currencies != null) {
      map['currencies'] = currencies?.toJson();
    }
    if (idd != null) {
      map['idd'] = idd?.toJson();
    }
    map['capital'] = capital;
    map['region'] = region;
    map['subregion'] = subregion;
    map['latlng'] = latlng;
    map['landlocked'] = landlocked;
    map['borders'] = borders;
    map['area'] = area;
    map['flag'] = flag;
    if (maps != null) {
      map['maps'] = maps?.toJson();
    }
    map['population'] = population;
    map['fifa'] = fifa;
    if (car != null) {
      map['car'] = car?.toJson();
    }
    map['timezones'] = timezones;
    map['continents'] = continents;
    if (flags != null) {
      map['flags'] = flags?.toJson();
    }
    if (coatOfArms != null) {
      map['coatOfArms'] = coatOfArms?.toJson();
    }
    map['startOfWeek'] = startOfWeek;
    if (capitalInfo != null) {
      map['capitalInfo'] = capitalInfo?.toJson();
    }
    if (postalCode != null) {
      map['postalCode'] = postalCode?.toJson();
    }
    return map;
  }

}

/// format : "######"
/// regex : "^(\\d{6})$"

PostalCode postalCodeFromJson(String str) => PostalCode.fromJson(json.decode(str));
String postalCodeToJson(PostalCode data) => json.encode(data.toJson());
class PostalCode {
  PostalCode({
      this.format, 
      this.regex,});

  PostalCode.fromJson(dynamic json) {
    format = json['format'];
    regex = json['regex'];
  }
  String? format;
  String? regex;
PostalCode copyWith({  String? format,
  String? regex,
}) => PostalCode(  format: format ?? this.format,
  regex: regex ?? this.regex,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['format'] = format;
    map['regex'] = regex;
    return map;
  }

}

/// latlng : [28.6,77.2]

CapitalInfo capitalInfoFromJson(String str) => CapitalInfo.fromJson(json.decode(str));
String capitalInfoToJson(CapitalInfo data) => json.encode(data.toJson());
class CapitalInfo {
  CapitalInfo({
      this.latlng,});

  CapitalInfo.fromJson(dynamic json) {
    latlng = json['latlng'] != null ? json['latlng'].cast<double>() : [];
  }
  List<double>? latlng;
CapitalInfo copyWith({  List<double>? latlng,
}) => CapitalInfo(  latlng: latlng ?? this.latlng,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latlng'] = latlng;
    return map;
  }

}

/// png : "https://mainfacts.com/media/images/coats_of_arms/in.png"
/// svg : "https://mainfacts.com/media/images/coats_of_arms/in.svg"

CoatOfArms coatOfArmsFromJson(String str) => CoatOfArms.fromJson(json.decode(str));
String coatOfArmsToJson(CoatOfArms data) => json.encode(data.toJson());
class CoatOfArms {
  CoatOfArms({
      this.png, 
      this.svg,});

  CoatOfArms.fromJson(dynamic json) {
    png = json['png'];
    svg = json['svg'];
  }
  String? png;
  String? svg;
CoatOfArms copyWith({  String? png,
  String? svg,
}) => CoatOfArms(  png: png ?? this.png,
  svg: svg ?? this.svg,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['png'] = png;
    map['svg'] = svg;
    return map;
  }

}

/// png : "https://flagcdn.com/w320/in.png"
/// svg : "https://flagcdn.com/in.svg"

Flags flagsFromJson(String str) => Flags.fromJson(json.decode(str));
String flagsToJson(Flags data) => json.encode(data.toJson());
class Flags {
  Flags({
      this.png, 
      this.svg,});

  Flags.fromJson(dynamic json) {
    png = json['png'];
    svg = json['svg'];
  }
  String? png;
  String? svg;
Flags copyWith({  String? png,
  String? svg,
}) => Flags(  png: png ?? this.png,
  svg: svg ?? this.svg,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['png'] = png;
    map['svg'] = svg;
    return map;
  }

}

/// signs : ["IND"]
/// side : "left"

Car carFromJson(String str) => Car.fromJson(json.decode(str));
String carToJson(Car data) => json.encode(data.toJson());
class Car {
  Car({
      this.signs, 
      this.side,});

  Car.fromJson(dynamic json) {
    signs = json['signs'] != null ? json['signs'].cast<String>() : [];
    side = json['side'];
  }
  List<String>? signs;
  String? side;
Car copyWith({  List<String>? signs,
  String? side,
}) => Car(  signs: signs ?? this.signs,
  side: side ?? this.side,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['signs'] = signs;
    map['side'] = side;
    return map;
  }

}

/// 2011 : 35.7



/// googleMaps : "https://goo.gl/maps/WSk3fLwG4vtPQetp7"
/// openStreetMaps : "https://www.openstreetmap.org/relation/304716"

Maps mapsFromJson(String str) => Maps.fromJson(json.decode(str));
String mapsToJson(Maps data) => json.encode(data.toJson());
class Maps {
  Maps({
      this.googleMaps, 
      this.openStreetMaps,});

  Maps.fromJson(dynamic json) {
    googleMaps = json['googleMaps'];
    openStreetMaps = json['openStreetMaps'];
  }
  String? googleMaps;
  String? openStreetMaps;
Maps copyWith({  String? googleMaps,
  String? openStreetMaps,
}) => Maps(  googleMaps: googleMaps ?? this.googleMaps,
  openStreetMaps: openStreetMaps ?? this.openStreetMaps,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['googleMaps'] = googleMaps;
    map['openStreetMaps'] = openStreetMaps;
    return map;
  }

}

/// root : "+9"
/// suffixes : ["1"]

Idd iddFromJson(String str) => Idd.fromJson(json.decode(str));
String iddToJson(Idd data) => json.encode(data.toJson());
class Idd {
  Idd({
      this.root, 
      this.suffixes,});

  Idd.fromJson(dynamic json) {
    root = json['root'];
    suffixes = json['suffixes'] != null ? json['suffixes'].cast<String>() : [];
  }
  String? root;
  List<String>? suffixes;
Idd copyWith({  String? root,
  List<String>? suffixes,
}) => Idd(  root: root ?? this.root,
  suffixes: suffixes ?? this.suffixes,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['root'] = root;
    map['suffixes'] = suffixes;
    return map;
  }

}

/// INR : {"name":"Indian rupee","symbol":"₹"}

Currencies currenciesFromJson(String str) => Currencies.fromJson(json.decode(str));
String currenciesToJson(Currencies data) => json.encode(data.toJson());
class Currencies {
  Currencies({
      this.inr,});

  Currencies.fromJson(dynamic json) {
    inr = json['INR'] != null ? Inr.fromJson(json['INR']) : null;
  }
  Inr? inr;
Currencies copyWith({  Inr? inr,
}) => Currencies(  inr: inr ?? this.inr,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (inr != null) {
      map['INR'] = inr?.toJson();
    }
    return map;
  }

}

/// name : "Indian rupee"
/// symbol : "₹"

Inr inrFromJson(String str) => Inr.fromJson(json.decode(str));
String inrToJson(Inr data) => json.encode(data.toJson());
class Inr {
  Inr({
      this.name, 
      this.symbol,});

  Inr.fromJson(dynamic json) {
    name = json['name'];
    symbol = json['symbol'];
  }
  String? name;
  String? symbol;
Inr copyWith({  String? name,
  String? symbol,
}) => Inr(  name: name ?? this.name,
  symbol: symbol ?? this.symbol,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['symbol'] = symbol;
    return map;
  }

}

/// common : "India"
/// official : "Republic of India"

Name nameFromJson(String str) => Name.fromJson(json.decode(str));
String nameToJson(Name data) => json.encode(data.toJson());
class Name {
  Name({
      this.common, 
      this.official,});

  Name.fromJson(dynamic json) {
    common = json['common'];
    official = json['official'];
  }
  String? common;
  String? official;
Name copyWith({  String? common,
  String? official,
}) => Name(  common: common ?? this.common,
  official: official ?? this.official,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['common'] = common;
    map['official'] = official;
    return map;
  }

}