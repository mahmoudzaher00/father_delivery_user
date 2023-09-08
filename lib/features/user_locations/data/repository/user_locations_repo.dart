import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/search_data_model.dart';

abstract class UserLocationRepo{
  Future<Either<Failure, SearchDataModel>> fetchSearchData(String? value,);
}