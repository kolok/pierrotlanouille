import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pierrot la nouille',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Pierrot la nouille'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counteur = 0;

  void _increaseCounter() {
    setState(() {
      _counteur++;
    });
  }
  void _decreaseCounter() {
    setState(() {
      _counteur--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: _decreaseCounter, 
              icon: const Icon(Icons.indeterminate_check_box_outlined)
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Compteur de nouille'),
                Text('$_counteur')
              ],
            ),
            IconButton(
              onPressed: _increaseCounter, 
              icon: const Icon(Icons.add_box_outlined)
            ),
          ],
        )
      ),
      // body: Center(
      //     child: Counter(
      //       min: 0,
      //       max: 1000,
      //       step: 1,
      //       onValueChanged: print,
      //     ),
      // ),
    );
  }
}
