import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kcapp/utils/colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Student ID';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your studentID',
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your Password',
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                        MediaQuery.of(context).size.width * 0.9,
                        40,
                      ),
                    ),
                    child: const Text('Log In'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
