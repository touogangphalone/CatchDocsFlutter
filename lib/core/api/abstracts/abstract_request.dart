import 'abstract_api_response.dart';

abstract class AbstractRequest {
  String getName() {
    return this.runtimeType.toString();
  }

  Map<String, String> getParams() {
    return null;
  }

  Map<String, dynamic> getBody() {
    return {};
  }

  Map<String, String> getAdditionnalHeaders() {
    return {};
  }

  dynamic parseResult(AbstractApiResponse response);
}
