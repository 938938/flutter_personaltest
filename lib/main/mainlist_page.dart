import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage>{
  // JSON 파일을 비동기로 로드하는 함수
  Future<String> loadAsset() async {
    return await rootBundle.loadString('res/api/list.json');
  }
  @override
  Widget build(BuildContext conext){
    return Scaffold(
      body:FutureBuilder<String>( //Future 타입 명시
        future:loadAsset(),
        builder: (context, snapshot){
          // 연결 상태에 따라 다른 위젯 보여주기
          switch (snapshot.connectionState){
            case ConnectionState.waiting:
              // 데이터 가져오는 동안 로딩 표시
              return const Center(
                child:CircularProgressIndicator()
              );
            case ConnectionState.done:
              // 데이터 가져오기 성공
              if(snapshot.hasData){
                Map<String, dynamic> list = jsonDecode(snapshot.data!);
                return ListView.builder(
                  itemCount: list['count'],
                  itemBuilder: (context, index) {
                    return InkWell(
                      // onTop:(){
                        // 파이어베이스 로그 이벤트 호출
                      // },
                      child: SizedBox(
                        height: 50,
                        child: Card(child: Text(list['questions'][index]['title'].toString()),),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                // 오류가 발생했다면 오류메세지 표시
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                // 데이터가 없을 때
                return const Center(
                  child: Text(
                    'No Data'
                  ),
                );
              }
            default:
              return const Center(
                child: Text(
                    'No Data'
                ),
              );
          }
        },
      )
    );
  }
}
