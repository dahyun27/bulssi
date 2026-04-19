import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/mission_entity.dart';

final currentMissionProvider = StateProvider<MissionEntity?>((ref) => null);
