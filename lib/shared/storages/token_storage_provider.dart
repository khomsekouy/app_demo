import 'package:driver_app/data/storages/storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenStorageProvider {
  Future<void> writeToken({required String accessToken}) async {
    await Storage().set(Storage.accessToken, accessToken);
  }

  Future<List<String>> readToken() async {
    final accessToken = Storage().getString(Storage.accessToken);
    return [accessToken ?? ''];
  }

  Future<void> deleteToken() async {
    await Storage().remove(Storage.accessToken);
  }

  Future<Duration> getAccessTokenDuration() async {
    // decode token and get exp
    final token = await readToken();
    if (token[0] == '') {
      return Duration(seconds: 0);
    }
    final decodedToken = JwtDecoder.decode(token[0]);
    final exp = decodedToken['exp'] as int;
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return Duration(seconds: exp - now);
  }
}
