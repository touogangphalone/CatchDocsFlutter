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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();
  final TextEditingController _annotationsController = TextEditingController();
  File _image = File('');
  List bureaux = [];
  int selectedBureauId = 1; // Set default value to 1

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    fetchBureaux();
  }

  Future<void> fetchBureaux() async {
    final url = Uri.parse('http://192.168.248.227:8000/api/admin_bureaux');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map;
      print("/api/admin_bureaux");
      print(data);
      setState(() {
        bureaux = data["bureau"];
        print("voici le nouveau ${bureaux}");
      });
    } else {
      print('Failed to fetch bureaux: ${response.statusCode}.');
    }
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

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

    var jsonResponse = json.decode(User!) as Map;
    String user_id = jsonResponse['user']['id'].toString();
    print(" voici le  user new ${user_id}");
    //final String user_id = User != null ? jsonDecode(User)["id"] : "1";

    final url = Uri.parse('http://192.168.248.227:8000/api/document/store');
    final request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('document', file.path));
    request.fields['name'] = _nameController.text;
    request.fields['description'] = _descriptionController.text;
    request.fields['title'] = _titleController.text;
    request.fields['user_id'] = user_id;
    request.fields['bureau_id'] = selectedBureauId.toString();
    request.fields['source'] = _sourceController.text;
    request.fields['text'] = _textController.text;
    request.fields['tags'] = _tagsController.text;
    request.fields['annotations'] = _annotationsController.text;

    final response = await request.send();
    if (response.statusCode == 200) {
      // Show success message
      _showSnackBar('File uploaded successfully!');
      // Reset the form after successful submission
      _formKey.currentState!.reset();
      // Reset the selected image
      setState(() {
        _image = File('');
      });
    } else {
      // Show error message
      _showSnackBar('Upload failed with status: ${response.statusCode}.');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Ajouter un nouveau document'),
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
                    icon: Icon(
                      Icons.title_rounded,
                      color: Colors.blue,
                    ),
                    labelText: 'Nom',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer un nom';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 7.0),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.description,
                      color: Colors.blue,
                    ),
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer une description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 7.0),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.title,
                      color: Colors.blue,
                    ),
                    labelText: 'Titre',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer un titre';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 7.0),
                // ... Add other TextFormFields ...
                // DropdownButton to display bureaux
                Center(
                  child: Container(
                    width: 346,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Colors.grey,
                        //width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      child: DropdownButtonFormField<String>(
                        value: selectedBureauId.toString(),
                        items: bureaux.map((bureau) {
                          return DropdownMenuItem<String>(
                            value: bureau['id'].toString(),
                            child: Text(bureau['name']),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedBureauId = int.parse(value!);
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Select Bureau',
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.select_all,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: _image == null
                      ? Text('Aucune image sélectionnée')
                      : Image.file(_image),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: _getImage,
                    child: Text('Sélectionner une image'),
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_image != null) {
                          _createPdf();
                        }
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
