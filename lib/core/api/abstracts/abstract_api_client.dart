import 'abstract_api_response.dart';
import 'abstract_request.dart';

abstract class AbstractApiClient{
  Future<AbstractApiResponse>process(AbstractRequest request);
}