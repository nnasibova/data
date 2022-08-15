import 'dart:convert';
import 'package:data_json/screens/helpers/widgets/rowforinfo.dart';
import 'package:flutter/material.dart';

class SpecialLawItems extends StatefulWidget {
  final String lawItems;
  final String title;
  const SpecialLawItems({
    Key? key,
    required this.lawItems,
    required this.title,
  }) : super(key: key);

  @override
  State<SpecialLawItems> createState() => _SpecialLawItemsState();
}

class _SpecialLawItemsState extends State<SpecialLawItems> {
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
          List dataDocument = newData['sentences'][widget.lawItems];
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
                                              mainText: dataDocument[index][
                                                      'classification_of_crime']
                                                  .toString(),
                                              text: 'classification_of_crime',
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            DetailsRow(
                                              mainText: dataDocument[index]
                                                      ['ordinary']
                                                  .toString(),
                                              text: 'ordinary:',
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            DetailsRow(
                                                mainText: dataDocument[index]
                                                    ['norm'],
                                                text: 'norm'),
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
                                        ["classification_of_crime"]
                                    .toString(),
                                text: 'classification_of_crime',
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              DetailsRow(
                                mainText:
                                    dataDocument[index]["ordinary"].toString(),
                                text: 'ordinary',
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
