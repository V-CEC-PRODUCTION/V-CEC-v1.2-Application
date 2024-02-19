import 'package:flutter/material.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/common_widgets/avatar.dart';
import 'package:vcec/presentation/common_widgets/message_icon.dart';
import 'package:vcec/presentation/mainmenu/widgets/carousel.dart';

class CecTimesSubPageScreen extends StatelessWidget {
  const CecTimesSubPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leadingWidth: 66,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Avatar(),
        ),
        title: const Text(
          'CEC Gallery',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
        centerTitle: true,
        actions: [
          const MessageIcon(),
          kwidth20,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight20,
              const Text('08 May 2023', style: TextStyle(color: kBlackBlurr)),
              kheight5,
              const Heading(
                text: 'Satasdfg sgfd gdtsrg b gkjhdghjhkghdf jhg gs',
              ),
              kheight15,
              Center(
                child: Container(
                    //height: size.width * .95 * 518 / 1019,
                    //width: double.infinity,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.network(
                      image[2],
                      //'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSU5niaM69Gpy3mL5kKEjMI5DHfshTBE3nktL63bZ4&s',
                      fit: BoxFit.cover,
                    )),
              ),
              kheight20,
              const Content(
                text:
                    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tendto repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetitioninjected humour, or non-characteristic words etc.',
              ),
              kheight15,
              const Content(text: 'Neque porro quisqu'),
              kheight15,
              IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: kBlackBlurr, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      height: double.infinity,
                    ),
                    kwidth10,
                    SizedBox(
                      width: size.width - 50,
                      child: const Heading(
                          text:
                              'Lorem Ipsum has been the industrys s tan dar d d ummy Neque porro quisquam est qui   '),
                    )
                  ],
                ),
              ),
              kheight15,
              const Content(
                text:
                    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tendto repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetitioninjected humour, or non-characteristic words etc.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ));
  }
}

class Content extends StatelessWidget {
  const Content({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.bold, color: kBlackBlurr),
    );
  }
}
