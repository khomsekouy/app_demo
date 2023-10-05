import 'dart:developer';

import 'package:driver_app/app/app.dart';
import 'package:driver_app/main/bootstrap.dart';
import 'package:driver_app/data/storages/storage.dart';
import 'package:driver_app/shared/interceptors/authentication_queued_interceptor.dart';
import 'package:driver_app/shared/storages/token_storage_provider.dart';
import 'package:flutter/material.dart';
import "package:http_client/http_client.dart";
import 'package:dio/dio.dart';
import '../data/model/environment.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap((sharedPreferences) async {
    final tokenStorageProvider = TokenStorageProvider();

    // Storage
    await Storage().initial();

    const environmentType = EnvironmentType.staging;
    final environment = Environment.values[environmentType];
    if (environment != null) {
      log('Environment: ${environment.name}');
      log('BaseUrl: ${environment.baseUrl}');
      log('API version: ${environment.apiVersion}');
    }

    final httpClient = DioHttpClient(
      dio: Dio(),
      baseUrl: '${environment?.baseUrl}/${environment?.apiVersion}',
      interceptors: [
        AuthenticationQueuedInterceptor(
          tokenStorage: tokenStorageProvider,
          baseUrl: '${environment?.baseUrl}/${environment?.apiVersion}',
        ),
      ],
    );

    return App(
      httpClient: httpClient,
      environmentType: environmentType,
    );
  });
}
