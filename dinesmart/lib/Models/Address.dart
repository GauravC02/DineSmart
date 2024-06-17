class Address {
  String province;
  String district;
  String city;
  String detailedPlace;

  Address({
    String? province,
    String? district,
    String? city,
    String? detailedPlace,
  })  : detailedPlace = detailedPlace ?? "No description of place",
        city = city ?? "NO city specified",
        district = district ?? "NO district specified",
        province = province ?? "NO province specified";

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      province: json['province'] as String? ??
          "", // Default value or handle differently
      district: json['district'] as String? ?? "",
      city: json['city'] as String? ?? "",
      detailedPlace:
          json['detailedPlace'] as String? ?? "No description of place",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'province': province,
      'district': district,
      'city': city,
      'detailedPlace': detailedPlace,
    };
  }
}
