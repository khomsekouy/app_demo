import 'package:http_client/http_client.dart';
import '../../model/req_list_commnet_model.dart';

class GetListCommentService {
  GetListCommentService(this._httpClient);

  final HttpClient _httpClient;

  Future<RequestListCommentModel> getListComment() async {
    try{
        final result = await _httpClient.get(
          'https://jsonplaceholder.typicode.com/comments/3',
        );
        print('result1 -----------: $result');
        return RequestListCommentModel.fromJson(result);
    } catch (e) {
      print('result2 -----------: $e');
      throw Exception('result3 -----------: $e');
    }
  }
}

