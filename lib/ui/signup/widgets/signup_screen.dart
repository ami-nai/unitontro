import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:unitontro/ui/home_page/widgets/home_page.dart';
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController= TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Sign Up'),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor: Colors.black,
        ),
        body: 
              // Create a Email sign-in/sign-up form
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SupaEmailAuth(
            redirectTo: kIsWeb ? null : 'io.mydomain.myapp://callback',
            onSignInComplete: (response) {
              // do something, for example: navigate('home');
              Get.to(Homepage());
            },
            onSignUpComplete: (response) {
              // do something, for example: navigate("wait_for_email");
              Get.to(Homepage());
            },
            metadataFields: [
              // Creates an additional TextField for string metadata, for example:
              // {'username': 'exampleUsername'}
              MetaDataField(
                prefixIcon: const Icon(Icons.person),
                label: 'Username',
                key: 'username',
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter something';
                  }
                  return null;
                },
              ),
          
              // Creates a CheckboxListTile for boolean metadata, for example:
              // {'marketing_consent': true}
              BooleanMetaDataField(
                label: 'I wish to receive marketing emails',
                key: 'marketing_consent',
                checkboxPosition: ListTileControlAffinity.leading,
              ),
              // Supports interactive text. Fields can be marked as required, blocking form
              // submission unless the checkbox is checked.
              BooleanMetaDataField(
                key: 'terms_agreement',
                isRequired: true,
                checkboxPosition: ListTileControlAffinity.leading,
                richLabelSpans: [
                  const TextSpan(
                      text: 'I have read and agree to the '),
                  TextSpan(
                    text: 'Terms and Conditions',
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // do something, for example: navigate("terms_and_conditions");
                      },
                  ),
                  // Or use some other custom widget.
                  //WidgetSpan()
                ],
              ),
            ]),
        ),
      ),
      );
  }
}
