import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16), // เพิ่ม padding รอบกล่อง
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black), // กรอบรอบทั้งหมด
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // ขนาดกล่องพอดีเนื้อหา
              crossAxisAlignment: CrossAxisAlignment.start, // จัดข้อความชิดซ้าย
              children: [
                Center(
                  child: Image.asset(
                    'assets/image.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Firstname: Thanaphat",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("Lastname: Riangsoong",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("Nickname: Bote",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 10),
                Text("Hobby: Treadmill"),
                Text("Food: Sweet basil"),
                Text("Birthplace: Phichit"),
                SizedBox(height: 10),
                Text("Education:",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Text("elementary: Pho Thale Pracharatbrung Kindergarten"),
                    Spacer(), // ช่องว่างเพื่อให้ปีอยู่ทางขวา
                    Text("year: 54"),
                  ],
                ),
                Row(
                  children: [
                    Text("primary: Pho Thale Pracharatbrung Kindergarten"),
                    Spacer(),
                    Text("year: 59"),
                  ],
                ),
                Row(
                  children: [
                    Text("high school: Phothitham Suwat School"),
                    Spacer(),
                    Text("year: 65"),
                  ],
                ),
                Row(
                  children: [
                    Text("Undergrad: Naresuan University"),
                    Spacer(),
                    Text("year: 68"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      theme: ThemeData(primarySwatch: Colors.green),
    ),
  );
}
