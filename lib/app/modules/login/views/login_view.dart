import 'dart:io';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uas_app/app/modules/home/views/home_view.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginGoState extends StatefulWidget {
  const LoginGoState({Key? key}) : super(key: key);
  @override
  _loginGoState createState() => _loginGoState();
}

class _loginGoState extends State<LoginGoState> {
  Future<FirebaseApp> _initilizeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _initilizeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return LoginView();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GoogleSignInAccount? _currentUser;
  // bool _isloading = false;
  Future<void> _handleSignIn(context) async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          await FirebaseAuth.instance.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: googleAuth.idToken,
                  accessToken: googleAuth.accessToken));
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => convexbottombar(),
            ),
          );
        } on FirebaseAuthException catch (error) {
        } catch (error) {
        } finally {}
      }
    }
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((event) {
      setState(() {
        _currentUser = event;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }

    return user;
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _currentUser == null
            ? ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 120.0,
                        ),
                        Text(
                          "ONII CHANNN (◍´ᴗ`◍)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Image.asset('assets/anime.png'),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // TextFormField(
                        //   // initialValue: 'ex : admin@gmail.com',
                        //   // maxLength: 18,
                        //   controller: emailController,
                        //   decoration: const InputDecoration(
                        //     labelText: 'Email',
                        //     labelStyle: TextStyle(
                        //       color: Colors.blueGrey,
                        //     ),
                        //     prefixIcon: Icon(
                        //       Icons.email,
                        //     ),
                        //     enabledBorder: UnderlineInputBorder(
                        //       borderSide: BorderSide(
                        //         color: Colors.blueGrey,
                        //       ),
                        //     ),
                        //     // helperText: 'Enter your email address',
                        //   ),
                        //   onChanged: (value) {},
                        // ),
                        // const SizedBox(
                        //   height: 22.0,
                        // ),
                        // TextFormField(
                        //   // initialValue: '123456',
                        //   // maxLength: 20,
                        //   controller: passwordController,
                        //   obscureText: true,
                        //   decoration: const InputDecoration(
                        //     labelText: 'Password',
                        //     labelStyle: TextStyle(
                        //       color: Colors.blueGrey,
                        //     ),
                        //     prefixIcon: Icon(
                        //       Icons.lock,
                        //     ),
                        //     enabledBorder: UnderlineInputBorder(
                        //       borderSide: BorderSide(
                        //         color: Colors.blueGrey,
                        //       ),
                        //     ),
                        //     // helperText: 'Enter your password',
                        //   ),
                        //   onChanged: (value) {},
                        // ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Sini login ONIICHANN QYAAAA',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(),
                          onPressed: () => _handleSignIn(context),
                          child: Container(
                            width: 300,
                            height: 50,
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset('assets/Vector.png'),
                                Text(
                                  "Login With Google",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Container(
                child: ListTile(
                  leading: GoogleUserCircleAvatar(identity: _currentUser!),
                  title: Text(_currentUser!.displayName ?? ''),
                  subtitle: Text(_currentUser!.email),
                ),
              ));
  }
}
