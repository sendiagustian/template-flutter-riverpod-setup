import 'package:dart_ipify/dart_ipify.dart';

abstract class IpDeviceSource {
  Future<String> getIpDevice();
}

class IpDeviceSourceImpl implements IpDeviceSource {
  @override
  Future<String> getIpDevice() async {
    final response = await Ipify.ipv4();
    return response;
  }
}
