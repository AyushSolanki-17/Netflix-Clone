class Movie{
  String? name;
  double? ratings;
  String? thumbnailLink;
  String? videoLink;

  Movie(this.name,this.ratings,this.thumbnailLink,this.videoLink);

  Movie.fromJson(Map<String,dynamic> json)
  {
    name = json['name'];
    ratings = double.parse(json['rating'].toString());
    thumbnailLink = json['thumbnail'];
    videoLink = json['video'];
  }
}