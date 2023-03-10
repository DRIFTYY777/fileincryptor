import 'dart:io';
import 'package:fileincryptor/Decrypt.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'Encrypt.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();
Encrypt encrypt = Encrypt();
Decrypt decrypt = Decrypt();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<File>? path;

class _MyHomePageState extends State<MyHomePage> {
  /// File path from file picker

  /// Get file path from file picker
  /// return file path
  /// return null if user cancel the picker
  /// return null if user select no file
  /// return null if user select a folder
  Future<List<File>?> _get_file_path() async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(allowMultiple: true, withData: true, withReadStream: true);
      if (result != null) {
        List<File> files = result.paths.map((path) => File(path!)).toList();
        return files;
      } else {
        // User canceled the picker
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () async {
                  path = await _get_file_path();
                  if (path != null) {
                    encrypt.showMyDialog(context);
                  }
                  setState(() {});
                },
                child: const Text("Encrypt"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () async {
                  path = await _get_file_path();
                  if (path != null) {
                    decrypt.showMyDialog(context);
                  }
                  setState(() {});
                },
                child: const Text("Decrypt"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
