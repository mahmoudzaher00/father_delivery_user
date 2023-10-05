import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:father_delivery_user/core/errors/failures.dart';

import 'package:father_delivery_user/features/user_locations/data/models/search_data_model.dart';


import '../../../../core/app/constants.dart';
import '../../../../core/utils/api_service_1.dart';
import 'user_locations_repo.dart';

class UserLocationsRepoImpl implements UserLocationRepo {
  final ApiService1 apiService1;

  UserLocationsRepoImpl(this.apiService1);

  @override
  Future<Either<Failure, SearchDataModel>> fetchSearchData(String? value,) async {
    try {
      var resp = await apiService1.getMapSearchData(endPoint: Constants.mapSearchUrl, parameters: {
        "api_key": "5b3ce3597851110001cf6248ba446ffbbaf74d328bd2e5899a08358e",
        "text": value,
        "size": "50",
        "boundary.country": "eg"
      });
      SearchDataModel searchData = SearchDataModel.fromJson(resp);
      print(resp);
      return right(searchData);
    } on Exception catch (e) {
      print('<<<<<<$e>>>>>>>>>');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
