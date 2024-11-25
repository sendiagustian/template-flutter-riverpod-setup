import 'package:dio/dio.dart';
import '../../core/core.dart';
import '../constants/url_const.dart';

abstract class IpDeviceSource {
  Future<String> getIpDevice();
}

class IpDeviceSourceImpl implements IpDeviceSource {
  final Dio _dio = DioClientConfig.instance.dio;

  @override
  Future<String> getIpDevice() async {
    final response = await _dio.get(UrlConst.ipify);

    if (response.statusCode == 200) {
      return response.data['ip'];
    } else {
      throw Exception('Failed to load IP address');
    }
  }
}
