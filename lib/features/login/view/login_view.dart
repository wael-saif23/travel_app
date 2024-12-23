import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/widgets/auth/login_view_body.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';

import '../cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          
          return  ScaffoldPattern(
            child:LoginViewBody() ,
            
          );
        },
      ),
    );
  }
}
