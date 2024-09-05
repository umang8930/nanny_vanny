import 'package:nanny_vanny/app/data/model/dto/response.dart';
import 'package:nanny_vanny/app/data/model/response/genric_response.dart';
import 'package:nanny_vanny/app/data/value/urls.dart';
import 'package:nanny_vanny/base/base_repository.dart';
import 'package:nanny_vanny/utils/helper/exception_handler.dart';

class HomeRepository extends BaseRepository {
  Future<RepoResponse<GenricResponse>> currentBookingList() async {
    final response = await controller.get(
      path: URLs.currentBookingList,
    );

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenricResponse.fromJson(response));
  }

  Future<RepoResponse<GenricResponse>> packagesList() async {
    final response = await controller.get(
      path: URLs.packagesList,
    );

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenricResponse.fromJson(response));
  }
}
