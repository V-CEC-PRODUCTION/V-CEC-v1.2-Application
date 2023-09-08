import 'package:flutter/material.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';

class RecEventTile extends StatelessWidget {
  const RecEventTile({
    super.key,
    this.color = const Color.fromRGBO(34, 82, 48, .63),
    this.textColor = kwhite,
    required this.imageUrl,
  });
  final Color color;
  final Color textColor;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        width: size.width - 20,
        height: size.width * 0.28,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: (size.width * 0.28 - 20) * 4 / 3,
              decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                        imageUrl,
                      ),
                      fit: BoxFit.cover)),
            ),
            kwidth20,
            SizedBox(
              width: size.width - (50 + ((size.width * 0.28) * 4 / 3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title lafdghv flii gblifybdsdsad pigyd hbfglisdg bpiysdg pi',
                    maxLines: 2,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'subtitle LISFYG IFYGFDDFDDddf OIYGIUYGFLIYUGSsdadsd LIBIUGIUHGLIUHGOU  OUHGOD G HOSGH IR;G',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
