import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/profile_entity.dart';

final profileProvider = FutureProvider.family<ProfileEntity, String>((ref, userId) async {
  // TODO: profileRepository 연결
  throw UnimplementedError();
});
