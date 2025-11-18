import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuestionPage extends StatefulWidget {
  final String question;
  const QuestionPage({super.key, required this.question});

  @override
  State<StatefulWidget> createState() {
    return _QuestionPage();
  }
}

class _QuestionPage extends State<QuestionPage> {
  String title = '';
  int selectNumber = -1;

  Future<String> loadAsset(String fileName) async {
    return await rootBundle.loadString('res/api/$fileName.json');
  }
  @override
  void initState() {
    super.initState()
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder(builder: (context, snapshot){
      if(snapshot.hasData == false) {
        return const CircularProgressIndicator();
      }
      else if (snapshot.hasData){
        
      }
    })
  }
}