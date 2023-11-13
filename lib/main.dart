import 'package:flutter/material.dart';
import 'generate.dart';
import 'package:clipboard/clipboard.dart';

void main() {
  runApp(const MaterialApp(
    home: GeneratePassword(),
  ));
}

class GeneratePassword extends StatefulWidget {
  const GeneratePassword({super.key});

  @override
  State<GeneratePassword> createState() => _GeneratePasswordState();
}

class _GeneratePasswordState extends State<GeneratePassword> {
  Generate generator = Generate();
  late String newPassword;
  late int length;

  @override
  void initState() {
    super.initState();
    length = 0;
    newPassword = generator.generatePassword(length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[800],
          title: Text('Generate a Password'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/back.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Length: $length",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$newPassword',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        FlutterClipboard.copy(newPassword).then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Text copied to clipboard'),
                            ),
                          );
                        });
                      },
                      icon: Icon(
                        Icons.copy,
                        color: Colors.white,
                      ),
                      label: SizedBox.shrink(), // Remove the label
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[
                            900], // Set the background color to transparent
                        onPrimary: Colors
                            .grey[900], // Set the text color to transparent
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: Container(
                  width: 150, // Adjust width as needed
                  height: 50, // Adjust height as needed
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        newPassword = generator.generatePassword(length);
                      });
                    },
                    child: Text("Generate"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shadowColor: Colors.amber,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            backgroundColor: Colors.grey[800],
            child: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                length -= 1;
              });
            },
            heroTag: null,
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.grey[800],
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                length += 1;
              });
            },
            heroTag: null,
          )
        ]));
  }
}
