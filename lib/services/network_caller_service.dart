import 'dart:convert';
import '../model/response_data.dart';
import 'package:http/http.dart' as http;

class NetworkCallerService {
  Future<ResponseData> getRequest(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);

      return ResponseData(
        isSuccess: true,
        statusCode: response.statusCode,
        responseData: decodeResponse,
      );
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: '',
      );
    }
  }
}
