import 'package:dio/dio.dart';
import 'package:fluttertest/data/data_source/home_provider.dart';
import 'package:fluttertest/data/data_source/login_datasource.dart';
import 'package:fluttertest/data/data_source/product_datasource.dart';
import 'package:fluttertest/data/data_source/user_datasource.dart';
import 'package:fluttertest/domain/repositories/login_repository.dart';
import 'package:fluttertest/domain/repositories/product_repository.dart';
import 'package:fluttertest/domain/repositories/user_repository.dart';
import 'package:fluttertest/domain/use_case/login_usecase.dart';
import 'package:fluttertest/domain/use_case/product_usecase.dart';
import 'package:fluttertest/domain/use_case/user_usecase.dart';
import 'package:fluttertest/presentation/providers/login_provider.dart';
import 'package:fluttertest/presentation/providers/product_provider.dart';
import 'package:fluttertest/presentation/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> get providers => [
    Provider<Dio>(create: (_) => Dio()),

    Provider<ProductDataSource>(
      create: (context) => ProductDataSource(context.read<Dio>()),
    ),
    Provider<ProductRepository>(
      create:
          (context) => ProductRepositoryImpl(context.read<ProductDataSource>()),
    ),
    Provider<ProductUseCase>(
      create: (context) => ProductUseCase(context.read<ProductRepository>()),
    ),
    ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(context.read<ProductUseCase>()),
    ),

    Provider<UserDataSource>(
      create: (context) => UserDataSource(context.read<Dio>()),
    ),
    Provider<UserRepository>(
      create: (context) => UserRepositoryImpl(context.read<UserDataSource>()),
    ),
    Provider<UserUseCase>(
      create: (context) => UserUseCase(context.read<UserRepository>()),
    ),
    ChangeNotifierProvider<UserProvider>(
      create: (context) => UserProvider(context.read<UserUseCase>()),
    ),
    Provider<LoginDataSource>(create: (context) => LoginDataSource()),
    Provider<LoginRepository>(
      create: (context) => LoginRepositoryImpl(context.read<LoginDataSource>()),
    ),
    Provider<LoginUseCase>(
      create: (context) => LoginUseCase(context.read<LoginRepository>()),
    ),
    ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(context.read<LoginUseCase>()),
    ),
    ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
  ];
}
