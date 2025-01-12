class ServiceCardModel {
  final String title;
  final String place;
  final String imagePath;
  final double price;
  final double? rating;
  final bool isSaved;

  const ServiceCardModel({
    required this.title,
    required this.place,
    required this.imagePath,
    required this.price,
    required this.rating,
    required this.isSaved,
  });

}
