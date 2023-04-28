part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class ChangePrice extends PaymentState {}

class PaymentLoading extends PaymentState {}
class PaymentSuccess extends PaymentState {}
class PaymentError extends PaymentState {}

class PaymentOrderIDLoading extends PaymentState {}
class PaymentOrderIDSuccess extends PaymentState {}
class PaymentOrderIDError extends PaymentState {}

class RequestTokenLoading extends PaymentState {}
class RequestTokenSuccess extends PaymentState {}
class RequestTokenError extends PaymentState {}

class RequestTokenKioskLoading extends PaymentState {}
class RequestTokenKioskSuccess extends PaymentState {}
class RequestTokenKioskError extends PaymentState {}

class GetRefCodeLoading extends PaymentState {}
class GetRefCodeSuccess extends PaymentState {}
class GetRefCodeError extends PaymentState {}