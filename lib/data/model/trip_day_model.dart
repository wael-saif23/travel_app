import 'package:travel_app/data/model/place_model.dart';

class TripDay {
  final int dayId;
  final String day;
  final List<Place>? places;

  TripDay({required this.dayId ,required this.day, this.places});
}
