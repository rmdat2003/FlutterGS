import 'package:flutter/material.dart';

import '../model/user.dart';

/// Profile page to satisfy requirements:
///Third page "Profile":
/// You have to design a profile page with custom image and informations
/// It has to contains an image, first name, last name, age and a basic info of your choice
class ProfilePage extends StatefulWidget {
  // User profile data
  final User user;
  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Create clipped oval image from [imageUrl]
  Widget buildImage(imageUrl) {
    final image = NetworkImage(imageUrl);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          //child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  // Create user profile row
  Widget buildProfileRow(String label, String value) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      Padding(
        padding: EdgeInsets.only(right: 5),
      ),
      Text(value)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(children: [
            buildImage(widget.user.imageURL),
            buildProfileRow("First Name", widget.user.firstName),
            buildProfileRow("Last Name", widget.user.lastName),
            buildProfileRow("Age", widget.user.age.toString()),
            buildProfileRow("Email Address", widget.user.email)
          ]),
        ),
      )),
    );
  }
}
