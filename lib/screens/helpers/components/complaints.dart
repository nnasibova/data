import 'dart:convert';
import 'package:data_json/screens/helpers/widgets/events.dart';
import 'package:data_json/screens/helpers/widgets/listforinfo.dart';
import 'package:data_json/screens/helpers/constants/app_style.dart';
import 'package:flutter/material.dart';

import '../widgets/prosecutors_view.dart';

class Complaints extends StatelessWidget {
  Complaints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('jsonfile/document.json'),
        builder: (context, snapshot) {
          var newData = json.decode(snapshot.data.toString());
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          var dataDocument = newData['complaint'];
          return ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemBuilder: (context, i) {
              return ExpansionTile(
                collapsedBackgroundColor: Colors.white,
                title: Text("Complaint",
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
                              text: "Id",
                              mainText: dataDocument['id'].toString(),
                            ),
                            InfoList(
                                text: 'Complaint type',
                                mainText: dataDocument["complaint_type"]),
                            InfoList(
                              text: 'Description',
                              mainText: dataDocument["description"],
                            ),
                            InfoList(
                              text: 'Penitentiary organization',
                              mainText:
                                  dataDocument["penitentiary_organization"],
                            ),
                            InfoList(
                              text: 'Complaint description',
                              mainText: dataDocument["complaint_description"],
                            ),
                            InfoList(
                              text: 'Fable of work',
                              mainText: dataDocument["fable_of_work"],
                            ),
                            InfoList(
                              text: 'Events:',
                              mainText: "",
                            ),
                             SizedBox(
                               height: MediaQuery.of(context).size.height/5, child: ComplaintEvents()),
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
