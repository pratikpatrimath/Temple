import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class TempleHistoryScreen extends StatefulWidget {
  @override
  _TempleHistoryScreenState createState() => _TempleHistoryScreenState();
}

class _TempleHistoryScreenState extends State<TempleHistoryScreen> {
  final List<Map<String, dynamic>> events = [
    {
      'title': 'Birthplace of Rama',
      'description':
          'Hindus believe the site in Ayodhya is the birthplace of Lord Rama, an avatar of Vishnu.',
      'image': 'assets/download.jpeg',
    },
    {
      'title': '1528',
      'description':
          'Mughal ruler Babur built a mosque, Babri Masjid, on the site in the 16th century.',
      'image': 'assets/bab.jpeg',
    },
    {
      'title': '1853',
      'description':
          'Hindus and Muslims contested ownership for centuries, leading to tensions.',
      'image': 'assets/dispute.jpeg',
    },
    {
      'title': '1885',
      'description':
          'The matter reached the court for the first time. Mahant Raghuvardas filed an appeal in the Faizabad court for permission to build the Ram temple adjacent to the Babri Masjid.',
      'image': 'assets/dispute2.jpeg',
    },
    {
      'title': '1949',
      'description':
          'The idol of Ram Lalla appeared under the central dome outside the disputed structure. After this people started worshiping at that place',
      'image': 'assets/idoltent.jpeg',
    },
    {
      'title': '1950',
      'description':
          'Gopal Singh Visharad had filed a case in Faizabad court demanding the right to worship. After this case, Hindus got the right to worship in the temple.',
      'image': 'assets/supremecourt.jpeg',
    },
    {
      'title': '1992',
      'description':
          'December 6, 1992: The disputed structure was demolished. After this the movement for Ram temple gained more momentum.',
      'image': 'assets/babridemo.jpeg',
    },
    {
      'title': '2019',
      'description':
          'Supreme Court rules in favor of Hindus, awarding the disputed land for a Ram Mandir.',
      'image': 'assets/lawyers.jpeg',
    },
    {
      'title': '2020',
      'description':
          'Revised temple design finalized based on Hindu scriptures and architecture principles.',
      'image': 'assets/templede.jpeg',
    },
    {
      'title': '2020',
      'description': 'Groundbreaking ceremony for the Ram Mandir construction.',
      'image': 'assets/ground.jpg',
    },
    {
      'title': '2020',
      'description': 'Ram Mandir construction started.',
      'image': 'assets/ramcons.jpeg',
    },
    {
      'title': '2024',
      'description':
          'Ram Mandir construction completed.Ram pratistha and temple opening ceremony.',
      'image': 'assets/ramlalla.jpeg',
    },
  ];

  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    List<TimelineModel> items =
        List<TimelineModel>.generate(events.length, (index) {
      return TimelineModel(
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedItem = index;
            });
          },
          child: AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: _selectedItem == index ? 1.0 : 0.5,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(events[index]['image']),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    events[index]['title'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Center(
                    child: Text(
                      events[index]['description'],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        position: index % 2 == 0
            ? TimelineItemPosition.right
            : TimelineItemPosition.left,
        iconBackground: Colors.redAccent,
        // icon: Icon(Icons.history),
      );
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text('Ram Mandir History'),
          centerTitle: false,
        ),
        body: Timeline(children: items, position: TimelinePosition.Center));
  }
}
