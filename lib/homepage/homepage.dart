import 'package:dhiahydroponics/services/firestore.dart';
import 'package:dhiahydroponics/services/models.dart';
import 'package:dhiahydroponics/shared/shared.dart';
import 'package:dhiahydroponics/topics/topic_item.dart';
import 'package:flutter/material.dart';
import 'package:dhiahydroponics/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      //   title: Text('Home'),
      // ),
      // body: Container(
      //     //margin: const EdgeInsets.all(10.0),
      //     color: Colors.green,
      //     width: MediaQuery.of(context).size.width,
      //     height: 250,
      //   )
      body: ContainerWithTextAndCard()

,
      
    );
}
}

class ContainerWithTextAndCard extends StatelessWidget {
  const ContainerWithTextAndCard({super.key});

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      future: FirestoreService().getTopics(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return Center(
            child: ErrorMessage(message: snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          var topics = snapshot.data!;
          final Random random = Random();
          int randomIndex = random.nextInt(topics.length);
          // Get the random topic
          
          Topic topic = topics[randomIndex];
          Topic topictwo = topics[randomIndex-1];

          return Scaffold(
            body: Container(
                  
            padding: const EdgeInsets.only(
              top: 75.0, // Add top margin by adjusting the top value
              left: 32.0,
              right: 16.0
            ),
            color: Colors.green, // Set the background color of the Container,
            width: MediaQuery.of(context).size.width,
            height: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    Text(
                      'Ready to Learn Today?',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Recomended Topic to Learn',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 165,
                      height: 150,
                      child: Hero(
                        tag: topic.img,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) => TopicScreen(topic: topic),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  child: SizedBox(
                                    child: Image.asset(
                                      'assets/covers/${topic.img}',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10),
                                    child: Text(
                                      topic.title,
                                      style: const TextStyle(
                                        height: 1.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                                Container(child: TopicProgress(topic: topic)),
                              ],
                            ),
                          ),
                        ),
                      )
                    ),
                    Container(
                      width: 165,
                      height: 150,
                      child: Hero(
                        tag: topic.img,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) => TopicScreen(topic: topic),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  child: SizedBox(
                                    child: Image.asset(
                                      'assets/covers/${topictwo.img}',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10),
                                    child: Text(
                                      topictwo.title,
                                      style: const TextStyle(
                                        height: 1.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                                Container(child: TopicProgress(topic: topictwo)),
                              ],
                            ),
                          ),
                        ),
                      )
                    ),
                  ],
                ),
                
              ],
            ),
                  ),
          );
        } else {
          return const Text('No topics found in Firestore. Check database');
        }
      }
    );
  }
}


