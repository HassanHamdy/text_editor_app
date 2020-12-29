// import 'package:flutter/material.dart';
// import 'package:quill_delta/quill_delta.dart';
// import 'package:zefyr/zefyr.dart';
//
// class EditorFile extends StatefulWidget {
//   @override
//   _EditorFileState createState() => _EditorFileState();
// }
//
// class _EditorFileState extends State<EditorFile> {
//   ZefyrController _zefyrController;
//   FocusNode _focusNode;
//
//   @override
//   void initState() {
//     final document = _loadDocument();
//     _zefyrController = ZefyrController(document);
//     _focusNode = FocusNode();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Create A Node"),
//       ),
//       body: ZefyrScaffold(
//         child: ZefyrEditor(
//           controller: _zefyrController,
//           focusNode: _focusNode,
//           padding: EdgeInsets.all(16.0),
//         ),
//       ),
//     );
//   }
//
//   NotusDocument _loadDocument() {
//     final Delta delta = Delta()..insert("Zeyfer Quick start\n");
//     return NotusDocument.fromDelta(delta);
//   }
// }
