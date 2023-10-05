
import 'package:driver_app/features/authentication/login/login.dart';
import 'package:driver_app/features/authentication/status_view.dart';
import 'package:driver_app/features/history/views/history_detail_view.dart';
import 'package:driver_app/features/home/home.dart';
import 'package:driver_app/features/payment/view/confirm_payment_view.dart';
import 'package:driver_app/features/drop_off/view/drop_off_detail_view.dart';
import 'package:driver_app/features/drop_off/view/drop_off_view.dart';
import 'package:driver_app/features/pick_up/view/pick_up_view.dart';
import 'package:driver_app/features/main/main.dart';
import 'package:driver_app/features/maps/views/map_view.dart';
import 'package:driver_app/features/notifications/views/notification_view.dart';
import 'package:driver_app/features/profile/views/change_language.dart';
import 'package:driver_app/features/profile/views/change_password_view.dart';
import 'package:driver_app/features/profile/views/edit_profile_view.dart';
import 'package:driver_app/features/profile/views/help_and_support_view.dart';
import 'package:driver_app/features/profile/views/setting_view.dart';
import 'package:driver_app/features/splash/splash.dart';
import 'package:go_router/go_router.dart';
import '../features/profile/views/profile_view.dart';


class AppRouter {
  AppRouter._();

  static final routerConfig = GoRouter(
    routes: [
      GoRoute(
        path: SplashView.routePath,
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: HomeView.routePath,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: LoginView.routePath,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
          path: MainView.routePath,
          builder: (context, state) => MainView()
      ),
      GoRoute(
          path: StatusView.routePath,
          builder: (context, state) => StatusView()
      ),
      GoRoute(
          path: PickupView.routePath,
          builder: (context, state) => PickupView()
      ),
      GoRoute(
          path: DropOffView.routePath,
          builder: (context, state) => DropOffView()
      ),
      GoRoute(
          path: HistoryDetailView.routePath,
          builder: (context, state) {

            final id = state.extra;
            return HistoryDetailView(status: id! as String);
          }
      ),
      GoRoute(
          path: DropOffDetailView.routePath,
          builder: (context, state) => DropOffDetailView()
      ),
      GoRoute(
          path: ConfirmPaymentView.routePath,
          builder: (context, state) => ConfirmPaymentView()
      ),
      GoRoute(
          path: ProfileView.routePath,
          builder: (context, state) {
            return ProfileView();
          }
      ),
      GoRoute(
          path: EditProfileView.routePath,
          builder: (context, state) => EditProfileView()
      ),
      GoRoute(
          path: ChangePassword.routePath,
          builder: (context, state) => ChangePassword()
      ),
      GoRoute(
          path: MapView.routePath,
          builder: (context, state) => MapView()
      ),
      GoRoute(
          path: NotificationView.routePath,
          builder: (context, state) => NotificationView()
      ),
      GoRoute(
          path: HelpAndSupportView.routePath,
          builder: (context, state) => HelpAndSupportView()
      ),
      GoRoute(
          path:SettingView.routePath,
          builder: (context, state) => SettingView()
      ),
      GoRoute(
          path:ChangeLanguageView.routePath,
          builder: (context, state) => ChangeLanguageView()
      ),
    ],
  );
}
