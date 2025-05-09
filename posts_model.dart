import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  List<Record> records;

  PostModel({
    required this.records,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "records": List<dynamic>.from(records.map((x) => x.toJson())),
  };
}

class Record {
  String state;
  String district;
  String market;
  String commodity;
  String variety;
  String arrivalDate;
  String minPrice;
  String maxPrice;
  String modalPrice;

  Record({
    required this.state,
    required this.district,
    required this.market,
    required this.commodity,
    required this.variety,
    required this.arrivalDate,
    required this.minPrice,
    required this.maxPrice,
    required this.modalPrice,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    state: json["State"],
    district: json["District"],
    market: json["Market"],
    commodity: json["Commodity"],
    variety: json["Variety"],
    arrivalDate: json["Arrival_Date"],
    minPrice: json["Min_Price"],
    maxPrice: json["Max_Price"],
    modalPrice: json["Modal_Price"],
  );

  Map<String, dynamic> toJson() => {
    "State": state,
    "District": district,
    "Market": market,
    "Commodity": commodity,
    "Variety": variety,
    "Arrival_Date": arrivalDate,
    "Min_Price": minPrice,
    "Max_Price": maxPrice,
    "Modal_Price": modalPrice,
  };
}
