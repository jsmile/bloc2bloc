import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/color/color_bloc.dart';
import 'blocs/counter/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // 7. 연결할 Bloc 들을 MultiBlocProvider 로 묶어서 제공
        BlocProvider<ColorBloc>(
          create: (colorContext) => ColorBloc(),
        ),
        BlocProvider<CounterBloc>(
          create: (counterContext) =>
              CounterBloc(colorBloc: counterContext.read<ColorBloc>()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Bloc to Bloc Communication',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Bloc2Bloc Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorBloc>().state.color,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text(
                'Change Color',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
              onPressed: () {
                // 8. 상태변화 요청 이벤트를 stream에 추가하기( add )
                context.read<ColorBloc>().add(ColorChangedEvent());
              },
            ),
            const SizedBox(height: 20.0),
            Text(
              '${context.watch<CounterBloc>().state.counter}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 52.0,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text(
                'Change Counter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
              onPressed: () {
                context.read<CounterBloc>().add(CounterChangedEvent());
              },
            )
          ],
        ),
      ),
    );
  }
}
