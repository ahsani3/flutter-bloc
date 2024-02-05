import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
}

class MyBloc extends StatelessWidget {
  const MyBloc({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();
    return Column(
      children: <Widget>[
        BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text('Counter : $state');
          },
        ),
        ElevatedButton(
          onPressed: () => counterCubit.increment(),
          child: Text('Increment'),
        ),
      ],
    );
  }
}
