import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutternews/Model/article_model.dart';

class ApiHandler {
  final String main_api =
      "http://newsapi.org/v2/top-headlines?category=general&apiKey=cd0f9880204445f9a92a994e45b2c2b8";

  List<Article> articles_list = new List();
// to get general Articles in Home page
  Future<void> getArticles() async {
    http.Response response = await http.get(main_api);

    if (response.statusCode == 200) {// there is response
      var body = json.decode(response.body);

      if (body["status"] == "ok") {
        print("status is ok");


        body["articles"].forEach((item) {
          if (item["urlToImage"] != null) {
            Article article = new Article(
                author: item['author'],
                title: item["title"],
                description: item["description"],
                url: item["url"],
                urlToImage: item["urlToImage"],
                publishedAt: item["publishedAt"],
                content: item["content"]);
            articles_list.add(article);
          }
        });
      }
    } else {
      throw "we can't get articles";
    }
  }

// to get Articles in Categories
  Future<void> getArticles_Categorries(String cat_name) async {
    String categories_api;
    if (cat_name == "Egypt") {
      categories_api =
          "http://newsapi.org/v2/top-headlines?country=eg&category=general&apiKey=cd0f9880204445f9a92a994e45b2c2b8";
    } else if (cat_name == "USA") {
      categories_api =
          "http://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=cd0f9880204445f9a92a994e45b2c2b8";
    } else {
      categories_api =
          "http://newsapi.org/v2/top-headlines?category=$cat_name&apiKey=cd0f9880204445f9a92a994e45b2c2b8";
    }
    http.Response response = await http.get(categories_api);

    if (response.statusCode == 200) { // there is response
      var body = json.decode(response.body);

      if (body["status"] == "ok") {
        print("status is ok");

        body["articles"].forEach((item) {
          if (item["urlToImage"] != null) {

            Article article = new Article(
                author: item['author'],
                title: item["title"],
                description: item["description"],
                url: item["url"],
                urlToImage: item["urlToImage"],
                publishedAt: item["publishedAt"],
                content: item["content"]);

            articles_list.add(article);
          }
        });
      }
    } else {
      throw "we can't get articles";
    }
  }
}
