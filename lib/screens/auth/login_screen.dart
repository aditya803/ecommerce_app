import 'package:ecommerce_app/extensions/common_appbar.dart';
import 'package:ecommerce_app/extensions/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: CommonAppbar(isHomeScreen: false),
      backgroundColor: Color(0xFFCED3DC),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            CustomTextField(controller: emailController, labelText: "Email", keyboardType: TextInputType.emailAddress),
            SizedBox(height: 10,),
            CustomTextField(controller: passwordController, labelText: "Password", keyboardType: TextInputType.visiblePassword),
            Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF0C54BE))
              ),
              onPressed: () async {
                await authProvider.signIn(
                  emailController.text,
                  passwordController.text,
                );
                if (authProvider.user != null) {
                  Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                }
              },
              child: Text('Login',style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/signup');
              },
              child: RichText(text: TextSpan(
                  text:  'New Here? ',
                  style:  GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.normal
                  ),
                  children: <TextSpan>[
                    TextSpan(text: "SignUp", style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Color(0xFF0C54BE),
                        fontWeight: FontWeight.bold
                    ))
                  ]
              )),
            ),
          ],
        ),
      ),
    );
  }
}
