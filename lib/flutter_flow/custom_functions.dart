import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<RestaurantsRecord> getRestaurantList(
  List<RestaurantsRecord> list,
  List<RestaurantsRecord> searchResults,
) {
  return searchResults.length > 0 ? searchResults : list;
}

List<String> getUniqueCategories(List<String> categories) {
  return categories.toSet().toList();
}

double getAverageRating(List<int> ratings) {
  if (ratings.isEmpty) {
    return 0.0; // Return 0.0 as the default average when the list is empty
  }

  int sum = ratings.reduce((int value, int element) => value + element);
  return sum / ratings.length;
}
