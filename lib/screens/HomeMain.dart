import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:quizstar/screens/utils/colors.dart';

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:pdf/widgets.dart' as pw;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets/font.dart' as pwFont;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  List<String> _pictures = [];
  File file;
  ImagePicker image = ImagePicker();
  bool isSave = false;
  String status = "Veuillez scanner un document";
  
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _officesIdController = TextEditingController();
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();
  final TextEditingController _annotationsController = TextEditingController();

  String _documentsPath;
  String _errorMessage;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  Future<String> getOfficeIdFromLocalStorage() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (localStorage.containsKey("user")) {
      final user = localStorage.getString("user");
      return json.decode(user)["office_id"];
    } else {
      return null;
    }
  }

  void end() {
    setState(() {
      isSave = false;
    });
    Future.delayed(Duration(seconds: 5), () {
      end2();
    });
  }

  void end2() {
    setState(() {
      status = "Veuillez scanner un document!";
    });
  }

  getImage() async {
    var img = await image.pickImage(source: ImageSource.camera);
    setState(() {
      if (img != null) {
        file = File(img.path);
      }
    });
  }


Future<File> _savePdfFile(List<int> pdfBytes, String officeId) async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    final String fileName = 'document_$officeId.pdf';
    final String filePath = path.join(appDocPath, fileName);
    final File pdfFile = File(filePath);
    await pdfFile.writeAsBytes(pdfBytes, flush: true);
    return pdfFile;
}

Future<void> _incrementCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = prefs.getString('nom_de_la_cle');
  final SharedPreferences localStorage = await SharedPreferences.getInstance();
  final String officeId = localStorage.getString("user") != null
      ? jsonDecode(localStorage.getString("user"))["office_id"]
      : null;
  if (officeId == null) {
    throw Exception("L'ID de l'office est introuvable dans le LocalStorage");
  }

  setState(() {
    isSave = true;
    file = null;
    status = "Document enregistré avec succès!";
  });

  // Génère le PDF
  final PdfDocument pdf = PdfDocument();
  final pw.Document pdfDoc = pw.Document();
  pdfDoc.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text('Hello, world!', style: pw.TextStyle(fontSize: 24)),
        );
      },
    ),
  );
  pdfDoc.save();
  final Uint8List pdfBytes = await pdf.save();

  try {
    setState(() {
      _isLoading = true;
    });

    final Uri url = Uri.parse('http://127.0.0.1:8000/upload_file');
    final http.MultipartRequest request = http.MultipartRequest('POST', url);
    final File pdfFile = await _savePdfFile(pdfBytes, officeId);
    request.files.add(await http.MultipartFile.fromPath('documents', pdfFile.path));
    request.fields['name'] = _nameController.text;
    request.fields['description'] = _descriptionController.text;
    request.fields['title'] = _titleController.text;
    request.fields['offices_id'] = officeId;
    request.fields['source'] = _sourceController.text;
    request.fields['text'] = _textController.text;
    request.fields['tags'] = _tagsController.text;
    request.fields['annotations'] = _annotationsController.text;

    final http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print('Le document a été créé avec succès');
    } else {
      print('Erreur lors de la création du document: ${response.statusCode}');
    }

    setState(() {
      _isLoading = false;
    });
  } catch (e) {
    print('Error: $e');
  }

  // Affiche une indication de chargement pendant 2 secondes
  await Future.delayed(const Duration(seconds: 2));
  end();
}


