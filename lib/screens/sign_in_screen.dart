import 'package:flutter/material.dart';
import 'package:inabit_assignment/assets.dart';
import 'package:inabit_assignment/bloc/bloc_exports.dart';
import 'package:inabit_assignment/utils/device_utils.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleAuthBloc, GoogleAuthState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: InkWell(
              onTap: state is GoogleAuthLoading
                  ? null
                  : () => context.read<GoogleAuthBloc>().add(
                        const GoogleAuthLogin(),
                      ),
              child: state is GoogleAuthLoading
                  ? const CircularProgressIndicator.adaptive()
                  : Image.asset(
                      Assets.googleLogo,
                      height: DeviceUtils.getScaledHeight(context, 0.1),
                    ),
            ),
          ),
        );
      },
    );
  }
}
