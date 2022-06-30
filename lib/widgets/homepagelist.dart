import "package:flutter/material.dart";
import 'package:projectuas/request/get_history.dart';

// ignore: must_be_immutable
class HomeList extends StatelessWidget {
  Future<List<HistoryRequest>> fetchedHistory;
  HomeList({Key? key, required this.fetchedHistory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        child: FutureBuilder<List<HistoryRequest>>(
          future: fetchedHistory,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        title: Text(
                          snapshot.data![index].type,
                          style: const TextStyle(color: Colors.black, fontSize: 20.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          '${snapshot.data![index].date} | ${snapshot.data![index].timeIn}',
                          style: const TextStyle(color: Colors.black, fontSize: 15.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: Container(
                          padding: const EdgeInsets.all(5),
                          child: const Icon(Icons.history, size: 25, color: Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.width * 0.1,
                    child: const CircularProgressIndicator(),
                  ),
                );
            }
          }
        ),
        color: Colors.blue[100]);
  }
}
