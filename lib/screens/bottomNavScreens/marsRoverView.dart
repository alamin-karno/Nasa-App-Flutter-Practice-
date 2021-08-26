import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/mars_rover_image.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_app/screens/loading.dart';

import '../../api_key.dart';

class MarsRoverView extends StatefulWidget {
  @override
  _MarsRoverViewState createState() => _MarsRoverViewState();
}

class _MarsRoverViewState extends State<MarsRoverView> {
  Future<MarsRoverImage> marsImages;

  Future<MarsRoverImage> fetchData() async {
    final response = await http.get(Uri.parse(MARS_ROVER_IMAGE + API_KEY));
    return MarsRoverImage.fromJson(jsonDecode(response.body));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    marsImages = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text('Mars Photos'),
          centerTitle: true,
          backgroundColor: Colors.grey[800],
        ),
        body: FutureBuilder<MarsRoverImage>(
          future: marsImages,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              MarsRoverImage images = snapshot.data;

              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListView.builder(
                    itemCount: images.photos.length,
                    itemBuilder: (context, index) {
                      MarsRoverImagePhotos imagePhotos = images.photos[index];
                      return Center(
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                                  child: Image(
                                    image: NetworkImage(imagePhotos.imgSrc),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Capture by: '+imagePhotos.camera.fullName,
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.grey[900],
                                      ),),
                                      SizedBox(height: 5,),
                                      Text('Capture Date: '+imagePhotos.earthDate,
                                      textAlign: TextAlign.start,
                                        style: TextStyle(
                                          letterSpacing: 1,
                                        ),),

                                    ],
                                  )
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              );
            } else {
              return Loading();
            }
          },
        ));
  }
}
