import 'dart:convert';
import 'package:data_json/screens/helpers/widgets/rowforinfo.dart';
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
            return const CircularProgressIndicator();
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
                      color: const Color.fromARGB(255, 226, 222, 222),
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
                                    title: const Text("Events"),
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
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            DetailsRow(
                                              mainText: dataDocument[index]
                                                  ['punishment_type'],
                                              text: 'Punishment type:',
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            DetailsRow(
                                              mainText: dataDocument[index]
                                                  ['description'],
                                              text: 'Description:',
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            DetailsRow(
                                              mainText: dataDocument[index]
                                                      ['event_date']
                                                  .toString(),
                                              text: 'Event date:',
                                            ),
                                            const SizedBox(
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
                              const SizedBox(
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
