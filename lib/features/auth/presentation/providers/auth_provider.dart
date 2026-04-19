import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user_entity.dart';

final authStateProvider = StreamProvider<UserEntity?>((ref) {
  // TODO: authRepository 연결
  return const Stream.empty();
});
