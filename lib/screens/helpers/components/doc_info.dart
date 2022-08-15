import 'dart:convert';
import 'package:data_json/screens/helpers/widgets/listforinfo.dart';
import 'package:data_json/screens/helpers/constants/app_style.dart';
import 'package:flutter/material.dart';

import '../widgets/prosecutors_view.dart';

class DocumentInfo extends StatelessWidget {
  const DocumentInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('jsonfile/document.json'),
        builder: (context, snapshot) {
          var newData = json.decode(snapshot.data.toString());
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          var dataDocument = newData['document_information'];
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemBuilder: (context, i) {
              return ExpansionTile(
                collapsedBackgroundColor: Colors.white,
                title: Text("Document information",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyles.styleForHeadings),
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InfoList(
                              text: "Status",
                              mainText: dataDocument['status'],
                            ),
                            InfoList(
                                text: 'Created by',
                                mainText: dataDocument["created_by"]),
                            InfoList(
                              text: 'Created at',
                              mainText: dataDocument["created_at"],
                            ),
                            const InfoList(
                              text: 'Prosecutors:',
                              mainText: "",
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 4.5,
                                child: const ProsecutorsInfo()),
                            const InfoList(
                              text: 'Qonaglar:',
                              mainText: "",
                            ),
                          ]),
                    ),
                  ),
                ],
              );
            },
            itemCount: 1,
          );
        });
  }
}
