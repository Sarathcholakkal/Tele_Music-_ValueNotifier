import 'package:flutter/material.dart';

final GlobalKey<FormState> signInKey = GlobalKey();
final RegExp textValid = RegExp(r"^\s*[a-zA-Z,\s]+\s*$");
final nameController = TextEditingController();

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Form(
        key: signInKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // Directly use Column without Expanded
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  } else if (!textValid.hasMatch(value)) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 10, 15),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Disclaimer: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          'We respect your privacy more than anything else. All of your data is stored locally on your devices.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
