import 'package:first_app/UI/Screens/Answer_of_questions/answer.dart';
import 'package:flutter/material.dart';
import 'likeButton.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> listOfDomains = [
    '• Agriculture',
    '• Architecture and design',
    '• Arts',
    '• Engineering',
    '• Business and management',
    '• ICT (information technical communication)',
    '• Medicine',
    '• Medical science and health',
    '• Journalism',
    '• Education'
  ];
  List<bool> expandedStates = List<bool>.generate(10, (index) => false);
  List<Widget> containers = [];

  void addContainer() {
    setState(() {
      int index = containers.length; // Get the index of the new container

      expandedStates
          .add(false); // Add an initial expansion state for the new container

      containers.add(
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.only(
                  bottom: 10, left: 10, right: 10, top: 10),
              width: 920,
              height: expandedStates[index] ? 150 : 100,
              // Adjusted height based on expansion state
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xffE7E7F1),
              ),
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    expandedStates[index] = !expandedStates[index];
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/profile.png'),
                            radius: 30,
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "What is the Difference Between Class and Structure?",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 3),
                                Text("Emma Madison has asked this Question"),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 30,
                                width: 40,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Answer();
                                        },
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.message),
                                ),
                              ),
                              LikeButton(),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Flexible(
                        child: Icon(
                          expandedStates[index]
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                        ),
                      ),
                      if (expandedStates[
                          index]) // Conditionally display the text when container is expanded
                        const Flexible(
                          child: Text(
                            "This is the additional text when the container is opened.",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }

  void _showAddDialog(BuildContext context) {
    bool showRecommendationFields = false;
    String title = '';
    String typeOfQuestion = '';
    String selectedDomain = '';
    String tags = '';
    String description = '';
    String recommendedName = '';
    String recommendedEmail = '';
    String selectedReason = '';
    String? selected_item = null;
    List<String> items = [
      '• Agriculture',
      '• Architecture and design',
      '• Arts',
      '• Engineering',
      '• Business and management',
      '• ICT (information technical communication)',
      '• Medicine',
      '• Medical science and health',
      '• Journalism',
      '• Education'
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return AlertDialog(
                title: const Text('Ask a Question'),
                contentPadding: const EdgeInsets.all(20),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          title = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          typeOfQuestion = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Type of Question',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: DropdownButtonFormField(
                          isExpanded: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Choose your Domaine",
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  )))
                              .toList(),
                          value: selected_item,
                          hint: Text("Choose Your Domaine"),
                          onChanged: (item) => setState(() {
                                selected_item = item as String;
                              })),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          tags = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Tags',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          description = value;
                        });
                      },
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showRecommendationFields = !showRecommendationFields;
                        });
                      },
                      child: const Text(
                        'Do you want to recommend someone?',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    if (showRecommendationFields) ...[
                      const SizedBox(height: 16),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            recommendedName = value;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Recommended Name',
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            recommendedEmail = value;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Recommended Email',
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Reason of Recommendation'),
                      RadioListTile<String>(
                        title: const Text('Education'),
                        value: 'Education',
                        groupValue: selectedReason,
                        onChanged: (String? value) {
                          setState(() {
                            selectedReason = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Experience'),
                        value: 'Experience',
                        groupValue: selectedReason,
                        onChanged: (String? value) {
                          setState(() {
                            selectedReason = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Expertise'),
                        value: 'Expertise',
                        groupValue: selectedReason,
                        onChanged: (String? value) {
                          setState(() {
                            selectedReason = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Resolution Ability'),
                        value: 'Resolution Ability',
                        groupValue: selectedReason,
                        onChanged: (String? value) {
                          setState(() {
                            selectedReason = value!;
                          });
                        },
                      ),
                    ],
                  ],
                ),
                actions: [
                  OutlinedButton(
                    onPressed: () {
                      // Handle the save button press
                      // Perform any necessary actions with the form values
                      // For example, you can print them for now
                      print('Title: $title');
                      print('Type of Question: $typeOfQuestion');
                      print('Selected Domain: $selectedDomain');
                      print('Tags: $tags');
                      print('Description: $description');
                      print('Recommended Name: $recommendedName');
                      print('Recommended Email: $recommendedEmail');
                      print('Selected Reason: $selectedReason');

                      Navigator.of(context).pop(); // Close the dialog

                      // Add a new container to the list
                      addContainer();
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            expandedHeight: 80,
            flexibleSpace: Container(
              alignment: Alignment.center,
              child: Opacity(
                opacity: 1.0 - MediaQuery.of(context).padding.top / 20.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 50), // Adjust the width as needed
                    const Text(
                      'Welcome To Holoul\nPlease Feel Free To Ask',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(width: 40),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blueGrey,
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _showAddDialog(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index < containers.length) {
                  // Use the containers list to build the container widgets
                  return containers[index];
                } else {
                  return const SizedBox.shrink();
                }
              },
              childCount: containers.length,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Body(),
  ));
}
