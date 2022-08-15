import 'dart:convert';
import 'package:data_json/screens/helpers/widgets/listforinfo.dart';
import 'package:data_json/screens/helpers/constants/app_style.dart';
import 'package:flutter/material.dart';
import '../widgets/punishment_details.dart';
import '../widgets/sentence_special_law_items.dart';

class Sentences extends StatelessWidget {
  const Sentences({Key? key}) : super(key: key);

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
          var dataDocument = newData['sentences'];
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemBuilder: (context, i) {
              return ExpansionTile(
                collapsedBackgroundColor: Colors.white,
                title: Text("Sentences",
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
                              text: "id",
                              mainText: dataDocument['id'].toString(),
                            ),
                            InfoList(
                                text: 'court_name',
                                mainText: dataDocument["court_name"]),
                            InfoList(
                              text: 'sentence_date',
                              mainText: dataDocument["sentence_date"],
                            ),
                            InfoList(
                              text: 'is_conditional',
                              mainText: dataDocument["is_conditional"],
                            ),
                            InfoList(
                              text: 'conditional_start_date',
                              mainText: dataDocument["conditional_start_date"],
                            ),
                            InfoList(
                              text: 'sentence_date',
                              mainText: dataDocument["sentence_date"],
                            ),
                            const InfoList(
                              mainText: "",
                              text: 'Punishments:',
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 4.5,
                                child: const PunishmentDetails(
                                  title: 'punishments',
                                  punishmentType: 'punishments',
                                  values: '2 years 5 months 14 days',
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            const InfoList(
                              text: 'Sentence special law items:',
                              mainText: "",
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 4.5,
                                child: const SpecialLawItems(
                                  lawItems: 'sentence_special_law_items',
                                  title: 'Sentence special law items',
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            const InfoList(
                              text: 'Sentence special global items:',
                              mainText: "",
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 4.5,
                                child: const SpecialLawItems(
                                  lawItems: 'sentence_global_law_items',
                                  title: 'Sentence global law items',
                                )),
                            const InfoList(
                              text: 'Extra punishments',
                              mainText: "",
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.height / 4,
                                child: const PunishmentDetails(
                                  title: 'extra_punishments',
                                  punishmentType: 'extra_punishments',
                                  values: '5 years 11 months 24 days',
                                )),
                            const SizedBox(
                              height: 20,
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
