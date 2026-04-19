import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/mission/presentation/pages/mission_create_page.dart';
import '../../features/mission/presentation/pages/mission_verify_page.dart';
import '../../features/room/presentation/pages/room_list_page.dart';
import '../../features/room/presentation/pages/room_detail_page.dart';
import '../../features/room/presentation/pages/room_create_page.dart';
import '../../features/flame/presentation/pages/flame_received_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import 'app_routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(path: AppRoutes.splash, builder: (_, __) => const SplashPage()),
      GoRoute(path: AppRoutes.login, builder: (_, __) => const LoginPage()),
      GoRoute(path: AppRoutes.signup, builder: (_, __) => const SignupPage()),
      GoRoute(path: AppRoutes.home, builder: (_, __) => const HomePage()),
      GoRoute(path: AppRoutes.missionCreate, builder: (_, __) => const MissionCreatePage()),
      GoRoute(path: AppRoutes.missionVerify, builder: (_, __) => const MissionVerifyPage()),
      GoRoute(path: AppRoutes.roomList, builder: (_, __) => const RoomListPage()),
      GoRoute(
        path: AppRoutes.roomDetail,
        builder: (_, state) => RoomDetailPage(roomId: state.pathParameters['id']!),
      ),
      GoRoute(path: AppRoutes.roomCreate, builder: (_, __) => const RoomCreatePage()),
      GoRoute(path: AppRoutes.flameReceived, builder: (_, __) => const FlameReceivedPage()),
      GoRoute(path: AppRoutes.profile, builder: (_, __) => const ProfilePage()),
    ],
  );
});
