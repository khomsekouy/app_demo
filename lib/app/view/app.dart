import 'package:driver_app/data/services/get/get_list_conments.dart';
import 'package:driver_app/features/authentication/bloc/validation/validator_form_bloc.dart';
import 'package:driver_app/features/demo_api/bloc/demo_list_comment_cubit.dart';
import 'package:driver_app/l10n/l10n.dart';
import 'package:driver_app/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_client/http_client.dart';
import '../../data/model/environment.dart';
import '../../features/environment/cubit/environment_cubit.dart';
import '../../router/app_router.dart';
import '../../shared/widgets/loader_overlay_widget.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required HttpClient httpClient,
    required EnvironmentType environmentType,
  })  : _httpClient = httpClient,
        _environmentType = environmentType,
        super();

  final HttpClient _httpClient;
  final EnvironmentType _environmentType;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: _environmentType,
          ),
          RepositoryProvider<GetListCommentService>(
            create: (context) => GetListCommentService(_httpClient),
          ),
        ],
        child: RegisterBlocProvider(
          environmentType: _environmentType,
        ));
  }
}

class RegisterBlocProvider extends StatelessWidget {
  const RegisterBlocProvider({super.key, required this.environmentType});
  final EnvironmentType environmentType;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EnvironmentCubit>(
          create: (context) =>
              EnvironmentCubit()..loadEnvironment(environmentType),
        ),
        BlocProvider<ValidatorFormBloc>(
          create: (context) => ValidatorFormBloc(),
        ),
        BlocProvider<DemoListCommentCubit>(
          create: (context) => DemoListCommentCubit(
            RepositoryProvider.of<GetListCommentService>(context),
          ),
        ),

      ],
      child: const AppRoot(),
    );
  }
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.routerConfig,
      builder: (context, child) {
        return LoaderOverlayWidget(child: child ?? Container());
      },
    );
  }
}
