import 'dart:io';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uas_app/app/modules/home/views/home_view.dart';

// bawaan package
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

//  controll tombol login pakai google
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
      //
      body: FutureBuilder(
          future: _initilizeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // diarahkan tampilan
              return LoginView();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

// tampilan login
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GoogleSignInAccount? _currentUser;
  // bool _isloading = false;
// controller ke 2 login dari package
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
  // button sama
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

  @override
  //tampilan dimulai darsini
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
                        // teks biasa
                        Text(
                          "IOT CONTROL",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        //spasi
                        const SizedBox(
                          height: 20.0,
                        ),
                        //ngambil dari assets
                        Image.asset('assets/lampu.png'),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        // teks
                        Text(
                          'Sini login pakai google :',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        //tombol
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
                                // bukan teks tapi gambar google
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
