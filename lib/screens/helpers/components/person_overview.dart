import 'dart:convert';
import 'package:data_json/screens/helpers/widgets/listforinfo.dart';
import 'package:data_json/screens/helpers/constants/app_style.dart';
import 'package:flutter/material.dart';

class PersonInfo extends StatelessWidget {
  PersonInfo({Key? key}) : super(key: key);

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
          var dataIndividuals = newData['individual'];
          return ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemBuilder: (context, i) {
              return ExpansionTile(
                collapsedBackgroundColor: Colors.white,
                title: Text("Şəxsi məlumatlar",
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.withOpacity(0.5)),
                                child: Image.network(
                                  dataIndividuals['individual_photo'], fit: BoxFit.cover,
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Sarah Bolger Derek",
                              style: TextStyles.styleForInfo,
                            ),
                            InfoList(
                              text: "Gender",
                              mainText: dataIndividuals['gender'],
                            ),
                            InfoList(
                                text: 'Birth date',
                                mainText: dataIndividuals["birth_date"]),
                            InfoList(
                              text: 'Birth country',
                              mainText: dataIndividuals["birth_country"],
                            ),
                            InfoList(
                              text: 'Birth state',
                              mainText: dataIndividuals["birth_state"],
                            ),
                            InfoList(
                              text: 'Citizenship',
                              mainText: dataIndividuals["citizenship"],
                            ),
                            InfoList(
                              text: 'Previous conviction',
                              mainText: dataIndividuals['previous_conviction'],
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
