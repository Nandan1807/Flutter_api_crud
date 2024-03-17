import 'package:api_crud/Api_backend.dart';
import 'package:flutter/material.dart';

class Api_form extends StatefulWidget {
  final id;
  final iname;
  final iimage;
  final ides;

  Api_form({this.id, this.iname, this.iimage, this.ides});

  @override
  State<Api_form> createState() => _Api_formState();
}

class _Api_formState extends State<Api_form> {
  TextEditingController name = TextEditingController();

  TextEditingController image = TextEditingController();

  TextEditingController description = TextEditingController();

  @override
  void initState() {
    if (widget.iname != null && widget.iimage != null && widget.ides != null) {
      name.text = widget.iname;
      image.text = widget.iimage;
      description.text = widget.ides;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: name,
            ),
            TextFormField(
              controller: image,
            ),
            TextFormField(
              controller: description,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (widget.id == null) {
                    await FoodItems()
                        .insert(name.text, image.text, description.text);
                  } else {
                    await FoodItems().update(await widget.id, name.text, image.text,
                        description.text);
                  }
                  Navigator.of(context).pop(true);
                },
                child: Text("submit"))
          ],
        ),
      ),
    );
  }
}
