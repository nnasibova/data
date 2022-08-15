import 'package:data_json/screens/helpers/constants/app_style.dart';
import 'package:flutter/material.dart';

class InfoList extends StatelessWidget {
  final String text;
  final String mainText;
  const InfoList({Key? key, required this.text, required this.mainText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 100,
        child: Text(
          text,
          style: TextStyles.styleForBody,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
      ),
      trailing: SizedBox(
        width: 180,
        child: Text(
          mainText,
          style: TextStyles.styleForInfo,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
      ),
    );
  }
}
