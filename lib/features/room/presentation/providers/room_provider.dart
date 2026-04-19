import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/room_entity.dart';

final openRoomsProvider = StreamProvider<List<RoomEntity>>((ref) {
  // TODO: roomRepository 연결
  return const Stream.empty();
});
