import 'package:flutter/material.dart';
import 'package:product/pages/dash_board_page.dart';
import 'package:product/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => LogInPage(),
        '/dashboard': (context) => DashBoardPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Product Desplayer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Products Home Page'),
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
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          const SizedBox(
            width: 5,
          ),
          IconButton(
            icon: const Icon(Icons.app_registration),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            icon: const Icon(Icons.dashboard_customize),
            onPressed: () {
              Navigator.pushNamed(context, '/dashboard');
            },
          )
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Welcome")],
        ),
      ),
    );
  }
}
