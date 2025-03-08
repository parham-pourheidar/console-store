import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:console_store/features/authentication/data/data_sources/remote/google_auth_data_source.dart';
import 'package:console_store/features/authentication/data/repositories/google_auth_repository_impl.dart';
import 'package:console_store/features/authentication/domain/use_cases/google_auth_request.dart';

import '../features/authentication/data/data_sources/remote/get_email_data_source.dart';
import '../features/authentication/data/data_sources/remote/verify_email_data_source.dart';
import '../features/authentication/data/repositories/get_email_repository_impl.dart';
import '../features/authentication/data/repositories/verify_email_repository_impl.dart';
import '../features/authentication/domain/use_cases/send_email.dart';
import '../features/authentication/domain/use_cases/verify_email_request.dart';

import '../features/cart/data/data_sources/remote/add_to_cart_data_source.dart';
import '../features/cart/data/data_sources/remote/get_cart_data_source.dart';
import '../features/cart/data/data_sources/remote/remove_from_cart_data_source.dart';
import '../features/cart/data/repositories/add_to_cart_repository_impl.dart';
import '../features/cart/data/repositories/get_cart_repository_impl.dart';
import '../features/cart/data/repositories/remove_from_cart_repository_impl.dart';
import '../features/cart/domain/use_cases/add_to_cart_use_case.dart';
import '../features/cart/domain/use_cases/get_cart_use_case.dart';
import '../features/cart/domain/use_cases/remove_from_cart_use_case.dart';
import '../features/home/data/data_sources/remote/logout_data_source.dart';
import '../features/home/data/repositories/logout_repository_impl.dart';
import '../features/home/domain/use_cases/logout_use_case.dart';
import '../features/products/data/data_sources/remote/fetch_by_category_data_source.dart';
import '../features/products/data/data_sources/remote/home_products_data_source.dart';
import '../features/products/data/repositories/fetch_by_category_repository_impl.dart';
import '../features/products/data/repositories/home_products_repository_impl.dart';
import '../features/products/domain/use_cases/fetch_by_category_use_case.dart';
import '../features/products/domain/use_cases/home_products_use_case.dart';
import 'constants.dart';

class DependencyInjection {
  static void setupLocator() {
    final GetIt getIt = GetIt.instance;
    getIt.registerLazySingleton(() => Supabase.instance.client);
    getIt.registerLazySingleton(() => GoogleSignIn(
        serverClientId: Constants.googleClientId,
        scopes: ['openid', 'profile', 'email']));

    void googleAuth() {
      getIt.registerLazySingleton<GoogleAuthDataSource>(() =>
          GoogleAuthDataSource(getIt<SupabaseClient>(), getIt<GoogleSignIn>()));
      getIt.registerLazySingleton<GoogleAuthRepositoryImpl>(
          () => GoogleAuthRepositoryImpl(getIt<GoogleAuthDataSource>()));
      getIt.registerLazySingleton<GoogleAuthRequest>(
          () => GoogleAuthRequest(getIt<GoogleAuthRepositoryImpl>()));
    }

    void getEmail() {
      getIt.registerLazySingleton<GetEmailDataSource>(
          () => GetEmailDataSource(getIt<SupabaseClient>()));
      getIt.registerLazySingleton<GetEmailRepositoryImpl>(
          () => GetEmailRepositoryImpl(getIt<GetEmailDataSource>()));
      getIt.registerLazySingleton<SendEmail>(
          () => SendEmail(getIt<GetEmailRepositoryImpl>()));
    }

    void verifyEmail() {
      getIt.registerLazySingleton<VerifyEmailDataSource>(
          () => VerifyEmailDataSource(getIt<SupabaseClient>()));
      getIt.registerLazySingleton<VerifyEmailRepositoryImpl>(
          () => VerifyEmailRepositoryImpl(getIt<VerifyEmailDataSource>()));
      getIt.registerLazySingleton<VerifyEmailRequest>(
          () => VerifyEmailRequest(getIt<VerifyEmailRepositoryImpl>()));
    }

    void fetchByCategory() {
      getIt.registerLazySingleton<FetchByCategoryDataSource>(
          () => FetchByCategoryDataSource(getIt<SupabaseClient>()));
      getIt.registerLazySingleton<FetchByCategoryRepositoryImpl>(() =>
          FetchByCategoryRepositoryImpl(getIt<FetchByCategoryDataSource>()));
      getIt.registerLazySingleton<FetchByCategoryUseCase>(
          () => FetchByCategoryUseCase(getIt<FetchByCategoryRepositoryImpl>()));
    }

    void homeProducts() {
      getIt.registerLazySingleton<HomeProductsDataSource>(
          () => HomeProductsDataSource(getIt<SupabaseClient>()));
      getIt.registerLazySingleton<HomeProductsRepositoryImpl>(
          () => HomeProductsRepositoryImpl(getIt<HomeProductsDataSource>()));
      getIt.registerLazySingleton<HomeProductsUseCase>(
          () => HomeProductsUseCase(getIt<HomeProductsRepositoryImpl>()));
    }

    void getCart() {
      getIt.registerLazySingleton<GetCartDataSource>(
          () => GetCartDataSource(getIt<SupabaseClient>()));
      getIt.registerLazySingleton<GetCartRepositoryImpl>(
          () => GetCartRepositoryImpl(getIt<GetCartDataSource>()));
      getIt.registerLazySingleton<GetCartUseCase>(
          () => GetCartUseCase(getIt<GetCartRepositoryImpl>()));
    }

    void addToCart() {
      getIt.registerLazySingleton<AddToCartDataSource>(
          () => AddToCartDataSource(getIt<SupabaseClient>()));
      getIt.registerLazySingleton<AddToCartRepositoryImpl>(
          () => AddToCartRepositoryImpl(getIt<AddToCartDataSource>()));
      getIt.registerLazySingleton<AddToCartUseCase>(
          () => AddToCartUseCase(getIt<AddToCartRepositoryImpl>()));
    }

    void removeFromCart() {
      getIt.registerLazySingleton<RemoveFromCartDataSource>(
          () => RemoveFromCartDataSource(getIt<SupabaseClient>()));
      getIt.registerLazySingleton<RemoveFromCartRepositoryImpl>(() =>
          RemoveFromCartRepositoryImpl(getIt<RemoveFromCartDataSource>()));
      getIt.registerLazySingleton<RemoveFromCartUseCase>(
          () => RemoveFromCartUseCase(getIt<RemoveFromCartRepositoryImpl>()));
    }

    void logout() {
      getIt.registerLazySingleton<LogoutDataSource>(() =>
          LogoutDataSource(getIt<SupabaseClient>(), getIt<GoogleSignIn>()));
      getIt.registerLazySingleton<LogoutRepositoryImpl>(
          () => LogoutRepositoryImpl(getIt<LogoutDataSource>()));
      getIt.registerLazySingleton<LogoutUseCase>(
          () => LogoutUseCase(getIt<LogoutRepositoryImpl>()));
    }

    googleAuth();
    getEmail();
    verifyEmail();
    fetchByCategory();
    homeProducts();
    getCart();
    addToCart();
    removeFromCart();
    logout();
  }
}
