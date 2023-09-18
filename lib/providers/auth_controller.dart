import 'package:absensitanggamus/entity/auth_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Future<Auth> build() async {
    return Auth.signOut();
  }
}
