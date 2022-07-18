import 'package:flutter/material.dart';
import 'package:http_error_handling_1/controller/album_controller.dart';
import 'package:http_error_handling_1/controller/user_controller.dart';
import 'package:http_error_handling_1/models/album.dart';
import 'package:http_error_handling_1/repository/jsonplaceholde_repository.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    var controller = AlbumController(JsonplaceholderRepository());
    // use UserController by Provider
    var userController = Provider.of<UserController>(context);
    final userId = ModalRoute.of(context)!.settings.arguments as int;
    var userName = userController.getUserNameById(userId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$userName',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder<List<Album>>(
        future: controller.fetchAlbum(userId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(40.0),
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.orange[100],
                ),
                child: Text(
                  '${snapshot.error.toString()}',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var albums = snapshot.data!;
          return GridView.builder(
            itemCount: albums.length,
            padding: const EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 1.0,
            ),
            itemBuilder: (context, index) {
              return Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://picsum.photos/id/${albums[index].id}/200/300',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
