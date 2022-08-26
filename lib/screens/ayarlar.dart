import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/screens/isimdegistir.dart';
import 'package:flutter_application_1/widget/butonFoto.dart';
import '../screens/ayarlar.dart';
import 'screens.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../screens/fotoSec.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class ayarlar extends StatefulWidget {
  const ayarlar({super.key});

  static const id = 'Kendine Bir Profil Fotorafı Seç!';

  @override
  State<ayarlar> createState() => _ayarlarState();
}

class _ayarlarState extends State<ayarlar> {
  void _showSelectPhotoOptions(BuildContext context, Function fc) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(fc: fc),
            );
          }),
    );
  }

  void _showCameraOptions(BuildContext context, Function fc1) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(fc: fc1),
            );
          }),
    );
  }

  File? mYimage;
  bool saveImage = false;
  Future pickImage(ImageSource type) async {
    XFile? image;
    try {
      if (type == ImageSource.gallery) {
        image = await ImagePicker().pickImage(source: ImageSource.gallery);
      } else {
        image = await ImagePicker().pickImage(source: ImageSource.camera);
      }

      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        print('object');
        mYimage = imageTemp;
        saveImage = true;
      });
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print('Görsel Seçme Başarısız: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Image(
            width: 20,
            height: 20,
            color: Colors.white,
            image: AssetImage('assets/images/back.png'),
          ),
        ),

//        backgroundColor: Colors.transparent,
        backgroundColor: const Color(0xff191720),
        elevation: 0,
        title: const Text("Çıkış"),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 0,
                      ),
                      Text(
                        'Kendine Bir Profil Fotorafı Seç!',
                        style: kBodyText2,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '',
                        style: kHeadSubtitleTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Center(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      _showSelectPhotoOptions(context, pickImage);
                    },
                    child: Center(
                      child: Container(
                          height: 200.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade200,
                          ),
                          child: Column(
                            children: [
                              if (!saveImage)
                                const Center(
                                  heightFactor: 11,
                                  child: Text(
                                    'Resim Seçiniz',
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: 'OuterSans'),
                                  ),
                                ),
                              if (saveImage)
                                ClipOval(
                                  child: Image.file(
                                    mYimage!,
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height:200,
                                  ),
                                ),
                            ],
                          )),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const Spacer(),
              Expanded(
                flex: 0,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Dikkat"),
                          content: const Text(
                              "İsminizi ve Şifrenizi Değiştirmek İstiyorsanız Devam'a Tıklayınız İstemiyorsanız Burada Kal'a Basın Ve Kaydete Basın"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => const ayarlar(),
                                    ));
                              },
                              child: const Text('Burada Kal'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => const isimDegis(),
                                    ));
                              },
                              child: const Text('Devam Et'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      'Devam Et',
                      style: kButtonText,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: Text(
                      'Kaydet',
                      style: kButtonText,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
