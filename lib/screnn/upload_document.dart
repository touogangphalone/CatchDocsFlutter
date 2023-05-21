import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UploadFie extends StatefulWidget {
  @override
  _UploadFieState createState() => _UploadFieState();
}

class _UploadFieState extends State<UploadFie> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _titleController = TextEditingController();
  final _officesIdController = TextEditingController();
  final _sourceController = TextEditingController();
  final _textController = TextEditingController();
  final _tagsController = TextEditingController();
  final _annotationsController = TextEditingController();
  late File _image ;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _createPdf() async {
    final pdf = pw.Document();
    final image = pw.MemoryImage(_image.readAsBytesSync());

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Image(image),
        );
      },
    ));

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/example.pdf');
    await file.writeAsBytes(await pdf.save());
    _uploadFile(file);
  }

  Future<void> _uploadFile(File file) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? User = prefs.getString('user');
  final String officeId = User != null ? jsonDecode(User)["office_id"] : 1;

    final url = Uri.parse('http://127.0.0.1:8000/upload_file');
    final request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('documents', file.path));
    request.fields['name'] = _nameController.text;
    request.fields['description'] = _descriptionController.text;
    request.fields['title'] = _titleController.text;
    request.fields['officesId'] = officeId;
    request.fields['source'] = _sourceController.text;
    request.fields['text'] = _textController.text;
    request.fields['tags'] = _tagsController.text;
    request.fields['annotations'] = _annotationsController.text;

    final response = await request.send();
    if (response.statusCode == 200) {
      print('File uploaded!');
    } else {
      print('Upload failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon formulaire'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nom',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer un nom';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer une description';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Titre',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer un titre';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _sourceController,
                  decoration: InputDecoration(
                    labelText: 'Source',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer une source';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Texte',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer un texte';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tagsController,
                  decoration: InputDecoration(
                    labelText: 'Tags',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer des tags';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _annotationsController,
                  decoration: InputDecoration(
                    labelText: 'Annotations',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer des annotations';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                Center(
                  child: _image == null
                      ? Text('Aucune image sélectionnée')
                      : Image.file(_image),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: RaisedButton(
                    onPressed: _getImage,
                    child: Text('Sélectionner une image'),
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      if (_image != null) {
                        _createPdf();
                      }
                    },
                    child: Text('Envoyer'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
