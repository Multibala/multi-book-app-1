

import 'package:flutter/material.dart';
import 'package:multi-book-app/model/creator.dart';
import 'package:multi-book-app/profileScreenWidget/appbar_widget.dart';
import 'package:multi-book-app/profileScreenWidget/button_widget.dart';
import 'package:multi-book-app/profileScreenWidget/numbers_widget.dart';
import 'package:multi-book-app/profileScreenWidget/profile_widget.dart';
import 'package:multi-book-app/utils/creator_preferences.dart';
import 'package:multi-book-app/profileScreenWidget/appbar_widget.dart';
import 'package:multi-book-app/profileScreenWidget/button_widget.dart';
import 'package:multi-book-app/profileScreenWidget/numbers_widget.dart';
import 'package:multi-book-app/profileScreenWidget/profile_widget.dart';

class creatorProfilePage extends StatefulWidget {
  @override
  _creatorProfilePageState createState() => _creatorProfilePageState();
}

class _creatorProfilePageState extends State<creatorProfilePage> {
  int _current_index = 4;
  @override
  Widget build(BuildContext context) {
    final creator = creatorPreferences.myCreator;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: creator.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(creator),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(creator),
        ],
      ),
       bottomNavigationBar: BottomNavigationBar(
       
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box, color: Colors.black),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet, color: Colors.black),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
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

  Widget buildName(Creator creator) => Column(
        children: [
          Text(
            creator.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            creator.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {},
      );

  Widget buildAbout(Creator creator) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              creator.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
