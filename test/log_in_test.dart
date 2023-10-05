import 'package:driver_app/features/authentication/login/login.dart';
import 'package:flutter_test/flutter_test.dart';

void main () {
  late LoginView loginView;
  setUp(() => {
    loginView = LoginView()
  });

  testWidgets(
  "Login is display", (widgetTester) async {
    await widgetTester.pumpWidget(LoginView());
    expect(
     find.text('Login'),
        findsOneWidget
    );
  });
}
