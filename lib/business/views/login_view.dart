import 'package:flutter/material.dart';

import '../../core/constants/enums/locale_keys.dart';
import '../../core/constants/navigation_constants.dart';
import '../../core/init/cache/locale_manager.dart';
import '../../core/init/navigation/navigation_service.dart';

import '../services/cloudflare_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _textController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Cloudflare Api Token'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide Cloudflare Api Token';
                  }
                  return null;
                },
              ),
              OutlinedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var token = _textController.text;

                    LocaleManager.instance.setString(LocaleKeys.cfApiToken, token);
                    CloudflareService.instance.setToken(token);

                    NavigationService.instance.navigateToPageClear(path: NavigationConstants.mainView);
                  }
                },
                child: const Text('Authenticate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
