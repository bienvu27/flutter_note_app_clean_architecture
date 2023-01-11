import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_clean_architecture/app_const.dart';
import 'package:note_app_clean_architecture/feature/presentation/cubit/auth/auth_cubit.dart';
import 'package:note_app_clean_architecture/feature/presentation/pages/home_page.dart';

import '../../domain/entities/user_entity.dart';
import '../cubit/user/user_cubit.dart';
import '../widgets/common.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldGlobalKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldGlobalKey,
      body: BlocConsumer<UserCubit, UserState>(
        builder: (context, userState){
          if(userState is UserSuccess){
            return BlocBuilder<AuthCubit, AuthState>(builder: (context, authState){
              if(authState is Authenticated){
                return const HomePage(uid: '',);
              }else{
                return _bodyWidget();
              }
            });

          }
          return _bodyWidget();
        },
        listener: (context, userState){
          if(userState is UserSuccess){
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if(userState is UserFailure){
            const SnackBarErr(msg: 'invalid email',);
          }
        },
      ),
    );
  }

  _bodyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 120,
          child: Image.asset("assets/notebook.png"),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.1), borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: 'Enter your email',
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.1), borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              hintText: 'Enter your password',
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            submitSignIn();
          },
          child: Container(
            height: 45,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
                color: Colors.deepOrange.withOpacity(.1), borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(context, PageConst.signUpPage, (route) => false);
          },
          child: Container(
            height: 45,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.8), borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: const Text(
              'Sign Up',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }

  void submitSignIn() {
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      BlocProvider.of<UserCubit>(context).submitSignIn(
          user: UserEntity(
        email: _emailController.text,
        password: _passwordController.text,
      ));
    }
  }
}
