import 'package:flutternews/Model/category_model.dart';

List<Category> getCategories() {
  List<Category> category = new List();

  Category cat1 = new Category("Egypt",
      "https://images.unsplash.com/photo-1503177119275-0aa32b3a9368?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80");
  Category cat2 = new Category("USA",
      "https://images.unsplash.com/photo-1485738422979-f5c462d49f74?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1075&q=80");
  Category cat3 = new Category("Technology",
      "https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80");
  Category cat4 = new Category("Sports",
      "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80");
  Category cat5 = new Category("Science",
      "https://images.unsplash.com/photo-1576086213369-97a306d36557?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80");

  category.add(cat1);
  category.add(cat2);
  category.add(cat3);
  category.add(cat4);
  category.add(cat5);
  return category;
}
