import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: home(),
      ),
    );
  }
}

final counterstateProvider = StateProvider<int>((ref) {
  return 0;
});

class home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(counterstateProvider.state).state;

    return Scaffold(
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        FloatingActionButton(
          onPressed: () {
            ref.read(counterstateProvider.state).state--;
          },
          child: const Icon(Icons.remove),
        ),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            ref.read(counterstateProvider.state).state++;
          },
          child: const Icon(Icons.add),
        ),
      ]),
      body: Center(
        child: Text('$value'),
      ),
    );
  }
}
