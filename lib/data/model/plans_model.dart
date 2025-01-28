import 'package:travel_app/data/model/trip_day_model.dart';

class PlansModel {
  final int tripId;
  final String tripName;
  final String? profileImage;
  final String startingDate;
  final String endingDate;
  final List<TripDay>? tripDays;

  const PlansModel( {
    required this.tripId,
    required this.tripName,
    this.profileImage,
    this.tripDays,
    required this.startingDate,
    required this.endingDate,
  });
}

