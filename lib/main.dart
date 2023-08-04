import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Item {
    String name;
    int count;
    int id;

    Item(this.name, this.count, this.id);
}

const myTextStyle = TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, );
const myHeaderStyle = TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Shopping List'),
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
  final List<Item> _list = [Item("eggs", 12, 0), Item("coke", 2, 1), Item("chimken", 6, 2)];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: myHeaderStyle,),
      ),
      body: Center(
        child: Column(

          textDirection: TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            for(var item in _list) Row(
               children: 
                    <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child:Text(item.name,style: myTextStyle, )
                    ),
                    Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end, 
                            children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child:Text(item.count.toString(),style: myTextStyle,) 
                                )
                            ],
                        )
                    )
                    ],
               )
          ]
          )
        ),
      
      //floatingActionButton: FloatingActionButton(
        //tooltip: 'Increment',
        //child: const Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
