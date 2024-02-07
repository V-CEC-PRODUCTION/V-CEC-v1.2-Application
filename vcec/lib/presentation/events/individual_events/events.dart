import 'package:flutter/material.dart';

class IndEventsPage extends StatelessWidget {
  const IndEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            iconSize: size1 * 0.05,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: Text(
          'MVP 4.0',
          style: TextStyle(fontSize: size1 * 0.05, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: size1 * 0.77,
                    width: size1 * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellow,
                      image: const DecorationImage(
                        image: NetworkImage(''),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size1 * 0.10),
                    child: const Row(
                      children: [
                        Text(
                          '8:00 AM',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 28,
                        ),
                        Text('|',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 28,
                        ),
                        Text('28 July',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 28,
                        ),
                        Text('|',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 28,
                        ),
                        Text('AC Auditorium',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size1 * 0.10, right: size1 * 0.09),
                    child: const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.                                                                                                                                                                                                                                  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including version.",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.3,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size1 * 0.57),
                    child: const Text(
                      'Conducted By',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size1 * 0.07),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size1 * 0.2,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left: size1 * 0.02),
                                child: Container(
                                  height: size1 * 0.1,
                                  width: size1 * 0.1,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.yellow,
                                    image: DecorationImage(
                                      image: NetworkImage(''),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size1 * 0.13,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            child: Container(
              height: size1 * 0.18,
              color: Colors.white.withOpacity(0.7),
              child: Row(
                children: [
                  SizedBox(
                    width: size1 * 0.10,
                  ),
                  SizedBox(
                    width: size1 * 0.6,
                    height: size1 * 0.13,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 4,
                          backgroundColor:
                              const Color.fromARGB(255, 55, 51, 51),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size1 * 0.07,
                  ),
                  SizedBox(
                    height: size1 * 0.13,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(color: Colors.black, width: 0.095)),
                      onPressed: () {},
                      child: SizedBox(
                        child: Column(
                          children: [
                            const Icon(
                              Icons.thumb_up,
                              color: Colors.black,
                              size: 25,
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  '100',
                                  style: TextStyle(
                                      fontSize: 9, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
