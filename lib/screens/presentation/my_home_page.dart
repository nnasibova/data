import 'dart:convert';
import 'package:data_json/screens/helpers/components/person_overview.dart';
import 'package:data_json/screens/helpers/components/sentences.dart';
import 'package:data_json/screens/helpers/constants/app_style.dart';
import 'package:data_json/screens/helpers/widgets/listforinfo.dart';
import 'package:flutter/material.dart';
import '../helpers/components/complaints.dart';
import '../helpers/components/doc_info.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 234, 234),
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('jsonfile/document.json'),
                builder: (context, snapshot) {
                  var newData = json.decode(snapshot.data.toString());
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  return Column(
                    children: [
                      Text(
                        "Document id: 9665",
                        style: TextStyles.styleForHeadings,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const PersonInfo(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Complaints(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Sentences(),
                      const SizedBox(
                        height: 20,
                      ),
                      const DocumentInfo(),
                      InfoList(text: 'Status', mainText: newData['status']),
                      InfoList(
                          text: 'Is watchlist',
                          mainText: newData['is_watchlist'].toString()),
                      InfoList(
                          text: 'Instruction notification view',
                          mainText: newData['Instruction_notification_view']
                              .toString()),
                      InfoList(
                          text: 'Latest prosecutor',
                          mainText: newData['latest_prosecutor']),
                      InfoList(
                          text: 'Latest head prosecutor',
                          mainText: newData['latest_head_prosecutor']),
                    ],
                  );
                }),
          ),
        ));
  }
}
