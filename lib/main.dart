import 'package:amaliy_ish/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Qanday darslar Sizni qiziqtiradi?",
          maxLines: 2,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            height: 1.2,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(16.0),
                      bottom: getProportionateScreenHeight(22.0),
                      top: getProportionateScreenHeight(5.0)),
                  child: Text(
                    "28 xil yo'nalishda darsliklar mavjud",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                      height: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: "Izlash",
                      focusColor: Colors.transparent,
                      enabled: false,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(145),
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 24),
                      scrollDirection: Axis.horizontal,
                      itemCount: 28,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(13.0),
                              ),
                              width: getProportionateScreenWidth(72),
                              height: getProportionateScreenHeight(72),
                              child: Card(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "Dasturlash",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            )
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
