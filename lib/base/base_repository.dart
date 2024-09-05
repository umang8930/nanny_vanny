import 'package:get/get.dart';
import 'package:nanny_vanny/app/data/network/network_request.dart';

class BaseRepository {
  NetworkRequester get controller => GetInstance().find<NetworkRequester>();
}
