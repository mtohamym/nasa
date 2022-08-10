import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nasa/data/near_astro_model.dart';

import '../network/dio_helper.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  static HomeBloc get(context) => BlocProvider.of(context);

  List<NearestModel> nearestModel = [];

  Future<dynamic> getHomeData() async {
    DioHelper.dio
        .get(
      "/feed?start_date=2022-08-02&end_date=2022-08-09&api_key=db2HPTzvV4u9BVT9rhKibJ086B4d3e7J1RosjyXD",
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
    )
        .then((value) {
      if (value.statusCode == 200) {
        for (int i = 0; i < value.data['near_earth_objects'].length; i++) {
          String date = value.data['near_earth_objects'].keys.elementAt(i);
          for (int j = 0;
              j < value.data['near_earth_objects'][date].length;
              j++) {
                dynamic astroid = value.data['near_earth_objects'][date][j];
            nearestModel.add(NearestModel(
                id: astroid['id'],
                date: date,
                absolute_magnitude: astroid
                    ['absolute_magnitude_h'],
                estimated_diameter_max: astroid['estimated_diameter']['kilometers']['estimated_diameter_max'],
                is_potentially_hazardous_asteroid:
                    astroid['is_potentially_hazardous_asteroid'],
                close_approach_data_kilometers_per_second:
                    astroid['close_approach_data'][0]['relative_velocity']
                    ['kilometers_per_second'],
                close_approach_data_astronomical:
                    astroid['close_approach_data'][0]['miss_distance']
                    ['astronomical'],));
          }
        }
        emit(DataLoaded());
      } else {
        print("RequestCategoryFailed");
      }
    });
  }
}
