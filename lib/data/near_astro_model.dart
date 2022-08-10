class NearestModel {
  String id = "";
  String date = "";
  double absolute_magnitude = 0.0;
  double estimated_diameter_max = 0.0;
  bool is_potentially_hazardous_asteroid = false;
  String close_approach_data_kilometers_per_second = "";
  String close_approach_data_astronomical = "";

  NearestModel({
      required this.id,
      required this.date,
      required this.absolute_magnitude,
      required this.estimated_diameter_max,
      required this.is_potentially_hazardous_asteroid,
      required this.close_approach_data_kilometers_per_second,
      required this.close_approach_data_astronomical});

}
