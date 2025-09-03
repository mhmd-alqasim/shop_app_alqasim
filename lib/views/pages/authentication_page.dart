import 'package:alqasim_market/BloC/auth_bloc.dart';
import 'package:alqasim_market/BloC/states/auth_states.dart';
import 'package:alqasim_market/network/local/cache_helper.dart';
import 'package:alqasim_market/utilites/enums.dart';
import 'package:alqasim_market/utilites/routers/routes.dart';
import 'package:alqasim_market/views/widgets/main_Butttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _namefocusnode = FocusNode();
  final _emailfocusnode = FocusNode();
  final _passwordfocusnode = FocusNode();

  var _authType = AuthFormType.login;

  final _formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccssesLoginState) {
          CacheHelper.SaveData(key: 'token', value: (state).token);
          CacheHelper.SaveData(key: 'isauth', value: true).then((value) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouter.mainPageRoute,
              (route) => false,
            );
          });
        } else if (state is SuccssesSignupState) {
          CacheHelper.SaveData(key: 'token', value: (state).token);
          CacheHelper.SaveData(key: 'isauth', value: true).then((value) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouter.mainPageRoute,
              (route) => false,
            );
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Form(
              key: _formkey,
              child: SingleChildScrollView(
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
                    const SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.all(35.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          if (_authType == AuthFormType.register)
                            // name from
                            TextFormField(
                              keyboardType: TextInputType.name,

                              focusNode: _namefocusnode,
                              onEditingComplete:
                                  () => FocusScope.of(
                                    context,
                                  ).requestFocus(_emailfocusnode),
                              textInputAction: TextInputAction.next,

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
                          //email form
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            focusNode: _emailfocusnode,
                            onEditingComplete:
                                () => FocusScope.of(
                                  context,
                                ).requestFocus(_passwordfocusnode),
                            textInputAction: TextInputAction.next,

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
                          ////////pass form
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,

                            focusNode: _passwordfocusnode,
                            textInputAction: TextInputAction.next,

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
                      title:
                          _authType == AuthFormType.login
                              ? 'Login'
                              : 'Register',
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          if (_authType == AuthFormType.login) {
                            // Login logic
                            AuthBloc.get(context).login(
                              _emailcontroller.text,
                              _passwordcontroller.text,
                            );
                          } else {
                            AuthBloc.get(context).signup(
                              _namecontroller.text,
                              _emailcontroller.text,
                              _passwordcontroller.text,
                            );
                          }
                        }
                      },
                    ),
                    SizedBox(height: size.height * 0.1),

                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Text(
                          _authType == AuthFormType.login
                              ? 'Don\'t have an Account? Register'
                              : 'Do you have Account? Login',
                        ),
                        onTap: () {
                          _formkey.currentState?.reset();
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
                    SizedBox(),
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
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: Icon(Icons.add),
                        ),
                        SizedBox(width: 15),
                        Container(
                          height: 50,
                          width: 50,
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
          ),
        );
      },
    );
  }
}
