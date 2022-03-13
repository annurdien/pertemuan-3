import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pertemuan_3/core/quotes_provider.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuotesHomePage(),
    );
  }
}

class QuotesHomePage extends ConsumerStatefulWidget {
  const QuotesHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuotesHomePageState();
}

class _QuotesHomePageState extends ConsumerState<QuotesHomePage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(singleRandomQuotesProvider);

    return Scaffold(
      body: SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              state.when(
                data: (quotes) {
                  return Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          quotes.content,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          quotes.author,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                error: (error, stackTrace) => Text("Errror Loading Data"),
                loading: () => Padding(
                  padding: const EdgeInsets.all(35),
                  child: CircularProgressIndicator(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.refresh(singleRandomQuotesProvider);
                },
                child: Text("Refresh Quotes"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
