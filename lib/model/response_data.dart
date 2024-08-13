class ResponseData {
  final bool isSuccess;
  final int? statusCode;
  final String errorMessage;
  final dynamic responseData;

  ResponseData({
    required this.isSuccess,
    required this.statusCode,
    this.errorMessage = 'Something went wrong',
    required this.responseData,
  });
}
