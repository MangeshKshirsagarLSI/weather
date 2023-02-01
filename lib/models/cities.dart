
import 'dart:convert';

List<Cities> citiesFromJson(String str) => List<Cities>.from(json.decode(str).map((x) => Cities.fromJson(x)));

String citiesToJson(List<Cities> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cities {
  Cities({
    required this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.url,
  });

  final int id;
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String url;

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
    id: json["id"],
    name: json["name"],
    region: json["region"],
    country: json["country"],
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "region": region,
    "country": country,
    "lat": lat,
    "lon": lon,
    "url": url,
  };
}
