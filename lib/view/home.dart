import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa/view/astroid_screen.dart';

import '../bloc/home_bloc.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      lazy: false,
      create: (BuildContext context) => HomeBloc()..getHomeData(),
      child: BlocConsumer<HomeBloc, HomeState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            HomeBloc myCubit = HomeBloc.get(context);

            return Scaffold(
              appBar: AppBar(
                title: Text("Asteroid Radar"),
              ),
              body: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Stack(
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
                      ),
                      Expanded(
                        flex: 5,
                        child: SizedBox(),
                      )
                    ],
                  ),
                  ConditionalBuilder(
                    condition: myCubit.nearestModel.isNotEmpty,
                    builder: (context) {
                      return Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 5,
                            child: ListView.builder(
                              itemCount: myCubit.nearestModel.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AstroidScreen(
                                              nearestModel:
                                                  myCubit.nearestModel[index]),
                                        ));
                                  },
                                  child: ListTile(
                                    title: Text(myCubit.nearestModel[index].id),
                                    subtitle:
                                        Text(myCubit.nearestModel[index].date),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                    fallback: (context) {
                      return Center(child: Text('No Data'));
                    },
                  )
                ],
              ),
            );
          }),
    );
  }
}
