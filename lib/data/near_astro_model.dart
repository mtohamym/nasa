class NearestModel {
  String id = "";
  String date = " ";
  double absolute_magnitude = 0.0;
  double estimated_diameter_max = 0.0;
  bool is_potentially_hazardous_asteroid = false;
  double close_approach_data_kilometers_per_second = 0.0;
  double close_approach_data_astronomical = 0.0;

  NearestModel(
      this.id,
      this.date,
      this.absolute_magnitude,
      this.estimated_diameter_max,
      this.is_potentially_hazardous_asteroid,
      this.close_approach_data_kilometers_per_second,
      this.close_approach_data_astronomical);

}
