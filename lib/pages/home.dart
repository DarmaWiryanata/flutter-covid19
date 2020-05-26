import 'package:flutter/material.dart';
import 'package:survei/charts/bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Visualisasi')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildTitle(
                'Pemahaman/Persepsi Masyarakat Terhadap Kondisi Pandemi COVID-19'),
            _buildContentWithDescription('Jumlah Responden', 290.toString()),
            _buildContent('Berdasarkan Pekerjaan'),
          ],
        ),
      ),
    );
  }

  _buildContent(title) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0.0, 3.0),
                      blurRadius: 15)
                ]),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildTextH2(title),
                  SizedBox(height: 10),
                  BarChartSample1()
                ],
              ),
            )));
  }

  _buildContentWithDescription(title, description) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0.0, 3.0),
                      blurRadius: 15)
                ]),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildTextH2(title),
                      _buildTextP(description),
                    ],
                  ),
                  IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/FormScreen');
                      },
                      tooltip: 'Isi Survei')
                ],
              ),
            )));
  }

  _buildTitle(text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTextH1(text),
        ],
      ),
    );
  }

  _buildTextH1(text) {
    return Text(
      text,
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
    );
  }

  _buildTextH2(text) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black.withOpacity(0.7),
          fontSize: 20,
          fontWeight: FontWeight.bold),
    );
  }

  _buildTextP(text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black.withOpacity(0.7),
      ),
    );
  }
}
