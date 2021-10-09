
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/Model/article_model.dart';
import 'package:flutternews/Networking/api_handler.dart';

import 'home.dart';

class CategoryNews extends StatefulWidget{
  String category_name;

  CategoryNews(this.category_name);

  @override
  State<StatefulWidget> createState() {
    return CategoryNewsState(this.category_name);

  }

}

class CategoryNewsState extends State<CategoryNews>{
  String category_name;

  CategoryNewsState(this.category_name);

  List<Article> articles = List();
  bool _Loading = true;

  @override
  void initState() {
    getCategoryArticles();
  }

  getCategoryArticles() async {
    ApiHandler apiHandler = ApiHandler();
    await apiHandler.getArticles_Categorries(category_name);
    articles = apiHandler.articles_list.toList();

    setState(() {
      _Loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // adding back button
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios ,
            color: Colors.black45,
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pingy",
              style: TextStyle(color: Colors.black, fontSize: 27.0),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontSize: 27.0),
            ),
          ],
        ),
        actions: [
          Container(width: 45.0,)
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: _Loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),),)
          :Container(
          padding: EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          children: [
            Expanded(

              child: Container(
                margin: EdgeInsets.only(bottom: 5.0),
                padding: EdgeInsets.only(top: 14.0),
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 10.0),
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return BlogTile(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        description: articles[index].description,
                        url: articles[index].url,
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );

  }

}