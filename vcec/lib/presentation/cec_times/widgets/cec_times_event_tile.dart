import 'package:flutter/material.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/cec_times/cec_times_subpage/cec_times_subpage_screen.dart';

class CecTimesTileWidget extends StatelessWidget {
  const CecTimesTileWidget({
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
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CecTimesSubPageScreen()));
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          // width: size.width - 20,
          height: size.width * 0.28,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              Container(
                //  height: double.infinity,
                width: (size.width * 0.33 - 20) * 4 / 3,
                decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(
                          imageUrl,
                        ),
                        fit: BoxFit.cover)),
              ),
              kwidth20,
              SizedBox(
                width: size.width - (52.5 + ((size.width * 0.28) * 4 / 3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title lafdghv flii gblify ddads bdsdsad pigyd hbfglisdg bpiysdg pi',
                      maxLines: 2,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'subtitle LISFYG IFYGFDDFDDddf OIYG IUYGFLIYUGSs dadsd LIB IU GIUHGLI UHGOU  OUHGOD G HOSGH IR;G',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Expanded(child: Container()),
                    Text(
                      '1 hour ago',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
