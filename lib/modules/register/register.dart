import 'package:flutter/material.dart';
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
    String fName = firstNameController.text.trim();
    String sName = secondNameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String price = priceController.text.trim();

    if (registerFormKey.currentState!.validate())
    {

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
                    if(string!.isEmpty){
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
                    if(string!.isEmpty){
                      return 'Last name is Required';
                    }
                  },                  textInputType: TextInputType.name,
                  isPassword: false,
                  controller: secondNameController,
                  label: 'second name',
                  arabic: false,
                ),
                defaultTextFormField(
                  validator: (String? string) {
                    if(string!.isEmpty){
                      return 'Email is Required';
                    }
                  },                  textInputType: TextInputType.emailAddress,
                  isPassword: false,
                  controller: emailController,
                  label: 'email',
                  arabic: false,
                ),
                defaultTextFormField(
                  validator: (String? string) {
                    if(string!.isEmpty){
                      return 'Phone is Required';
                    }
                  },                  textInputType: TextInputType.phone,
                  isPassword: false,
                  controller: phoneController,
                  label: 'phone',
                  arabic: false,
                ),
                defaultTextFormField(
                  validator: (String? string) {
                    if(string!.isEmpty){
                      return 'Price is Required';
                    }
                  },                  textInputType: TextInputType.number,
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
                    pay(context: context);
                  },
                  context: context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
