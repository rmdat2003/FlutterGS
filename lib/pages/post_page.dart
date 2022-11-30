import 'package:flutter/material.dart';

/// Post page to satisfy requirements:
///Second page “Post”:
/// This page has to have a form with a textformfield input and a button that add to a list the text entered in the input
/// All the text added to the list have to be displayed on the screen and handled by a scrollview
class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _formKey = GlobalKey<FormState>();

  // Holds list of posts entered
  List<String> posts = [];

  @override
  Widget build(BuildContext context) {
    List<Widget> postList = [];
    for (String postText in posts) {
      postList.add(
          Padding(padding: const EdgeInsets.all(8.0), child: Text(postText)));
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  setState(() {
                    // Add ebtered text into posts list and refresh state
                    posts.add(value);
                  });
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: const Text('Post'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
              child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  children: postList)),
        ),
      ]),
    );
  }
}
