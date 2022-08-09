import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Asteroid Radar"),
        ),
        body: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                    "https://api.nasa.gov/assets/img/general/apod.jpg"),
                Container(
                    alignment: Alignment.centerLeft,
                    height: 70,
                    width: double.infinity,
                    color: Color(0xFF000000).withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Image of the day",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ))
              ],
            ),
            ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("name"),
                  subtitle: Text("Subtitle"),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
