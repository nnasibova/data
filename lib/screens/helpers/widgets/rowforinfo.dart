import 'package:data_json/screens/helpers/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailsRow extends StatelessWidget {
  final String text;
  final String mainText;
  const DetailsRow({Key? key, required this.text, required this.mainText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
                                              children: [
                                                SizedBox(
                                                  width: 90,
                                                  child: Text(
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: false,
                                                    text,
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
                                                    mainText,
                                                    style:
                                                        TextStyles.styleForInfo,
                                                    maxLines: 20,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: false,
                                                  ),
                                                ),
                                              ],
                                            );
  }
}