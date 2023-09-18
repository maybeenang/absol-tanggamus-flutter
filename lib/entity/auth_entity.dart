import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_entity.freezed.dart';

@freezed
class Auth with _$Auth {
  const factory Auth.signIn({
    required String token,
  }) = AuthSignIn;

  const factory Auth.signOut() = AuthSignOut;

  const factory Auth.error(String maessage) = AuthError;
}
