import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'widgets/notification_banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<String>? students;

  @override
  void initState() {
    students = [
      "Levent",
      "Hakan",
      "Şule",
      "Murat",
      "Hande",
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (students == null)
          ? const Center(
              child: Text("İçerik bulunamadı"),
            )
          : SafeArea(
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
                  const NotificationBanner(),
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

  Widget listWidget(List<String> students) {
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

  Widget listItemWidget(String student) {
    return InkWell(
      splashColor: Colors.green,
      onTap: () {
        goToDetailPage();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(student),
      ),
    );
  }

  Widget gridItemWidget(String student) {
    return InkWell(
      splashColor: Colors.green,
      onTap: () {
        goToDetailPage();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(student),
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
