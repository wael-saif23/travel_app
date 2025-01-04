class PlansModel {
  final String tripName;
  final String? profileImage;
  final String startingDate;
  final String endingDate;

   const PlansModel({
    required this.tripName,
     this.profileImage,
    required this.startingDate,
    required this.endingDate,
  });
}