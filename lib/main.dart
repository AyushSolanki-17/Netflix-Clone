import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/home.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Netflix',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset("assets/ca.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover),
        Scaffold(
          backgroundColor: const Color.fromARGB(200, 43, 43, 43),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: (height * 5) / 100,
                  horizontal: (width * 2.5) / 100),
              child: Center(
                child: Container(
                  constraints: BoxConstraints(minHeight: height),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/netflix.png",
                        width: (width * 50) / 100,
                      ),
                      SizedBox(
                        height: (height * 5) / 100,
                      ),
                      Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: (height * 7) / 100, color: Colors.white),
                      ),
                      SizedBox(
                        height: (height * 5) / 100,
                      ),
                      const LoginForm()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      constraints: BoxConstraints(maxWidth: (width * 75) / 100),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(5.0),
            child: TextFormField(
                controller: usernameController,
                style: TextStyle(
                    color: Colors.white, fontSize: (height * 3.5) / 100),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.account_circle,color: Colors.white,),
                  hintText: 'Username',
                  hintStyle:
                  TextStyle(color: Color.fromARGB(255, 175, 175, 175)),
                  fillColor: Color.fromARGB(250, 75, 75, 75),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                      BorderSide(color: Color.fromARGB(100, 0, 121, 180))),
                )),
          ),
          Container(
            margin: const EdgeInsets.all(5.0),
            child: TextFormField(
                controller: passwordController,
                obscureText: true,
                style: TextStyle(
                    color: Colors.white, fontSize: (height * 3.5) / 100),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock,color: Colors.white,),
                  hintText: 'Password',
                  hintStyle:
                  TextStyle(color: Color.fromARGB(255, 175, 175, 175)),
                  fillColor: Color.fromARGB(250,75, 75, 75),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                      BorderSide(color: Color.fromARGB(200, 50, 50, 50))),
                )),
          ),
          SizedBox(
            height: (height * 2.5) / 100,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                username = usernameController.text.toString();
                password = passwordController.text.toString();
              });
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Alert Dialog Box"),
                  content: Text("Hello " + username),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx)=> const HomePage()));
                      },
                      child: const Text("Start Watching Movies"),
                    ),
                  ],
                ),
              );
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(30),
                padding: const EdgeInsets.all(20.0),
                primary: const Color.fromARGB(255, 229,9,20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                textStyle: TextStyle(fontSize: (height * 4) / 100)),
            child: const Text(
              'LOGIN',
              style: TextStyle(fontWeight: FontWeight.bold),

            ),
          )
        ],
      ),
    );
  }
}