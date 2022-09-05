import 'package:dilo/utils/colors.dart';
import 'package:dilo/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String? studentId = '';
  // String? password = '';

  // Future<void> loginStudent() async {
  //   final usersCollection = FirebaseFirestore.instance.collection('users');
  //   final results = usersCollection
  //       .where('studentId', isEqualTo: "$studentId")
  //       .limit(1)
  //       .get();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('D I L O'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: 25,
        ),
        child: Column(
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/chatting.svg',
                width: 320,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Welcome to Dilo',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Say it, your friends are listening.",
                style: Theme.of(context).textTheme.headline6!.copyWith(),
                children: const [
                  TextSpan(
                    text: " Dilo",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      backgroundColor: AppColors.red,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: ' is a new way to share your thoughts and emotions.',
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const AuthButton(),
          ],
        ),
      ),
    );
  }
}
