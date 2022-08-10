import 'package:flutter/material.dart';
import 'package:nasa/data/near_astro_model.dart';

class AstroidScreen extends StatelessWidget {
  AstroidScreen({Key? key, required this.nearestModel}) : super(key: key);

  NearestModel nearestModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
                title: Text("Asteroid Radar"),
              ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                "https://api.nasa.gov/assets/img/general/apod.jpg",
                fit: BoxFit.fill,
                width: size.width,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  width: double.infinity,
                  color: Color(0xFF000000),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "${nearestModel.is_potentially_hazardous_asteroid ? "" : "Not "}Potentially Hazardous",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))
            ],
          ),
          ListTile(
            title: Text("Close approach date"),
            subtitle: Text(nearestModel.date),
          ),
          ListTile(
            title: Text("Absolute magnitude"),
            subtitle: Text("${nearestModel.absolute_magnitude} au"),
            trailing: Icon(Icons.help),
          ),
          ListTile(
            title: Text("Estimated diameter"),
            subtitle: Text("${nearestModel.estimated_diameter_max} km"),
          ),
          ListTile(
            title: Text("Relative velocity"),
            subtitle: Text("${nearestModel.close_approach_data_kilometers_per_second} km/s"),
          ),
          ListTile(
            title: Text("Distance from earth"),
            subtitle: Text("${nearestModel.close_approach_data_astronomical} au"),
          ),
        ],
      ),
    );
  }
}
