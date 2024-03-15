import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flicker_play/providers/user_provider.dart';
import 'package:flicker_play/services/fire_base_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/rich_button.dart';

class UserEdit extends StatefulWidget {
  const UserEdit({super.key});

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userEditFormKey = GlobalKey<FormState>();
  File? _selectedImage;
  String? imagePath;
  String? email;
  bool canEdit = false;

  late SharedPreferences preferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      email = FirebaseAuth.instance.currentUser!.email;
      firstName.text = context.read<UserProvider>().firstName!;
      lastName.text = context.read<UserProvider>().lastName!;
    });
    init();
  }

  Future init() async {
    preferences = await SharedPreferences.getInstance();
    String? imagePath = preferences.getString('userImage');
    if (imagePath == null) return;
    setState(() {
      this.imagePath = imagePath;
      context.read<UserProvider>().setImagePath(imgPath: imagePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Form(
          key: userEditFormKey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          canEdit = !canEdit;
                        });
                      },
                      child: canEdit
                          ? const Icon(Icons.edit)
                          : const Icon(Icons.stop)),
                  const SizedBox(width: 30),
                  InkWell(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                      },
                      child: const Icon(Icons.logout))
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Center(
                child: Stack(
                  children: [
                    imagePath != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Image.file(
                              File(imagePath!),
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ))
                        : _selectedImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: Image.file(
                                  _selectedImage!,
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ))
                            : Container(
                                width: 200,
                                height: 200,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(300),
                                    color: Colors.greenAccent),
                                //child: Image.network(""),
                              ),
                    Positioned(
                      bottom: 0,
                      right: 30,
                      child: InkWell(
                          onTap: () {
                            _pickImageFromCamera();
                          },
                          child: const Icon(Icons.edit_square)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                readOnly: !canEdit,
                controller: firstName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                  hintText: 'Enter Your First Name',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) {
                  // if (email!.isEmpty) {
                  //   return "Enter email";
                  // } else if (!EmailValidator.validate(email)) {
                  //   return "Enter valid email";
                  // }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                readOnly: !canEdit,
                controller: lastName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'LastName',
                  hintText: 'Enter Your Last Name',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (value) => value != null && value.length < 6
                //     ? 'Enter min. 6 characters'
                //     : null,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 30,
              ),
              RichButton(
                btnName: "Submit",
                onPressed: submit,
              )
            ],
          ),
        ),
      ),
    );
  }

  submit() async {
    FireService().addUserDetails(
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email!);
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
      preferences.setString('userImage', returnedImage.path);
      context.read<UserProvider>().setImagePath(imgPath: returnedImage.path);
    });
  }
}
