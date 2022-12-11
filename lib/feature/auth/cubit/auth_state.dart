part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}
class LoginInit extends AuthInitial {}

class LoginLoading extends AuthInitial {}