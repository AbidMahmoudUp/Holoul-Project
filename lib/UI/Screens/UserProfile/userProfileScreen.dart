import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildNumberWidget extends StatelessWidget {
  const BuildNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BuildButton(text: 'data', value: 29),
        BuildDivider(),
        BuildButton(text: 'data', value: 598),
        BuildDivider(),
        BuildButton(text: 'data', value: 5478),
      ],
    );
  }
}

Widget BuildDivider() {
  return Container(
    height: 24,
    child: VerticalDivider(),
  );
}

Widget BuildButton({required String text, required int value}) {
  return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 4),
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '$value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(height: 2),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          )
        ],
      ));
}

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfileScreen> {
  final double CoverHeight = 280;
  final double profileHeight = 144;
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 30)),
    Text('Search Page', style: TextStyle(fontSize: 30)),
    Text('Profile Page', style: TextStyle(fontSize: 30)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0.8),
        children: [buildTop(), buildContent()],
      ),
    );
  }

  Widget buildTop() {
    final top = CoverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: bottom),
            child: buildCoverImage(),
          ),
          Positioned(
              top:
                  top, //the position between the background cover and the proile
              child: buildProfileImage())
        ]);
  }

  Widget buildProfileImage() {
    return CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: Colors.blueGrey,
      backgroundImage: const AssetImage("assets/images/profile.png"),
      child: Container(
        margin: const EdgeInsets.only(left: 60),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Icon(
                  Icons.camera_alt,
                  color: Colors.grey,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCoverImage() {
    return Container(
      color: Colors.blueGrey,
      child: Image.asset("assets/images/cover.jpg",
          width: MediaQuery.of(context).size.width,
          height: CoverHeight,
          fit: BoxFit.cover),
    );
  }

  Widget BuildaboutInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child:
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'About',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla',
          style: TextStyle(fontSize: 18, height: 1.4),
        ),
      ]),
    );
  }

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        radius: 25,
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Center(
              child: FaIcon(icon,
                  size: 32), // Use FaIcon from font_awesome_flutter package
            ),
          ),
        ),
      );

  Widget buildContent() {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        const Text(
          "The UserName",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          "SurgeryDoctor",
          style: TextStyle(fontSize: 20, color: Colors.black45),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSocialIcon(FontAwesomeIcons.slack),
            const SizedBox(width: 12),
            buildSocialIcon(FontAwesomeIcons.github),
            const SizedBox(width: 12),
            buildSocialIcon(FontAwesomeIcons.twitter),
            const SizedBox(width: 12),
            buildSocialIcon(FontAwesomeIcons.linkedin),
            const SizedBox(width: 12),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(),
        const SizedBox(
          height: 16,
        ),
        const BuildNumberWidget(),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
        BuildaboutInfo(),
        const SizedBox(height: 32),
      ],
    );
  }
}
