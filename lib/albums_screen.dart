import 'package:flutter/material.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
     body:

     GridView.count(
       primary: false,
       padding: const EdgeInsets.all(20),
       crossAxisSpacing: 10,
       mainAxisSpacing: 10,
       crossAxisCount: 4,
       children: <Widget>[
         Container(
           padding: const EdgeInsets.all(8),
           color: Colors.teal[100],
           child: const Text("He'd have you all unravel at the"),
         ),
         Container(
           padding: const EdgeInsets.all(8),
           color: Colors.teal[200],
           child: const Text('Heed not the rabble'),
         ),
         Container(
           padding: const EdgeInsets.all(8),
           color: Colors.teal[300],
           child: const Text('Sound of screams but the'),
         ),
         Container(
           padding: const EdgeInsets.all(8),
           color: Colors.teal[400],
           child: const Text('Who scream'),
         ),
         Container(
           padding: const EdgeInsets.all(8),
           color: Colors.teal[500],
           child: const Text('Revolution is coming...'),
         ),
         Container(
           padding: const EdgeInsets.all(8),
           color: Colors.teal[600],
           child: const Text('Revolution, they...'),
         ),
         Container(
           padding: const EdgeInsets.all(8),
           color: Colors.white,
           child: const Text('Revolution, they...'),
         ),
         Container(
           padding: const EdgeInsets.all(8),
           color: Colors.green[600],
           child: const Text('Revolution, they...'),
         ),

       ],
     ),

    );
  }
}
