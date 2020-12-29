import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:text_editor_app/editor_file.dart';
import 'package:text_editor_app/home_page.dart';
import 'package:text_editor_app/my_text_controller.dart';
import 'package:text_editor_app/util/utilss.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController myController;
  var text = "";

  @override
  void initState() {
    myController = MyTextController();
    super.initState();
  }

  int lastIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    // Use the FlatIcons class for the IconData
                    icon: Icon(FontAwesomeIcons.bold),
                    onPressed: () {
                      Utils.addStyle(CustomStyleText(
                          textStyle: TextStyle(
                              color: MyTextController.isBold ? Colors.teal : Colors.red),
                          start: lastIndex,
                          end: myController.text.length ));
                      setState(() {
                        MyTextController.isBold = !MyTextController.isBold;
                        
                        // text = myController.text;
                        // myController = MyTextController(MyTextController.isBold: MyTextController.isBold);
                        // myController.text = text;
                      });
                      lastIndex = myController.text.length;

                    })
              ],
            ),
            Expanded(
              child: TextFormField(
                controller: myController,
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          // When the user presses the button, show an alert dialog containing
          // the text that the user has entered into the text field.
          onPressed: () {
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Retrieve the text the that user has entered by using the
                  // TextEditingController.
                  content: Text(myController.text.substring(
                      myController.selection.start,
                      myController.selection.end)),
                );
              },
            );
          },
          tooltip: 'Show me the value!',
          child: Icon(Icons.text_fields),
        ),
      ),
    );
  }
}
