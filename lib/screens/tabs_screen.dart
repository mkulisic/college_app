import 'package:college_app/providers/major.dart';
import 'package:college_app/screens/major_grid_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/major_detail.dart';
import '../screens/details_screen.dart';
import '../providers/major_provider.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  BottomNavigationBarItem _createBottomNavigationBar(
      Icon barIcon, String title) {
    return BottomNavigationBarItem(
        backgroundColor: Theme.of(context).primaryColor,
        icon: barIcon,
        title: Text(title));
  }

  @override
  Widget build(BuildContext context) {
    MajorProvider provider = Provider.of<MajorProvider>(context);
    String currentId = provider.fetchCurrentId();

    _pages = [
      {
        //main page
        'page': MajorDetailPage(provider.fetchMajorById(currentId), false),
        'title': 'New College'
      },
      {
        //liked
        'page': MajorGridList(provider.likedMajors),
        'title': 'Liked Pages'
      },
      {
        //maybe
        'page': MajorGridList(provider.maybeMajors),
        'title': 'Maybe Pages'
      },
      {
        //disliked
        'page': MajorGridList(provider.dislikedMajors),
        'title': 'Disliked Pages'
      },
      {
        'page': DetailsScreen(),
        'title': "Detail Screen",
      }

      //Likes Page
      //Maybe Page
      //Dislike Page
      //About page
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          _createBottomNavigationBar(Icon(Icons.account_balance), 'Major'),
          _createBottomNavigationBar(Icon(Icons.thumb_up), "Likes"),
          _createBottomNavigationBar(Icon(Icons.thumbs_up_down), "Maybe"),
          _createBottomNavigationBar(Icon(Icons.thumb_down), "Dislike"),
          _createBottomNavigationBar(Icon(Icons.account_circle), "About"),
        ],
      ),
    );
  }
}
