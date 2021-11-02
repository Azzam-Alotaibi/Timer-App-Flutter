import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColorDark: Colors.grey[900],
          primaryColorLight: Colors.grey[800]),
      home: const SafeArea(
        child: MyScaffold(),
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    Key? key,
  }) : super(key: key);
  final EdgeInsets paddingConst = const EdgeInsets.all(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: const Text("Stopwatch"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Flexible(
            flex: 2,
            child: Center(
              child: Text(
                "00:00",
                style: TextStyle(
                  fontSize: 78,
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Button(text: "Stop", color: Colors.red),
                  Button(text: "Start", color: Colors.green)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key, required this.text, required this.color})
      : super(key: key);
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: color.withOpacity(0.6),
            value: 0,
          ),
          Container(
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Theme.of(context).primaryColorDark,
              ),
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
