import 'dart:convert';

import 'package:data_json/screens/helpers/constants/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProsecutorsInfo extends StatefulWidget {
  const ProsecutorsInfo({Key? key}) : super(key: key);

  @override
  State<ProsecutorsInfo> createState() => _ProsecutorsInfoState();
}

class _ProsecutorsInfoState extends State<ProsecutorsInfo> {
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
          List dataDocument = newData['document_information']['prosecutors'];
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
                                    title: Text("Prosecutors"),
                                    actions: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: false,
                                                    "Organization name:",
                                                    style:
                                                        TextStyles.styleForBody,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                SizedBox(
                                                  width: 160,
                                                  child: Text(
                                                    dataDocument[index]
                                                        ['organization_name'],
                                                    style:
                                                        TextStyles.styleForInfo,
                                                    maxLines: 5,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: false,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Position:",
                                                  style:
                                                      TextStyles.styleForBody,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  dataDocument[index]
                                                      ['position'],
                                                  style:
                                                      TextStyles.styleForInfo,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text("Rank:",
                                                    style: TextStyles
                                                        .styleForBody),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    dataDocument[index]['rank'],
                                                    style: TextStyles
                                                        .styleForInfo),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text("Full name:",
                                                    style: TextStyles
                                                        .styleForBody),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    dataDocument[index]
                                                        ['full_name'],
                                                    style: TextStyles
                                                        .styleForInfo),
                                              ],
                                            )
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
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      "Organization name:",
                                      style: TextStyles.styleForBody,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 160,
                                    child: Text(
                                      dataDocument[index]['organization_name'],
                                      style: TextStyles.styleForInfo,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Position:",
                                    style: TextStyles.styleForBody,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    dataDocument[index]['position'],
                                    style: TextStyles.styleForInfo,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
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
