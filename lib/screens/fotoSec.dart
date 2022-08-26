import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../widget/re_usable_select_photo_button.dart';

class SelectPhotoOptionsScreen extends StatefulWidget {
   SelectPhotoOptionsScreen({Key? key,required this.fc}) : super(key: key);
    Function fc;
  @override
  State<SelectPhotoOptionsScreen> createState() =>
      _SelectPhotoOptionsScreenState();
}

class _SelectPhotoOptionsScreenState extends State<SelectPhotoOptionsScreen> {
  set image(File image) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey.shade300,
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -35,
            child: Container(
              width: 50,
              height: 6,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(children: [
            SelectPhoto(
              onTap: () {
                widget.fc(ImageSource.gallery);
                // File? image;
                // Future pickImage() async {
                //   try {
                //     final image = await ImagePicker()
                //         .pickImage(source: ImageSource.gallery);
                //     if (image == null) return;
                //     final imageTemp = File(image.path);
                //     setState(() => this.image = imageTemp);
                //   } on PlatformException catch (e) {
                //     print('Görsel Seçme Başarısız: $e');
                //   }
                // }

                // pickImage();
              },
              icon: Icons.image,
              textLabel: 'Galeriden Seçin',
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'VEYA',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SelectPhoto(
              onTap: () {
                widget.fc(ImageSource.camera);
                //File? image;
                //Future pickImage() async {
                  //try {
                   // final image = await ImagePicker()
                      //  .pickImage(source: ImageSource.camera);
                    //if (image == null) return;
                   // final imageTemp = File(image.path);
                   // setState(() => this.image = imageTemp);
                //  } on PlatformException catch (e) {
                    //print('Görsel Seçme Başarısız: $e');
                //  }
                //}

               // pickImage();
              },
              icon: Icons.camera_alt_outlined,
              textLabel: 'Kameradan Seçin',
            ),
          ])
        ],
      ),
    );
  }
}
