import 'package:hive/hive.dart';

class LanguageApplicant extends HiveObject{
  final String name;
  final String phone;
  final String email;
  final String location;
  final String qualification;
  final String course;
  final String duration;

  LanguageApplicant({
    required this.name,
    required this.phone,
    required this.email,
    required this.location,
    required this.qualification,
    required this.course,
    required this.duration

  }
  );
}