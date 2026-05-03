import 'package:flutter/material.dart';
import '../models/error_code.dart';
import '../services/data_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ErrorCode> errors = [];
  List<ErrorCode> filtered = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    final data = await DataService.loadErrors();
    setState(() {
      errors = data;
      filtered = data;
    });
  }

  void search(String query) {
    final result = errors.where((e) =>
        e.code.toLowerCase().contains(query.toLowerCase()) ||
        e.title.toLowerCase().contains(query.toLowerCase())).toList();

    setState(() {
      filtered = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ATM Error Codes"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              onChanged: search,
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final e = filtered[index];
                return Card(
                  child: ListTile(
                    title: Text(e.code),
                    subtitle: Text(e.title),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "DESIGNED BY ENG ABDULRAQEEB ALHASSANI",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
