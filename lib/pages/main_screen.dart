import 'package:flutter/material.dart';
import 'package:multi-book-app/model/constants.dart';
import 'package:multi-book-app/model/posts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _current_index = 0;
  List<bool> selected_category = [false, false, false];
  List<Post> posts = [
    Post(
      author: "Zero two",
      description:
          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. ",
      book: const Image(
        image: NetworkImage(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
        width: 80,
      ),
      nameBook: "Harry Potter",
    ),
  ];
  var top_rating = [];
  var mostly_readed = [];
  var new_post = [];

  @override
  void initState() {
    super.initState();
    // something update
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors_selected = [Colors.white, Colors.white, Colors.white];
    return Scaffold(
      body: ListView(children: [
        Container(
          height: 150,
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        (selected_category[0]) ? greenColor : Colors.white)),
                onPressed: () {
                  setState(() {
                    if (selected_category[0]) {
                      selected_category[0] = false;
                    } else {
                      selected_category[0] = true;
                    }
                  });
                },
                child: Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: Text(
                    'Video',
                    style: TextStyle(
                        color: (selected_category[0])
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
              OutlinedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        (selected_category[1]) ? greenColor : Colors.white)),
                onPressed: () {
                  setState(() {
                    if (selected_category[1]) {
                      selected_category[1] = false;
                    } else {
                      selected_category[1] = true;
                    }
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: 100,
                  child: Text(
                    'Audio',
                    style: TextStyle(
                        color: (selected_category[1])
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
              OutlinedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        (selected_category[2]) ? greenColor : Colors.white)),
                onPressed: () {
                  setState(() {
                    if (selected_category[2]) {
                      selected_category[2] = false;
                    } else {
                      selected_category[2] = true;
                    }
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: Text(
                    'Comics',
                    style: TextStyle(
                        color: (selected_category[2])
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: const Divider(
            thickness: 1.5,
            color: greenColor,
            endIndent: 25,
            indent: 25,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          height: 50,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.20,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: OutlinedButton(
                  onPressed: () {
                    _showSelectedByCategory('NEW');
                  },
                  child: const Text(
                    'NEW',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: greenColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.20,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: OutlinedButton(
                  onPressed: () {
                    _showSelectedByCategory('TOP');
                  },
                  child: const Text(
                    'TOP rating',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: greenColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.20,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: OutlinedButton(
                  onPressed: () {
                    _showSelectedByCategory('Mostly readed');
                  },
                  child: const Text(
                    'Mostly readed',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: greenColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              )
            ],
          ),
        ),
        StreamBuilder( 
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            return Column(
              children: [
                postTemplate(posts[0]),
                postTemplate(posts[0]),
                postTemplate(posts[0]),
                postTemplate(posts[0]),
                postTemplate(posts[0]),
              ],
            );
          }
        }),
        
      ]),

      //
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: greenColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: greenColor),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box, color: greenColor),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet, color: greenColor),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: greenColor),
            label: 'Profile',
          ),
        ],
        currentIndex: _current_index,
        onTap: _navigater,
      ),
    );
  }

  void _navigater(int i) {
    const routes = ['/', '/search', '/create', '/wallet', '/profile'];
    setState(() {
      _current_index = i;
    });

    Navigator.popAndPushNamed(context, routes[i]);
  }

  Widget postTemplate(Post post) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Column(children: [
                post.book,
                Text(
                  post.nameBook,
                  style: const TextStyle(color: Colors.black),
                )
              ])),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.5,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  post.author,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  post.description,
                  softWrap: true,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('SHOW'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(greenColor)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showSelectedByCategory(String value) {
    setState(() {
      if (value == 'NEW') {
        posts = [
          Post(
              author: "RAM",
              description: "Something",
              book: const Image(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                width: 80,
              ),
              nameBook: "Lalisa")
        ];
      }
      if (value == 'TOP') {
        posts = [
          Post(
              author: "Nezuko",
              description: "Something",
              book: const Image(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                width: 80,
              ),
              nameBook: "IU")
        ];
      }
      if (value == 'Mostly readed') {
        posts = [
          Post(
              author: "Naruto",
              description: "Something",
              book: const Image(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                width: 80,
              ),
              nameBook: "Sasuke")
        ];
      }
    });
  }
}
