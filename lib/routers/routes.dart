import 'package:auto_route/auto_route.dart';
import 'package:isp_wallet/screens/auth/auth_page/page.dart';
import 'package:isp_wallet/screens/auth/login_page/page.dart';
import 'package:isp_wallet/screens/auth/mnemonic_page/page.dart';
import 'package:isp_wallet/screens/auth/pincode_page/page.dart';
import 'package:isp_wallet/screens/info_page/page.dart';
import 'package:isp_wallet/screens/main_page/page.dart';
import 'package:isp_wallet/screens/receive_page/page.dart';
import 'package:isp_wallet/screens/send_page/page.dart';
import 'package:isp_wallet/screens/splash_page/page.dart';
import 'package:isp_wallet/screens/start_info_page/page.dart';





part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: SplashRoute.page),
    AutoRoute(path: '/auth', page: AuthRoute.page),
    AutoRoute(path: '/info', page: InfoRoute.page),
    AutoRoute(path: '/login', page: LoginRoute.page),
    AutoRoute(path: '/main', page: MainRoute.page),
    AutoRoute(path: '/mnemonic', page: MnemonicRoute.page),
    AutoRoute(path: '/pincode', page: PincodeRoute.page),
    AutoRoute(path: '/start_info', page: StartInfoRoute.page),
    AutoRoute(path: '/receive', page: ReceiveRoute.page),
    AutoRoute(path: '/send', page: SendRoute.page),
  ];
}

// dart run build_runner watch
// dart run build_runner build
