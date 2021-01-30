import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_list/data/models/category.model.dart';
import 'package:flutter_firebase_list/data/repositories/category.repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream<List<CategoryModel>> _categoryList;
  CategoryRepository _categoryRepository;

  @override
  void initState() {
    _categoryRepository = new CategoryRepository();
    _categoryList = _categoryRepository.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category List'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: StreamBuilder<List<CategoryModel>>(
          stream: _categoryList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              var datCount = snapshot.data.length;
              return ListView.builder(
                itemCount: snapshot.data.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      child: OutlineButton(
                        onPressed: () {},
                        child: Text(datCount.toString(),style: TextStyle(fontSize: 28),),
                      ),
                    );
                  }
                  return ListTile(
                    title: Text(snapshot.data[index-1].name),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
