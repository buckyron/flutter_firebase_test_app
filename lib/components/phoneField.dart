import 'package:international_phone_input/international_phone_input.dart';
import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {

  String phoneNumber,phoneIsoCode;
  Function onPhoneNumberChange;

  PhoneField({this.onPhoneNumberChange,@required this.phoneIsoCode,this.phoneNumber});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: InternationalPhoneInput(
          onPhoneNumberChange: onPhoneNumberChange,
          initialPhoneNumber: phoneNumber,
          initialSelection: phoneIsoCode,
          enabledCountries: ['+233', '+1', '91']
      ),
    ),
  );
}
