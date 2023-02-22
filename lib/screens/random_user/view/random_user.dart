import 'package:demo39/screens/random_user/controller/random_user_controller.dart';
import 'package:demo39/screens/random_user/modal/random_user_modal.dart';
import 'package:demo39/screens/utility/apis/api_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RandomUser extends StatefulWidget {
  const RandomUser({super.key});

  @override
  State<RandomUser> createState() => _RandomUserState();
}

class _RandomUserState extends State<RandomUser> {
  RandomUserController randomUserController = Get.put(RandomUserController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar:
              AppBar(title: Text("Random Users"), centerTitle: true, actions: [
            IconButton(
              onPressed: () async {
                randomUserController.ref(await ApiCall().getData());
                // print(l1![index].email)
                // randomUserController.ref(
                //   await ApiCall().getData(),
                // );
              },
              icon: Icon(Icons.refresh),
            )
          ]),
          body: FutureBuilder<RandomModal?>(
            future: ApiCall().getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Not Found");
              } else if (snapshot.hasData) {
                List<Results>? l1 = snapshot.data!.results;
                randomUserController.ref(snapshot.data!);
                l1 = randomUserController.user!.isEmpty
                    ? l1
                    : randomUserController.user;
                // randomUserController.ref(snapshot.data);

                return Obx(() => ListView.builder(
                      itemCount: randomUserController.user!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(
                                        "${l1![index].picture!.medium}"),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Email Id :-  ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              "${l1[index].email}",
                                              style: TextStyle(
                                                  color: Colors.yellow),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Phone Number :- ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "${l1[index].phone}",
                                            style:
                                                TextStyle(color: Colors.yellow),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.white,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "City :- ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "${l1[index].location!.city}",
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "State :- ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "${l1[index].location!.state}",
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Country :- ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "${l1[index].location!.country}",
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.white,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Username :- ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "${l1[index].login!.username}",
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Salt :- ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "${l1[index].login!.salt}",
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Uuid :- ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "${l1[index].login!.uuid}",
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.white,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Gender :- ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "${l1[index].gender}",
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Name :- ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "${l1[index].name!.title} ${l1[index].name!.first}",
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Last Name :- ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "${l1[index].name!.last}",
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );

                        // Container();

                        // Text("${l1![index].email}");
                        // // Text(
                        //     "${randomUserController.randomModal!.results![0].email}");
                      },
                    ));

                // Container(
                //   child: Column(
                //     children: [
                //       Text("${l1![0].email}"),
                //       // CircleAvatar(
                //       //   radius: 50,
                //       //   backgroundImage: NetworkImage("${l1![0].picture!.large}"),
                //       // )
                //     ],
                //   ),
                // );
              } else {
                return CircularProgressIndicator();
              }
            },
          )

          //  Column(
          //   children: [],
          // ),
          ),
    );
  }
}
