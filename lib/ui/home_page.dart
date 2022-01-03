import 'package:flutter/material.dart';
import 'package:workshop_flutter_fest/models/student.dart';
import 'detail_page.dart';
import 'widgets/notification_banner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List? students;

  @override
  void initState() {
    getStudent();
    super.initState();
  }

  getStudent() async {
    Uri url = Uri.parse("https://randomuser.me/api/?results=30");
    var response = await http.get(url);
    // pay attention to status code
    var responseBody = jsonDecode(response.body);
    students = responseBody["results"].map((map) {
      return Student.fromJson(map);
    }).toList();
    print(responseBody["results"][0]);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (students == null)
          ? const Center(child: CircularProgressIndicator())
          : (students == null)
              ? const Center(
                  child: Text("İçerik bulunamadı"),
                )
              : SafeArea(
                  top: false,
                  child: CustomScrollView(
                    slivers: [
                      const SliverAppBar(
                        title: Text("Ana sayfa"),
                      ),
                      SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return gridItemWidget(students![index]);
                          },
                          childCount: students!.length,
                        ),
                      ),
                      const NotificationBanner("Kayıtlar başladı"),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return listItemWidget(students![index]);
                          },
                          childCount: students!.length,
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }

  Widget listWidget(List<Student> students) {
    return ListView.separated(
      itemCount: students.length,
      separatorBuilder: (context, index) {
        return const SizedBox();
      },
      itemBuilder: (context, index) {
        return listItemWidget(students[index]);
      },
    );
  }

  Widget listItemWidget(Student student) {
    return InkWell(
      splashColor: Colors.green,
      onTap: () {
        goToDetailPage();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(student.name),
      ),
    );
  }

  Widget gridItemWidget(Student student) {
    return InkWell(
      splashColor: Colors.green,
      onTap: () {
        goToDetailPage();
      },
      child: GridTile(
        child: Image.network(
          student.imageUrl,
          fit: BoxFit.cover,
        ),
        footer: Container(
          color: Colors.white.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(student.name),
          ),
        ),
      ),
    );
  }

  void goToDetailPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return const DetailPage();
      }),
    ).then((value) {
      //print("Dönüş yapıldı");
    });
    //print("Düğmeye  basıldı");
  }
}
