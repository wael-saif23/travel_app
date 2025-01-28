import 'package:flutter/material.dart';

class Place {
  final int placeId;
  final String name;
  final String? location;
  final String time;
  final String price;
  final String date;
  final IconData? icon;
  final String placetype;
  final String? description;

  Place(
      {required this.placeId,
      required this.name,
      required this.location,
      required this.time,
      required this.price,
      required this.date,
      required this.placetype,
      this.icon,
      this.description
      });
}
