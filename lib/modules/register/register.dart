import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration/modules/payment/cubit/payment_cubit.dart';
import 'package:payment_integration/shared/components/components.dart';
import 'package:payment_integration/shared/components/snack_bar.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  FocusNode firstNameNode = FocusNode();
  FocusNode secondNameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  FocusNode priceNode = FocusNode();

  final registerFormKey = GlobalKey<FormState>();

  void pay({required BuildContext context}) {
    if (registerFormKey.currentState!.validate()) {
    } else {
      showSnackBar(
        context: context,
        text: 'Missing Required Data',
        clr: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Payment GateWay',
                style: TextStyle(color: Colors.blue),
              ),
              backgroundColor: Colors.white60,
              elevation: 0.0,
            ),
            body: Form(
              key: registerFormKey,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      defaultTextFormField(
                        validator: (String? string) {
                          if (string!.isEmpty) {
                            return 'First name is Required';
                          }
                        },
                        textInputType: TextInputType.name,
                        isPassword: false,
                        controller: firstNameController,
                        label: 'first name',
                        arabic: false,
                      ),
                      defaultTextFormField(
                        validator: (String? string) {
                          if (string!.isEmpty) {
                            return 'Last name is Required';
                          }
                        },
                        textInputType: TextInputType.name,
                        isPassword: false,
                        controller: secondNameController,
                        label: 'second name',
                        arabic: false,
                      ),
                      defaultTextFormField(
                        validator: (String? string) {
                          if (string!.isEmpty) {
                            return 'Email is Required';
                          }
                        },
                        textInputType: TextInputType.emailAddress,
                        isPassword: false,
                        controller: emailController,
                        label: 'email',
                        arabic: false,
                      ),
                      defaultTextFormField(
                        validator: (String? string) {
                          if (string!.isEmpty) {
                            return 'Phone is Required';
                          }
                        },
                        textInputType: TextInputType.phone,
                        isPassword: false,
                        controller: phoneController,
                        label: 'phone',
                        arabic: false,
                      ),
                      defaultTextFormField(
                        validator: (String? string) {
                          if (string!.isEmpty) {
                            return 'Price is Required';
                          }
                        },
                        textInputType: TextInputType.number,
                        isPassword: false,
                        controller: priceController,
                        label: 'price',
                        arabic: false,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      defaultButton(
                        text: 'Pay',
                        color: Colors.blue,
                        function: () {
                          PaymentCubit.get(context).getFirstToken(
                            context: context,
                            price: priceController.text.trim(),
                            email: emailController.text.trim(),
                            firstName: firstNameController.text.trim(),
                            lastName: secondNameController.text.trim(),
                            phone: phoneController.text.trim(),
                          );
                        },
                        context: context,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
