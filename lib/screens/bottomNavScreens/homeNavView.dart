import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_app/api_key.dart';
import 'package:nasa_app/models/nasa_apod.dart';
import 'package:nasa_app/screens/loading.dart';

class HomeNavView extends StatefulWidget {
  @override
  _HomeNavViewState createState() => _HomeNavViewState();
}

class _HomeNavViewState extends State<HomeNavView> {
  Future<NASAAPODMODEL> nasaData;

  Future<NASAAPODMODEL> fetchData() async {
    final response = await http.get(
        Uri.parse("https://api.nasa.gov/planetary/apod?api_key=" + API_KEY));
    return NASAAPODMODEL.fromJson(jsonDecode(response.body));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nasaData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Astronomy Picture of the Day'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        elevation: 1,
      ),
      body: FutureBuilder<NASAAPODMODEL>(
        future: nasaData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            NASAAPODMODEL data = snapshot.data;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Card(
                        elevation: 1.0,
                        color: Colors.white,
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  data.title,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              /*CachedNetworkImage(
                                imageUrl: data.hdurl,
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),*/
                              Image(
                                image: (data.hdurl == null) ? AssetImage("assets/image.png") : NetworkImage(
                                  data.hdurl,
                                ),
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Copyright: ' + data.copyright,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Date: '+data.date,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data.explanation,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Loading());
          }
        },
      ),
    );
  }
}
