import 'package:alqasim_market/utilites/enums.dart';
import 'package:alqasim_market/views/widgets/main_Butttom.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final _namecontroller = TextEditingController();

  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  var _authType = AuthFormType.login;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _authType == AuthFormType.login ? 'login' : 'register',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                _authType == AuthFormType.login
                    ? 'Welcome back! Please enter your details.'
                    : 'Wlecome in my Market Sigin up!',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 50),
              Container(
                padding: EdgeInsets.all(35.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    if (_authType == AuthFormType.register)
                      TextFormField(
                        validator:
                            (value) =>
                                (value == null || value.isEmpty)
                                    ? 'plase enter your Name'
                                    : null,
                        controller: _namecontroller,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter Your Name',
                        ),
                      ),
                    if (_authType == AuthFormType.register)
                      const SizedBox(height: 20),

                    TextFormField(
                      validator:
                          (value) =>
                              (value == null || value.isEmpty)
                                  ? 'plase enter your email'
                                  : null,
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter Your email',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator:
                          (value) =>
                              (value == null || value.isEmpty)
                                  ? 'plase enter your password'
                                  : null,

                      controller: _passwordcontroller,
                      decoration: InputDecoration(
                        labelText: 'Passwors',
                        hintText: 'Enter Your Password',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              if (_authType == AuthFormType.login)
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    child: Text('Forget your password ?'),
                    onTap: () {},
                  ),
                ),
              SizedBox(height: 25),
              MainButtton(
                title: _authType == AuthFormType.login ? 'Login' : 'Register',
                onTap: () {},
              ),
              SizedBox(height: 10),

              Align(
                alignment: Alignment.center,
                child: InkWell(
                  child: Text(
                    _authType == AuthFormType.login
                        ? 'Don\'t have an Account? Register'
                        : 'Do you have Account? Login',
                  ),
                  onTap: () {
                    setState(() {
                      if (_authType == AuthFormType.login) {
                        _authType = AuthFormType.register;
                      } else {
                        _authType = AuthFormType.login;
                      }
                    });
                  },
                ),
              ),
              const Spacer(),
              Center(
                child: Text(
                  _authType == AuthFormType.login
                      ? 'or Login with!'
                      : 'or register with!',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Icon(Icons.add),
                  ),
                  SizedBox(width: 15),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
