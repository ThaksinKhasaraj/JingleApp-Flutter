import 'package:flutter/material.dart';
import 'package:jinsgle/model/profile.dart';
import 'package:form_field_validator/form_field_validator.dart';


class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email", style: TextStyle(fontSize: 20)),
                  TextFormField(
                    validator: MultiValidator([
                              RequiredValidator(errorText: "กรุณาป้อนอีเมลด้วยครับ"),
                              EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")
                            ]),
                    keyboardType: TextInputType.emailAddress,
                    // onSaved: (String email) {
                    //   profile.email = email;
                    // },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Password", style: TextStyle(fontSize: 20)),
                  TextFormField(
                   validator: RequiredValidator(errorText: "กรุณาป้อนรหัสผ่านด้วยครับ"),
                    obscureText: true,
                    // onSaved: (String password) {
                    //   profile.password = password;
                    // },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("Ragister", style: TextStyle(fontSize: 20)),
                      onPressed: () {
                        formKey.currentState?.save();
                        print(
                            "email = ${profile.email} password = ${profile.password}");
                        formKey.currentState?.reset();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
