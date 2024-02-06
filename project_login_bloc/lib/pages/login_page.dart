import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_login_bloc/bloc/auth_bloc.dart';
import 'package:project_login_bloc/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isVisible = true;

  void toggleVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.error),
          ),
        );
      }
      if (state is AuthSuccess) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      }
    }, builder: (context, state) {
      if (state is AuthLoading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      return Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 175, 175, 175)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  suffixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                  controller: _passwordController,
                  obscureText: isVisible,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 175, 175, 175)),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    suffixIcon: IconButton(
                        onPressed: toggleVisible,
                        icon: isVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                  )),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthLoginRequested(
                        email: _emailController.text,
                        password: _passwordController.text));
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      );
    });
  }
}
