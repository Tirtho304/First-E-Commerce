import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/Pages/Data.dart';
import 'package:project1/Pages/Gridview.dart';
import 'package:project1/Pages/productWidget.dart';
//import 'package:project1/Pages/productWidget.dart';
import 'package:project1/widgets/drawer.dart';

import 'Gridview.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  List<Products> newList = [];
  bool ChangeiconButton = false;
  //List<Products> newList2 = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("image/Fiel/Catalog.json");
    print(catalogJson);
    final deCodedata = jsonDecode(catalogJson);

    final list = Mydata.fromJson(deCodedata);
    print(deCodedata);
    // print(list.products!.length!);

    setState(() {
      newList = list.products!;
    });
    //print(newList);

    //  print(productData);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Cart Place",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.deepPurple,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    ChangeiconButton = true;
                  });
                },
                icon: Icon(Icons.important_devices_rounded))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          // ignore: unnecessary_null_comparison
          child: ChangeiconButton
              // ignore: unnecessary_null_comparison
              ? (newList.isNotEmpty && newList != null)
                  ? GridView.builder(
                      itemCount: newList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return gridview(
                          product: newList[index],
                        );
                      },
                      // ignore: unnecessary_null_comparison
                    )
                  // ignore: unnecessary_null_comparison

                  : Center(
                      child: CircularProgressIndicator(),
                    )
              // ignore: unnecessary_null_comparison
              : (newList.isNotEmpty && newList != null)
                  ? ListView.builder(
                      itemCount: newList.length,
                      itemBuilder: (context, index) {
                        return ProductWidget(
                          product: newList[index],
                        );
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
        ),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              ChangeiconButton = false;
            });
          },
          child: Icon(Icons.remove_red_eye_rounded),
        ),
      ),
    ));
  }
}
