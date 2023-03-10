import 'dart:io';

import 'package:file_cryptor/file_cryptor.dart';
import 'package:fileincryptor/Things.dart';
import 'package:fileincryptor/main.dart';
import 'package:flutter/material.dart';

class Decrypt {
  Things things = Things();
  String _password = "";

  String comparePassword() {
    if (_password.length != 8) {
      print("Password must be 8 characters long");
      things.eatItSnackBar("Password must be 8 characters long");
    } else {
      String RRR = "{/^%!~&*}${_password}{)(*&^%#@!)??}<";
      return RRR;
    }
    return "";
  }

  void decryption(List<File> files) async {
    String password = comparePassword();
    try {
      FileCryptor fileCryptor = FileCryptor(
        key: password,
        iv: 16,
        dir: "TEMPORARY",
      );
      for (var element in files) {
        var savingPath = element.path;

        File decryptedFile = await fileCryptor.decrypt(
            inputFile: element.path,
            outputFile: element.path.replaceAll(".asm", ""));
        print(decryptedFile.absolute);
      }
    } catch (e) {
      things.eatItSnackBar(e.toString());
    }
  }

  clear() {
    _password = "";
  }

  showMyDialog(BuildContext context) {
    clear();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 320,
                    // This is the height of the chart
                    height: 500,
                    padding: const EdgeInsets.only(
                        top: 100, left: 20, right: 20, bottom: 100),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Enter Password',
                          style: TextStyle(
                            fontSize: 30,
                            //color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: const InputDecoration(
                              label: Text('Enter Password'),
                            ),
                            style: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                            ),
                            cursorWidth: 2,
                            onChanged: (value) {
                              _password = value;
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: (() {
                            if (path != null) {
                              decryption(path!);
                            }
                            Navigator.pop(context, "Action Three");
                          }),
                          child: const Text('Submit'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            path = null;
                            clear();
                            Navigator.pop(context, "Cancel");
                          },
                          child: const Text("Cancel"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
