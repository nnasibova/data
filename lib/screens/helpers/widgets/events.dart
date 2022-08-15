import 'dart:convert';

import 'package:data_json/screens/helpers/constants/app_style.dart';
import 'package:data_json/screens/helpers/widgets/rowforinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComplaintEvents extends StatefulWidget {
  const ComplaintEvents({Key? key}) : super(key: key);

  @override
  State<ComplaintEvents> createState() => _ComplaintEventsState();
}

class _ComplaintEventsState extends State<ComplaintEvents> {
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
          List dataDocument = newData['complaint']['events'];
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
                                    title: Text("Events"),
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
                                                  ['punishment_type'],
                                              text: 'Punishment type:',
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            DetailsRow(
                                              mainText: dataDocument[index]
                                                  ['description'],
                                              text: 'Description:',
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            DetailsRow(
                                              mainText: dataDocument[index]
                                                      ['event_date']
                                                  .toString(),
                                              text: 'Event date:',
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            DetailsRow(
                                              mainText: dataDocument[index]
                                                      ['measure_type']
                                                  .toString(),
                                              text: 'Measure type:',
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
                                    ['punishment_type'],
                                text: 'Punishment type:',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              DetailsRow(
                                mainText: dataDocument[index]['description'],
                                text: 'Description:',
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
