import 'package:flutter/material.dart';
import 'package:inabit_assignment/bloc/bloc_exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Omer News App'),
        actions: [
          IconButton(
            onPressed: () =>
                context.read<GoogleAuthBloc>().add(const GoogleAuthSignOut()),
            icon: const Icon(Icons.exit_to_app_outlined),
          ),
        ],
      ),
    );
  }
}
