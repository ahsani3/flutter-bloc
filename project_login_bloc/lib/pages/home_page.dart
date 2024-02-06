import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_login_bloc/bloc/auth_bloc.dart';

import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AuthSuccess) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Welcome ${state.uid}'),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthLogoutRequested());
                      },
                      child: const Text("Logout"),
                    )
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
