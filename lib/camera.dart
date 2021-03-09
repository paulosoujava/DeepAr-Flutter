import 'package:avatar_view/avatar_view.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'package:flutter/material.dart';
import 'dart:io' as PT;
class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {

  CameraDeepArController cameraDeepArController;
  String plataformVersion = " Unknown";
  int currentPage = 0;
  final vp = PageController(viewportFraction: .24);
  Effects currentEffects = Effects.none;
  Filters currentFilters = Filters.none;
  Masks currentMask = Masks.none;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            CameraDeepAr(
              onCameraReady: (isReady){
                plataformVersion = " Camera status $isReady";
                print(plataformVersion);
                setState(() {
                });
              },
              androidLicenceKey: "SUA LICENSA",
              cameraDeepArCallback: (c) async {
                cameraDeepArController = c;
                setState(() {

                });
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                          List.generate(8, (page) {
                            bool active = (currentPage == page);
                            return GestureDetector(
                              onTap: (){
                                currentPage = page;
                                cameraDeepArController.changeMask(page);
                                setState(() {

                                });

                              },
                                child: AvatarView(
                                  radius: active ? 65 : 30,
                                  borderColor: Colors.yellow,
                                  borderWidth: 2,
                                  isOnlyText: false,
                                  avatarType: AvatarType.CIRCLE,
                                  backgroundColor: Colors.red,
                                  imagePath: "assets/${PT.Platform.isIOS ? 'ios' : 'android'}/${page.toString()}.jpg",
                                placeHolder: Icon(Icons.person_remove, size:  50),
                                  errorWidget: Container(child: Icon(Icons.error, size:  50, color: Colors.red,),),
                                )
                            );
                          }),

                      ),
                    )
                  ],
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
