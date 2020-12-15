import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import '../constantColor.dart';
import '../custom-icon-button.dart';
import '../defalte-Button.dart';
import '../top-back-appbar.dart';
import 'loginConstructor/form-Heading-And-SubHeading.dart';
import 'package:image_picker/image_picker.dart';

class ProfileMedia extends StatefulWidget {
  @override
  _ProfileMediaState createState() => _ProfileMediaState();
}

class _ProfileMediaState extends State<ProfileMedia> {
  File _image;
  final picker = ImagePicker();
  _getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        // _image = File(pickedFile.path);
        _cropImage(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    Navigator.pop(context);
  }

  _cropImage(pickedFile) async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: pickedFile,
      androidUiSettings: AndroidUiSettings(
          statusBarColor: iZgreenL1,
          toolbarColor: iZgreenL1,
          toolbarTitle: "Crop Image",
          toolbarWidgetColor: Colors.white),
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );
    if (cropped != null) {
      setState(() {
        _image = cropped;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iZblack,
      appBar: topBackAppbarGreenBg(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.0, -1.0),
            end: Alignment(0.0, 1.0),
            colors: [
              const Color(0x9638a558),
              const Color(0x9a343eb7),
              const Color(0xcc343bba)
            ],
            stops: [0.0, 1.0, 1.0],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: FormHeadingAndSubHeading(
                  'Profile Media',
                  subHeding: "Add some media to your profile",
                  headingColor: iZwhite,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: 225,
                  width: 225,
                  child: CircleAvatar(
                    backgroundImage: _image == null
                        ? AssetImage('assets/img/profilePhoto.jpg')
                        : FileImage(_image),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: izDefultSpace),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomIconButton(
                      iconPress: () {
                        print('buttonPess');
                      },
                      cBtIconColor: iZgreen,
                      cBtIcon: CupertinoIcons.gear_alt,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: CustomIconButton(
                        iconPress: () {
                          _onCameraButtonPress();
                        },
                        cBtHeight: 80,
                        cBtWidht: 80,
                        cBtIconColor: iZblueM,
                        cBtIconSize: 40,
                        cBtIcon: CupertinoIcons.camera,
                      ),
                    ),
                    CustomIconButton(
                      iconPress: () {
                        print('buttonPess');
                      },
                      cBtIconColor: iZgreen,
                      cBtIcon: CupertinoIcons.slider_horizontal_3,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: izDefultSpace),
                child: DefalteButton(
                  'Finish',
                  onePress: () {},
                  btTextColor: iZblue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onCameraButtonPress() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(CupertinoIcons.camera),
                  title: Text('Camera'),
                  onTap: () {
                    _getImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.folder),
                  title: Text('Gallery'),
                  onTap: () {
                    _getImage(ImageSource.gallery);
                  },
                )
              ],
            ),
          );
        });
  }
}
