part of 'model.dart';

class SpaceModel implements Model {
  @override
  dynamic id;

  String name;
  String city;
  String country;
  int price;
  String imgUrl;
  int rating;
  String address;
  String phone;
  String mapurl;
  List photos;
  int numOfKitchens;
  int numOfBedrooms;
  int numOfCupBoards;

  SpaceModel({
    this.id,
    this.name,
    this.city,
    this.country,
    this.price,
    this.imgUrl,
    this.rating,
    this.address,
    this.phone,
    this.mapurl,
    this.photos,
    this.numOfBedrooms,
    this.numOfCupBoards,
    this.numOfKitchens,
  });

  factory SpaceModel.fromJson(Map<String, dynamic> json) => SpaceModel(
    id: json['id'],
    name: json['name'] as String,
    city: json['city'] as String,
    country: json['country'] as String,
    price: json['price'] as int,
    imgUrl: json['image_url'] as String,
    rating: json['rating'] as int,
    address: json['address'] as String,
    phone: json['phone'] as String,
    mapurl: json['map_url'] as String,
    photos: json['photos'] as List,
    numOfKitchens: json['number_of_kitchens'] as int,
    numOfBedrooms: json['number_of_bedrooms'] as int,
    numOfCupBoards: json['number_of_cupboards'] as int,
  );
}
