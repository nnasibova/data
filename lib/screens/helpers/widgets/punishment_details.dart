import 'dart:convert';
import 'package:data_json/screens/helpers/widgets/rowforinfo.dart';
import 'package:flutter/material.dart';

class PunishmentDetails extends StatefulWidget {
 final String punishmentType;
  final String title;
  final String values;
  const PunishmentDetails({Key? key, required this.punishmentType, required this.title, required this.values}) : super(key: key);

  @override
  State<PunishmentDetails> createState() => _PunishmentDetailsState();
}

class _PunishmentDetailsState extends State<PunishmentDetails> {
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
          List dataDocument = newData['sentences'][widget.punishmentType];
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: dataDocument.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      color: Color.fromARGB(255, 226, 222, 222),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: () => setState(() {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    title: Text(widget.title),
                                    actions: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            DetailsRow(
                                              mainText: dataDocument[index]
                                                      ['id']
                                                  .toString(),
                                              text: 'id',
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            DetailsRow(
                                              mainText: dataDocument[index]
                                                  ['type'],
                                              text: 'Type:',
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            DetailsRow(
                                              mainText: dataDocument[index]
                                                  ['punishment_name'],
                                              text: 'Punishment name:',
                                            ),
                                            DetailsRow(
                                              mainText:dataDocument[index]
                                                  ['values'].toString(),
                                              text: 'Day',
                                            ),
                                            SizedBox(
                                              height: 20,

                                            ),
                                            DetailsRow(
                                              mainText: dataDocument[index]
                                                      ['start_date'].toString(),
                                              text: 'Start date',
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            DetailsRow(
                                              mainText: dataDocument[index]
                                                      ['punishment_type_id']
                                                  .toString(),
                                              text: 'Punishment type id',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          }),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DetailsRow(
                                mainText: dataDocument[index]
                                    ['punishment_name'],
                                text: 'Punishment name',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              DetailsRow(
                                mainText: dataDocument[index]['start_date'].toString(),
                                text: 'Start date:',
                              ),
                            ],
                          ),
                        ),
                      )),
                );
              });
        });
  }
}
