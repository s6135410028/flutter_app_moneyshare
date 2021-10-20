import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshare/views/moneyshare_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  bool checkTip = false;

  TextEditingController txMoney = TextEditingController();
  TextEditingController txPerson = TextEditingController();
  TextEditingController txTip = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        title: Text(
          'แชร์เงินกันเถอะ',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 45.0,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: 100.0,
              ),
              SizedBox(
                height: 45.0,
              ),
              Padding(
                // padding: const EdgeInsets.only(
                //   left: 40.0,
                //   right: 40.0,
                // ),
                padding: const EdgeInsets.symmetric(
                  //ขนาดเท่ากัน ยาวกว้างเท่ากัน
                  horizontal: 40.0,
                  vertical: 40.0,
                ),
                child: TextField(
                  controller: txMoney,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBillWave,
                      color: Colors.deepPurple,
                    ),
                    hintText: 'ป้อนจำนวนเงิน (บาท)',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                // padding: const EdgeInsets.only(
                //   left: 40.0,
                //   right: 40.0,
                // ),
                padding: const EdgeInsets.symmetric(
                  //ขนาดเท่ากัน ยาวกว้างเท่ากัน
                  horizontal: 40.0,
                  vertical: 40.0,
                ),
                child: TextField(
                  controller: txPerson,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.user,
                      color: Colors.deepPurple,
                    ),
                    hintText: ' ป้อนจำนวนคน',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 45.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (data) {
                      setState(() {
                        if (data != null) {
                          checkTip = data;
                          if (data == false) {
                            txTip.text = '';
                          }
                        }
                      });
                    },
                    value: false,
                    side: BorderSide(
                      color: Colors.deepPurple,
                    ),
                    activeColor: Colors.deepPurple,
                    checkColor: Colors.yellow,
                  ),
                  Text(
                    'Tip ให้พนักงาน',
                  ),
                ],
              ),
              SizedBox(
                height: 45.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  //ขนาดเท่ากัน ยาวกว้างเท่ากัน
                  horizontal: 40.0,
                  vertical: 40.0,
                ),
                child: TextField(
                  controller: txTip,
                  enabled: checkTip,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.coins,
                      color: Colors.deepPurple,
                    ),
                    hintText: ' ป้อนจำนวนเหรียญ',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 45.0,
              ),
              ElevatedButton(
                onPressed: () {
                  //ตรวจสอบป้อนหรือสิ่งที่ต้องป้อน ถ้ายังต้องแสดง Dialog เตือน
                  //กรณีหน้าป้อนครบเรียบร้อยก็นำไปคำนวณ เมือ่คำนวณเรียบร้อยส่งไปยังหน้า moneyshareUI
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context){
                        return MoneyshareUI();
                      },
                    ),
                  );
                },
                child: Text(
                  'คำนวณ',
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0,
                    55.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      55.0,
                    ),
                  ),
                  primary: Colors.deepPurple,
                  elevation: 5.0, //Shadow เงา
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  //Clear หน้าจอ
                  setState(() {
                    txMoney.text = '';
                    txPerson.text = '';
                    txTip.text = '';
                    checkTip = false;
                  });
                },
                icon: Icon(
                  Icons.refresh,
                ),
                label: Text(
                  'ยกเลิก',
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0,
                    55.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      55.0,
                    ),
                  ),
                  primary: Colors.deepPurple,
                  elevation: 5.0, //Shadow เงา
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                'Created by BC SAU 2021',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF454545),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
