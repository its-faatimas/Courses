import 'package:amaliy_ish/categories/upload_page.dart';
import 'package:amaliy_ish/components/icons.dart';
import 'package:amaliy_ish/components/size_config.dart';
import 'package:amaliy_ish/video/video_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
                      padding:
                          EdgeInsets.symmetric(horizontal: 3, vertical: 24),
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
          _buildSliverToBoxAdapter(context),
          _buildSliverToBoxAdapter(context),
          _buildSliverToBoxAdapter(context),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildSliverToBoxAdapter(BuildContext context) {
    return SliverToBoxAdapter(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(16.0),
              vertical: getProportionateScreenHeight(9.5)),
          height: getProportionateScreenHeight(211),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0XFFF1F2F6)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16.0),
                    vertical: getProportionateScreenHeight(18.0)),
                margin: EdgeInsets.all(getProportionateScreenWidth(7.0)),
                height: getProportionateScreenHeight(132.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://source.unsplash.com/random/5'))),
                child: Container(
                  alignment: Alignment.center,
                  width: getProportionateScreenWidth(82.0),
                  height: getProportionateScreenHeight(35.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xffF1F2F6).withOpacity(0.35)),
                  child: Text("12 ta dars"),
                ),
              ),
              Text(
                "UX/UI dizayn",
              ),
              Text("Boshlang'ichlar uchun",
                  style:
                      TextStyle(fontSize: getProportionateScreenWidth(12.0))),
              Text(
                "🙂 97%",
                style: TextStyle(color: Color(0xff31B9CC)),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ListLessons()));
        },
      ),
    );
  }
}

class ListLessons extends StatefulWidget {
  const ListLessons({Key? key}) : super(key: key);

  @override
  _ListLessonsState createState() => _ListLessonsState();
}

class _ListLessonsState extends State<ListLessons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _showNote();
              },
              icon: SvgPicture.asset(IconName.message))
        ],
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "UI/UX darslari",
          maxLines: 2,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            height: 1.2,
          ),
        ),
      ),
      body: ListView.builder(itemBuilder: (BuildContext ctx, index) {
        return _listVideos();
      }),
    );
  }

  Widget _listVideos() {
    return Container(
      height: getProportionateScreenHeight(140.0),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(16.0),
          vertical: getProportionateScreenHeight(6)),
      decoration: BoxDecoration(
          color: Color(0xffF1F2F6), borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            child: Container(
              alignment: Alignment.center,
              width: getProportionateScreenWidth(37.0),
              height: getProportionateScreenHeight(22.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color(0xffF1F2F6).withOpacity(0.35)),
              child: Text("12:42",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(12.0),
                      fontWeight: FontWeight.w400)),
            ),
            height: getProportionateScreenHeight(140.0),
            width: getProportionateScreenHeight(140.0),
            padding: EdgeInsets.all(getProportionateScreenWidth(5.0)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://source.unsplash.com/random/3"),
                    fit: BoxFit.cover),
                color: Colors.green[200],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(12),
                  vertical: getProportionateScreenHeight(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "UX/UI nima? Soha haqida umumiy tushuncha.",
                    style: TextStyle(
                      fontSize: (14),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Teacher's name",
                    style: TextStyle(
                      fontSize: (12),
                      fontWeight: FontWeight.w400,
                      color: Color(0xff8F9698),
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "2 kun oldin yuklandi",
                        style: TextStyle(
                          fontSize: (12),
                          fontWeight: FontWeight.w500,
                          color: Color(0xff8F9698),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      IconButton(
                          constraints: BoxConstraints(),
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoPage()));
                          },
                          icon: SvgPicture.asset(IconName.playOffline))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showNote() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: SizedBox(
                  height: getProportionateScreenHeight(286),
                  width: getProportionateScreenWidth(295),
                  child: Column(
                    children: [
                      Text(
                        "Foydalanish bo`yicha qo`llanma!",
                        style: TextStyle(
                          fontSize: (16),
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      ListTile(
                        leading: SvgPicture.asset(IconName.download),
                        title: Text(
                          "Videoni dasturga yuklab olish uchun!",
                          style: TextStyle(
                            fontSize: (14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(IconName.playOffline),
                        title: Text(
                          "Videoni offlayn ko`rish uchun!",
                          style: TextStyle(
                            fontSize: (14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Videoni onlayn ko`rish uchun esa umumiy blok ustiga bosing!",
                          style: TextStyle(
                            fontSize: (14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                          ),
                        ),
                        leading: SvgPicture.asset(IconName.playVideo),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Tushunarli",
                          style: TextStyle(
                            fontSize: (16),
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff31B9CC),
                            fixedSize: Size(getProportionateScreenWidth(259),
                                getProportionateScreenHeight(41))),
                      ),
                    ],
                  )),
            ));
  }
}
