import 'package:flutter/cupertino.dart';

@immutable
sealed class OtpState {}


class OTPInitial extends OtpState {}

class OTPLoading extends OtpState {}

class OTPVerified extends OtpState {}

class OTPResent extends OtpState {}

class OTPError extends OtpState {
  late final String message;

  List<Object> get props => [message];
}