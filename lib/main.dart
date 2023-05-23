import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  int _counter = 0;
  final String _title = 'Ton score';

  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    _setInitCounter();
  }

  Future<void> _setInitCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> _increaseCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter++;
    });
    prefs.setInt('counter', _counter);
  }
  Future<void>  _decreaseCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter--;
    });
    prefs.setInt('counter', _counter);
  }
  Future<void>  _resetCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter=0;
    });
    prefs.setInt('counter', 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  const Text(
                    '         ',
                  ),
                  Expanded(
                    child: Text(
                      _title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    )
                  ),
                  PopupMenuButton(
                    // add icon, by default "3 dot" icon
                    // icon: Icon(Icons.book)
                    itemBuilder: (context){
                      return [
                            const PopupMenuItem<int>(
                                value: 0,
                                child: Text("Ré-initialiser le compteur"),

                            ),
                        ];
                    },
                    onSelected:(value){
                      if(value == 0){
                        _resetCounter();
                      }
                    }
                  ),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: _decreaseCounter, 
                    icon: const Icon(Icons.indeterminate_check_box_outlined),
                    iconSize: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$_counter',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: _increaseCounter, 
                    icon: const Icon(Icons.add_box_outlined),
                    iconSize: 50,
                  ),
                ],
              )

            ],
          ),
        ),
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