Future<void> _incrementcCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = prefs.getString('nom_de_la_cle');
  final SharedPreferences localStorage = await SharedPreferences.getInstance();
  final String officeId = localStorage.getString("user") != null ? jsonDecode(localStorage.getString("user"))["office_id"] : null;
  if (officeId == null) {
    throw Exception("L'ID de l'office est introuvable dans le LocalStorage");
  }

  // Génère le PDF
  final PdfDocument pdf = PdfDocument();
  final pw.Document pdfDoc = pw.Document();
  pdfDoc.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text('Hello, world!', style: pw.TextStyle(fontSize: 24)),
        );
      }
  ));
  // pdfDoc.finalize();
  pdfDoc.save();
  final List<int> pdfBytes = await pdf.save();

  try {
    setState(() {
      _isLoading = true;
    });
    final Uri url = Uri.parse('http://127.0.0.1:8000/upload_file');
    final http.MultipartRequest request = http.MultipartRequest('POST', url);
    final File pdfFile = await _savePdfFile(pdfBytes, officeId);
    request.files.add(await http.MultipartFile.fromPath('documents', pdfFile.path));
    request.fields['name'] = _nameController.text;
    request.fields['description'] = _descriptionController.text;
    request.fields['title'] = _titleController.text;
    request.fields['offices_id'] = officeId;
    request.fields['source'] = _sourceController.text;
    request.fields['text'] = _textController.text;
    request.fields['tags'] = _tagsController.text;
    request.fields['annotations'] = _annotationsController.text;

    final http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print('Le document a été créé avec succès');
      setState(() {
        isSave = true;
        file = null;
        status = "Document enregistré avec succès!";
      });
    } else {
      print('Erreur lors de la création du document: ${response.statusCode}');
    }
    setState(() {
      _isLoading = false;
    });
  } catch (e) {
    print('Error: $e');
  }

  // Affiche une indication de chargement pendant 2 secondes
  Future.delayed(const Duration(seconds: 2), () {
    end();
  });
}


Future<Uint8List> generatePdf(PdfPageFormat format, File file) async {
  final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
  
  final fontLoader = pw.FontLoader();
  final font = pwFont.ttf(await fontLoader.load(File('assets/fonts/Montserrat-Regular.ttf').readAsBytes()));
    
  final showimage = pw.MemoryImage(file.readAsBytesSync()); 

  pdf.addPage(
    pw.Page(
      pageFormat: format,
      build: (context) {
        return pw.Center(
          child: pw.Image(showimage, fit: pw.BoxFit.contain),
        );
      },
    ),
  );

  final output = Uint8List.fromList(await pdf.save());
  return output;
}

// Future<Uint8List> _generadtePdf(PdfPageFormat format, File file) async {
//   final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
//   final font = await PdfGoogleFonts.nunitoExtraLight();

//   final showimage = pw.MemoryImage(file.readAsBytesSync());

//   pdf.addPage(
//     pw.Page(
//       pageFormat: format,
//       build: (context) {
//         return pw.Center(
//           child: pw.Image(showimage, fit: pw.BoxFit.contain),
//         );
//       },
//     ),
//   );

//   return pdf.save();
// }

  @override
  Widget build(BuildContext context) {    
      // Vérifie si un user est stocké dans le LocalStorage avec la clé "user"
      // if (!localStorage.getItem("user")) {
      //   Navigator.pushNamed(context, '/login');
      // }
    return Scaffold(
      appBar: AppBar(
        title: Text("CatchDocs"),
      ),
      body: isSave
          ? CircularProgressIndicator()
            :Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a name';
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
                          if (value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Title',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _officesIdController,
                        decoration: InputDecoration(
                          labelText: 'Offices ID',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter an offices ID';
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
                          if (value.isEmpty) {
                            return 'Please enter a source';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _textController,
                        decoration: InputDecoration(
                          labelText: 'Text',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
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
                          if (value.isEmpty) {
                            return 'Please enter some tags';
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
                          if (value.isEmpty) {
                            return 'Please enter some annotations';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      RaisedButton(
                        onPressed: _isLoading ? null : _incrementCounter,
                        child: Text('Submit'),
                      ),

                      RaisedButton(
                        color: blueColor,
                        onPressed: () {
                            print("pressed");
                        },
                    child: Text("Login"),
                  ),
                      SizedBox(height: 10),
                      _errorMessage != null
                          ? Text(
                              _errorMessage,
                              style: TextStyle(color: Colors.red),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: file != null
          ? FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.check))
          : FloatingActionButton(
              onPressed: getImage,
              tooltip: 'Increment',
              child: const Icon(Icons.camera_alt_outlined),
            ),
    );
  }
}
