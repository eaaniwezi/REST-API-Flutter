import 'package:flutter/material.dart';
import 'package:jsonplaceholder/models/photo_model.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatefulWidget {
  final PhotoModel photo;

  const ImageViewer({Key key, this.photo}) : super(key: key);

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: Color(0xFF151C26),
          title: Text("Post id:: " + widget.photo.id.toString()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .25,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Post title::",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SingleChildScrollView(
                            child: Container(
                              height: MediaQuery.of(context).size.height * .12,
                              child: Text(
                                widget.photo.title,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * .5,
                  child: PhotoView(
                    imageProvider: NetworkImage(widget.photo.url),
                    backgroundDecoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
