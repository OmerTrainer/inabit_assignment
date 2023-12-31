import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inabit_assignment/bloc/bloc_exports.dart';
import 'package:inabit_assignment/bloc/language_bloc/language_bloc.dart';
import 'package:inabit_assignment/firebase_options.dart';
import 'package:inabit_assignment/repositories/article_repository.dart';
import 'package:inabit_assignment/repositories/google_auth_repository.dart';
import 'package:inabit_assignment/repositories/language_repository.dart';
import 'package:inabit_assignment/screens/home_screen.dart';
import 'package:inabit_assignment/screens/sign_in_screen.dart';
import 'package:inabit_assignment/screens/splash_screen.dart';
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
  runApp(const SplashScreen());
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
        BlocProvider(
          create: (context) => ArticleBloc(ArticleRepository()),
        ),
        BlocProvider(
          create: (context) => LanguageBloc(LanguageRepository()),
        ),
      ],
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            context.read<ArticleBloc>().add(const FetchArticles());
            context.read<LanguageBloc>().add(const FetchLanguages());
            return HomeScreen(snapshot.data!);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator.adaptive();
          } else {
            return const SignInScreen();
          }
        },
      ),
    );
  }
}
