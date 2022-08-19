
import 'package:flutter/material.dart';
import 'package:pet_adoption/src/screens/adoption/adoption_screen.dart';
import 'package:pet_adoption/src/screens/donation/pet_donation_screen.dart';

import '../../controllers/auth_controller.dart';

class HomeScreen extends StatefulWidget {
  final AuthController auth;
  const HomeScreen(this.auth, {Key? key,}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController _authController = AuthController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'iGARCHU',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff3f51b5),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BottomAppBar(
            elevation: 0,
            color: Colors.orange,
            child: SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconBottomBar(
                        text: "Home",
                        icon: Icons.home,
                        selected: true,
                        onPressed: () {

                        }),
                    IconBottomBar(
                        text: "Adoption",
                        icon: Icons.favorite,
                        selected: false,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AdoptionScreen(_authController)));
                        }),
                    IconBottomBar(
                        text: "Donation",
                        icon: Icons.notes,
                        selected: false,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DonationScreen(_authController)));
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
      );
  }
}



class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
        required this.text,
        required this.icon,
        required this.selected,
        required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon:
          Icon(icon, size: 25, color: selected ? accentColor : Colors.white),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              height: .1,
              color: selected ? accentColor : Colors.white),
        )
      ],
    );
  }
}


