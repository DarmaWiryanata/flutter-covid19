import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  int _radioValue1 = -1;
  int correctScore = 0;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;
  int _radioValue5 = -1;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;
    });
  }

  void _handleRadioValueChange3(int value) {
    setState(() {
      _radioValue3 = value;
    });
  }

  void _handleRadioValueChange4(int value) {
    setState(() {
      _radioValue4 = value;
    });
  }

  void _handleRadioValueChange5(int value) {
    setState(() {
      _radioValue5 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form Survei'),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(8.0),
              child: ListView(
                primary: false,
                shrinkWrap: true,
                children: <Widget>[
                  _buildForm('1',
                      'Berjemur di bawah sinar matahari dapat mengurangi resiko terpapar virus corona'),
                  _buildForm('2',
                      'Virus corona dapat mengendap dalam tubuh pasien selamanya'),
                  _buildForm('3',
                      'Minum minuman beralkohol dapat mencegah virus corona'),
                  _buildForm('4',
                      'Cuaca dingin dan bersalju tidak dapat membunuh virus corona'),
                ],
              )),
        ));
  }

  _buildForm(no, text) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Pernyataan ' + no + ' dari 30',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Divider(height: 5.0, color: Colors.black),
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 0,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChange1,
              ),
              Text(
                'Benar',
                style: TextStyle(fontSize: 16.0),
              ),
              Radio(
                value: 1,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChange1,
              ),
              Text(
                'Salah',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Radio(
                value: 2,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChange1,
              ),
              Text(
                'Tidak tahu',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          )
        ]);
  }
}
