import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration/shared/components/constants.dart';
import 'package:payment_integration/shared/components/snack_bar.dart';
import 'package:payment_integration/shared/network/my_dio.dart';
import 'package:payment_integration/shared/network/url.dart';
import 'package:payment_integration/shared/styles/strings.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  static PaymentCubit get(context) => BlocProvider.of(context);

  // FirstToken? firstToken;

  Future getFirstToken({
    required context,
    required String price,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    await DioHelper.postData(url: Url.firstToken, data: {
      'api_key': Url.myToken,
    }).then((value) {
      // firstToken = FirstToken.fromJson(value.data);
      // paymobToken = firstToken!.token.toString();
      // print(paymobToken);
      // print('*******************');
      // print(firstToken);

      print('get firstToken success');

      print(value.data['token']);
      paymobToken = value.data['token'];
      getOrderID(
        context: context,
        price: price,
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
      );
      emit(PaymentSuccess());
    }).catchError((err) {
      print('get firstToken Error');

      showSnackBar(context: context, text: err.toString(), clr: Colors.red);
      emit(PaymentError());
    });
  }

  Future getOrderID({
    required context,
    required String price,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    await DioHelper.postData(url: Url.orderID, data: {
      'auth_token': paymobToken.toString(),
      'delivery_needed': "false",
      'amount_cents': price,
      'currency': "EGP",
      'items': [],
    }).then((value) {
      // firstToken = FirstToken.fromJson(value.data);
      // paymobToken = firstToken!.token.toString();
      // print(paymobToken);
      // print('*******************');
      // print(firstToken);

      print('get order ID success');

      print(value.data['id'].toString());
      orderId = value.data['id'].toString();

      /// Get Final Token for Visa Card
      // getFinalTokenVisaCard(
      //   context: context,
      //   price: price,
      //   email: email,
      //   firstName: firstName,
      //   lastName: lastName,
      //   phone: phone,
      // );

      /// Get Final Token Via Kiosk
      getFinalTokenViaKiosk(
        context: context,
        price: price,
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
      );

      emit(PaymentOrderIDSuccess());
    }).catchError((err) {
      print('get order ID error');

      showSnackBar(context: context, text: err.toString(), clr: Colors.red);
      emit(PaymentOrderIDError());
    });
  }

  Future getFinalTokenVisaCard({
    required context,
    required String price,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    await DioHelper.postData(url: Url.lastToken, data: {
      'auth_token': paymobToken.toString(),
      'order_id': orderId,
      "amount_cents": price,
      "expiration": 3600,
      "billing_data": {
        "apartment": "803",
        "email": email,
        "floor": "42",
        "first_name": firstName,
        "street": "Ethan Land",
        "building": "8028",
        "phone_number": phone,
        "shipping_method": "PKG",
        "postal_code": "01898",
        "city": "Jaskolskiburgh",
        "country": "CR",
        "last_name": lastName,
        "state": "Utah"
      },
      "currency": "EGP",
      "integration_id": 3736265,
      "lock_order_when_paid": "false"
    }).then((value) {
      print('get final token visa card success');

      print(value.data['token'].toString());
      finalTokenCard = value.data['token'].toString();
      emit(RequestTokenSuccess());
    }).catchError((err) {
      print('get final token visa card error');

      showSnackBar(context: context, text: err.toString(), clr: Colors.red);
      emit(RequestTokenError());
    });
  }

  Future getFinalTokenViaKiosk({
    required context,
    required String price,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    await DioHelper.postData(url: Url.lastToken, data: {
      'auth_token': paymobToken.toString(),
      'order_id': orderId,
      "amount_cents": price,
      "expiration": 3600,
      "billing_data": {
        "apartment": "803",
        "email": email,
        "floor": "42",
        "first_name": firstName,
        "street": "Ethan Land",
        "building": "8028",
        "phone_number": phone,
        "shipping_method": "PKG",
        "postal_code": "01898",
        "city": "Jaskolskiburgh",
        "country": "CR",
        "last_name": lastName,
        "state": "Utah"
      },
      "currency": "EGP",
      "integration_id": 3736282,
      "lock_order_when_paid": "false"
    }).then((value) {
      print('get final token via kiosk success');

      print(value.data['token'].toString());
      finalTokenKiosk = value.data['token'].toString();
      getRefCode(context);
      emit(RequestTokenSuccess());
    }).catchError((err) {
      print('get final token via kiosk error');

      showSnackBar(context: context, text: err.toString(), clr: Colors.red);
      emit(RequestTokenError());
    });
  }

  Future getRefCode(context) async {
    await DioHelper.postData(url: Url.kiosk, data: {
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
      "payment_token": finalTokenKiosk
    }).then((value) {
      print('get refcode success');

      print(value.data['id'].toString());
      refCode = value.data['id'].toString();
      emit(GetRefCodeSuccess());
    }).catchError((err) {
      print('get refcode error');

      showSnackBar(context: context, text: err.toString(), clr: Colors.red);
      emit(GetRefCodeError());
    });
  }
}
