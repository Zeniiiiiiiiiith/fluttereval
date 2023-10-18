import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Controle Flutter',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Application du Contrôle'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  bool _showKeyboard = true;

  void _updateCounter(int value) {
    setState(() {
      _counter = value;
    });
  }

  void _toggleKeyboard() {
    setState(() {
      _showKeyboard = !_showKeyboard;
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
  appBar: AppBar(

    backgroundColor: Theme.of(context).colorScheme.inversePrimary,

    title: Text(widget.title),
  ),
  body: Center(
 
    child: Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Vous avez cliqué sur le chiffre:',
        ),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        Visibility(
          visible: _showKeyboard,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(12, (index) { 
              if (index == 9) {

                return Spacer();
              } else if (index == 10) {

                return SizedBox(
                  width: 48,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => _updateCounter(0),
                    child: Text('0'),
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.all(8),
                    ),
                  ),
                );
              } else if (index == 11) {

                return Spacer();
              } else {

                return SizedBox(
                  width: 48,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => _updateCounter(index + 1),
                    child: Text('${index + 1}'),
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.all(8),
                    ),
                  ),
                );
              }
            }),
          ),
        ),

        Visibility(
          visible: !_showKeyboard,
          child: Image.asset('images/$_counter.jpg'),
        ),
      ],
    ),
  ),
  floatingActionButton: FloatingActionButton(
    child: Icon(Icons.keyboard),
    onPressed: _toggleKeyboard,
  ),
);

  }
}
