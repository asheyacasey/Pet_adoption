import 'package:flutter/material.dart';

import '../../controllers/auth_controller.dart';

class DonationScreen extends StatefulWidget {
  final AuthController auth;
  const DonationScreen(this.auth, {Key? key,}) : super(key: key);

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  AuthController get _auth => widget.auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _auth.logout();
              },
              icon: const Icon(Icons.logout))
        ],
        centerTitle: true,
        title: const Text(
          'iGARCHU',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff3f51b5),
      ),
    );
  }
}
