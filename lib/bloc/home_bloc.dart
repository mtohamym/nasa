import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../network/dio_helper.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  static HomeBloc get(context) => BlocProvider.of(context);

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
          print(value.data['near_earth_objects']['2022-08-09'][0]['id']);
      } else {
        print("RequestCategoryFailed");
      }
    });
  }
}
