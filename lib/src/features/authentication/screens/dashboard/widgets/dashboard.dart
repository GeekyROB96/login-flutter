import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter_app/src/constants/color.dart';
import 'package:login_flutter_app/src/constants/image_strings.dart';
import 'package:login_flutter_app/src/constants/text_strings.dart';
import 'package:login_flutter_app/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:login_flutter_app/src/localization/repository/authentication_repository/authentication_repository.dart';

class Dash_Board extends StatelessWidget {
  const Dash_Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    List<Map<String, String>> cardData = [
      {"title": "JS", "course": "JavaScript", "lessons": "12 Lessons"},
      {"title": "FL", "course": "Flutter", "lessons": "10 Lessons"},
      {"title": "RT", "course": "React Native", "lessons": "15 Lessons"},
      {"title": "PY", "course": "Python", "lessons": "12 Lessons"},
      {
        "title": "AI",
        "course": "Artificial Intelligence",
        "lessons": "22 Lessons"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text(
          tAppName,
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: tCardBgColor),
            child: IconButton(
              onPressed: () {
               Get.to(const  ProfileScreen());
                // AuthenticationRepository1.instance.logout();
              },
              icon: const Image(image: AssetImage(tUserProfileImage)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Hey, Welcome Rohit",
                style: textTheme.bodyText2,
              ),
              Text(
                "Explore Courses",
                style: textTheme.headline4,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(left: BorderSide(width: 4))),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Search",
                      style: textTheme.headline2
                          ?.apply(color: Colors.grey.withOpacity(0.5)),
                    ),
                    const Icon(
                      Icons.mic,
                      size: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: cardData.map((card) {
                    return SizedBox(
                      width: 170,
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                card["title"]!,
                                style: textTheme.headline6?.apply(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 99,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  card["course"]!,
                                  style: textTheme.headline6,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  card["lessons"]!,
                                  style: textTheme.bodyText1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.5, // Adjust the width as needed
                      height: 140,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.fromLTRB(8, 10, 5, 6),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.bookmark,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Image(image: AssetImage(tTopCourseImage2))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Android for Beginners",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.apply(color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              //softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width *
                        0.5, // Adjust the width as needed
                    height: 140,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.fromLTRB(12, 10, 5, 6),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(
                                Icons.bookmark,
                                size: 20,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image(image: AssetImage(tBannerImage1))
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "JAVA",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.apply(color: Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "10 Lessons",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.apply(color: Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                OutlinedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "View All",
                                      style: textTheme.bodySmall
                                          ?.apply(color: Colors.black),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Add another SizedBox or other widgets here if needed
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(

                  children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Top Courses",
                    style: textTheme.headline5
                        ?.apply(color: Colors.black, fontWeightDelta: 2),
                  ),
                ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 170,
                      child: ListView(
                        scrollDirection: Axis.horizontal,

                        children: [
                          Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(13,)

                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Flutter Crash Course",
                                        style: textTheme.titleSmall?.apply(
                                            color: Colors.black,
                                            fontWeightDelta: 2
                                        ),),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Image(image: AssetImage(tStudentImage),
                                        width: 40,)

                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 18,
                                      ),
                                      Column(
                                        children: [
                                          Text("2 Sections",
                                            style: textTheme.headlineSmall?.apply(
                                                fontWeightDelta: 2
                                            ),),
                                          Text("Framework Course",
                                            style: textTheme.bodyLarge,)
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(13,)

                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Angular Crash Course",
                                        style: textTheme.titleSmall?.apply(
                                            color: Colors.black,
                                            fontWeightDelta: 2
                                        ),),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Image(image: AssetImage(tStudentImage2),
                                        width: 40,)

                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 18,
                                      ),
                                      Column(
                                        children: [
                                          Text("3 Sections",
                                            style: textTheme.headlineSmall?.apply(
                                                fontWeightDelta: 2
                                            ),),
                                          Text("Web Dev Course",
                                            style: textTheme.bodyLarge,)
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                          ),
                        ],
                      )
                    )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
