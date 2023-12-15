import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/controller.dart';
import 'package:flutter_application_1/data/cat.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Future<List<Cat>> futureListOfCat;

  @override
  void initState() {
    super.initState();
    futureListOfCat = fetchListOfCat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Cat>>(
            future: futureListOfCat,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final cat = snapshot.data![index];
                      return Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.network(cat.url),
                            ListTile(
                              leading: const Icon(Icons.pets),
                              title: Text(cat.id),
                              subtitle: Text(
                                'Width: ${cat.width} Height: ${cat.height}',
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
