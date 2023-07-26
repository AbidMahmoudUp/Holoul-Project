import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "The Question of Emma Madison",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            width: 950,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffE7E7F1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: Color(0xFFCECECE),
                    height: 15,
                  ),
                  Text(
                    "What is the Difference Between Class and Structure?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "In my Internship, my coach asked this question when I told him that they are the same he refused me, can I know the difference please?",
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFD9D9D9),
                        ),
                        icon: Icon(
                          Icons.message,
                          size: 15,
                          color: Colors.black,
                        ),
                        label: Text(
                          '10 Answers',
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFD9D9D9),
                        ),
                        icon: Icon(
                          Icons.remove_red_eye,
                          size: 16,
                          color: Colors.black,
                        ),
                        label: Text(
                          '14 Views',
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Divider(
                    color: Color(0xFFCECECE),
                    height: 5,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                        radius: 20,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 43,
                          margin: EdgeInsets.only(top: 5),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter your answer...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Color(0xFFCECECE),
                    height: 30,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/profile.png'),
                                radius: 30,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.17,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "A structure is a collection of variables of different data types with the same name. A class in C++ is a single structure that contains a collection of related variables and functions. Read More...",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.thumb_up,
                                      size: 25,
                                    ),
                                  ),
                                  Text('10'),
                                  SizedBox(
                                    height: 10,
                                    width: 30,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.save,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            color: Color(0xFFCECECE),
                            height: 30,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
