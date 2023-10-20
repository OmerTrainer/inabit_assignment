import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inabit_assignment/bloc/bloc_exports.dart';
import 'package:inabit_assignment/firebase_options.dart';
import 'package:inabit_assignment/repositories/google_auth_repository.dart';
import 'package:inabit_assignment/screens/sign_in_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  HydratedBloc.storage = storage;
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GoogleAuthBloc(GoogleAuthRepository()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInScreen(),
      ),
    );
  }
}
