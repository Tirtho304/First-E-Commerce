//import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:project1/Pages/Data.dart';
import 'package:project1/widgets/drawer.dart';

import 'Gridview.dart';

class PageGrid extends StatefulWidget {
  const PageGrid({Key? key}) : super(key: key);

  @override
  _PageGridState createState() => _PageGridState();
}

class _PageGridState extends State<PageGrid> {
  List<Products> newList = [];
  @override
  void initState() {
    super.initState();

    // ignore: unused_element
    loadData() {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text(
            "CartPage",
            style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          // ignore: unnecessary_null_comparison
          child: (newList.isNotEmpty && newList != null)
              ? GridView.builder(
                  itemCount: newList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return gridview(
                      product: newList[index],
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        drawer: MyDrawer(),
      )),
    );
  }
}
