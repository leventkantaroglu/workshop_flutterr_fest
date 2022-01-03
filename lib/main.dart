import 'package:flutter/material.dart';

import 'detail_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

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
                    expandedHeight: 200,
                    pinned: true,
                    title: Text("Ana sayfa"),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return listItemWidget(students![index]);
                      },
                      childCount: students!.length,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 100,
                      color: Colors.green,
                      child: const Center(
                        child: Text("Kayıtlar başladı"),
                      ),
                    ),
                  ),
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return listItemWidget(students![index]);
                      },
                      childCount: students!.length,
                    ),
                  ),
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return listItemWidget(students![index]);
                      },
                      childCount: students!.length,
                    ),
                  ),
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return listItemWidget(students![index]);
                      },
                      childCount: students!.length,
                    ),
                  )
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

  void goToDetailPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return const DetailPage();
      }),
    ).then((value) {
      print("Dönüş yapıldı");
    });
    print("Düğmeye  basıldı");
  }
}
