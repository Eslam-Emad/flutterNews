import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/Model/article_model.dart';
import 'package:flutternews/Model/category_model.dart';
import 'package:flutternews/Networking/api_handler.dart';
import 'package:flutternews/Networking/cateogries_data.dart';
import 'package:flutternews/Views/article_news.dart';
import 'package:flutternews/Views/category_news.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<Category> categories = new List<Category>();
  List<Article> articles = new List<Article>();
  bool _Loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getArticles();
  }

  getArticles() async {
    ApiHandler apiHandler = ApiHandler();
    await apiHandler.getArticles();
    articles = apiHandler.articles_list.toList();

    setState(() {
      _Loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: _Loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                children: [
                  Container(
                    // Category
                    child: Container(
                      height: 60,
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imageUrl: categories[index].imgurl,
                              categoryName: categories[index].categoryname,
                            );
                          }),
                    ),
                  ),

                  // Articles
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

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;

  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Category clicked");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoryNews(categoryName.toString())));
      },
      child: Container(
        margin: EdgeInsets.only(right: 13),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black26),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, description, url;

  BlogTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.description,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ArticleNews(url)));
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                imageUrl,
                width: 500,
                height: 210,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace stackTrace) {
                  return new Icon(Icons.error);
                },
              ),
            ),
            SizedBox(height: 9),
            Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Text(description,
                style: TextStyle(fontSize: 14, color: Colors.black26))
          ],
        ),
      ),
    );
  }
}
