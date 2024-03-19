import 'package:api_crud/Api_backend.dart';
import 'package:api_crud/Api_form.dart';
import 'package:flutter/material.dart';

class Api_crud extends StatefulWidget {
  @override
  State<Api_crud> createState() => _Api_crudState();
}

class _Api_crudState extends State<Api_crud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FoodItems().getAllDetail(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (context) => Api_form(),
                          ),
                        )
                            .then((value) {
                          setState(() {});
                        });
                      },
                      child: Text("Add +")),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(
                                    MaterialPageRoute(
                                      builder: (context) => Api_form(
                                          id: snapshot.data![index].id,
                                          iname: snapshot.data![index]
                                              .name,
                                          iimage: snapshot.data![index]
                                              .image,
                                          ides: snapshot.data![index]
                                              .description),
                                    ),
                                  )
                                      .then((value) {
                                    setState(() {});
                                  });
                                },
                                child: Column(
                                  children: [
                                    Image.network(
                                        snapshot.data![index].image),
                                    Text(snapshot.data![index].name
                                        .toString()),
                                    Text(snapshot.data![index].description
                                        .toString()),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    FoodItems()
                                        .deleteDetail(
                                            snapshot.data![index].id)
                                        .then((value) {
                                      setState(() {});
                                    });
                                  },
                                  child: Text("Delete")),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text("No data found"),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
