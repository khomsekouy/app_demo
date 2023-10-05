import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../data/model/environment.dart';
import '../../features/environment/cubit/environment_cubit.dart';

class LoaderOverlayWidget extends StatelessWidget {
  const LoaderOverlayWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: LoadingIndicator(
            indicatorType: Indicator.ballSpinFadeLoader,
            colors: [Theme.of(context).primaryColor],
          ),
        ),
      ),
      overlayOpacity: 0.35,
      overlayColor: Colors.black,
      child: BlocSelector<EnvironmentCubit, EnvironmentState, EnvironmentState>(
        selector: (state) {
          return state;
        },
        builder: (context, state) {
          if (state.environment.type == EnvironmentType.production ||
              state.environment.type == EnvironmentType.none) {
            return child;
          }

          final color = state.environment.envColor;
          return Banner(
            message: state.environment.name,
            location: BannerLocation.topEnd,
            color: color,
            child: child,
          );
        },
      ),
    );
  }
}
