import 'package:chat3/cubit/Req_cubit/req_cubit.dart';
import 'package:chat3/cubit/chat_cubit/chat_cubit.dart';
import 'package:chat3/cubit/login_cubit/login_cubit.dart';
import 'package:chat3/pages/chat_page.dart';
import 'package:chat3/pages/login_page.dart';
import 'package:chat3/pages/resgister_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'firebase_options.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => LoginCubit(),),
      BlocProvider(create: (context) => ReqCubit()),
      BlocProvider(create: (context) => ChatCubit()),
    ],
      child: MaterialApp(
        routes: {
         LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          ChatPage.id : (context) => ChatPage()
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}
