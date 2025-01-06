import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const ThaiFoodMenuApp());
}

class ThaiFoodMenuApp extends StatelessWidget {
  const ThaiFoodMenuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thai Food Menu',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const ThaiFoodMenuPage(),
    );
  }
}

class ThaiFoodMenuPage extends StatefulWidget {
  const ThaiFoodMenuPage({Key? key}) : super(key: key);

  @override
  _ThaiFoodMenuPageState createState() => _ThaiFoodMenuPageState();
}

class _ThaiFoodMenuPageState extends State<ThaiFoodMenuPage> {
  // รายการเมนูพร้อมส่วนผสมหลักและราคา
  final List<Map<String, dynamic>> thaiMenus = [
    {
      "menu": "ต้มยำกุ้ง",
      "ingredients": "กุ้ง, ข่า, ตะไคร้, ใบมะกรูด, พริก",
      "price": 120,
      "icon": Icons.ramen_dining
    },
    {
      "menu": "ผัดไทย",
      "ingredients": "เส้นจันท์, กุ้งแห้ง, เต้าหู้, ถั่วงอก, ไข่",
      "price": 90,
      "icon": Icons.local_pizza
    },
    {
      "menu": "แกงเขียวหวาน",
      "ingredients": "กะทิ, พริกแกงเขียวหวาน, เนื้อไก่, มะเขือเปราะ, โหระพา",
      "price": 150,
      "icon": Icons.lunch_dining
    },
    {
      "menu": "ส้มตำ",
      "ingredients": "มะละกอ, มะเขือเทศ, ถั่วฝักยาว, พริก, น้ำปลา",
      "price": 50,
      "icon": Icons.food_bank
    },
    {
      "menu": "ข้าวผัดปู",
      "ingredients": "ข้าวสวย, เนื้อปู, ไข่, ต้นหอม, ซอสปรุงรส",
      "price": 80,
      "icon": Icons.set_meal
    },
  ];

  final List<Map<String, dynamic>> selectedMenus = []; // เมนูที่เลือก

  // ฟังก์ชันสุ่มเมนูอาหาร
  Map<String, dynamic> getRandomMenu() {
    Random random = Random();
    int index = random.nextInt(thaiMenus.length);
    return thaiMenus[index];
  }

  // ฟังก์ชันเพิ่มเมนู
  void addRandomMenu() {
    setState(() {
      selectedMenus.add(getRandomMenu());
    });
  }

  @override
  void initState() {
    super.initState();
    addRandomMenu(); // เริ่มต้นด้วยเมนูแรก
  }

  void resetMenus() {
    setState(() {
      selectedMenus.clear();
      addRandomMenu(); // เพิ่มเมนูเริ่มต้นใหม่
    });
  }

  // คำนวณราคารวม
  int getTotalPrice() {
    int total = 0;
    for (var item in selectedMenus) {
      // ตรวจสอบว่า item['price'] เป็น int หรือไม่
      var price = item['price'];
      if (price is int) {
        total += price; // ถ้าเป็น int ก็ให้บวก
      } else {
        // ถ้าไม่ใช่ int ให้ข้ามไป
        print('Invalid price: ${item['price']}');
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thai Food Menu'),
      ),
      body: Column(
        children: [
          // แสดงราคารวมที่ด้านบน
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Total Price: ฿${getTotalPrice()}',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
          ),
          // แสดงรายการเมนู
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: selectedMenus.length,
              itemBuilder: (context, index) {
                var item = selectedMenus[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.orange.shade100,
                      child: Text(
                        "${item['price']}", // แสดงราคาของเมนู
                        style: const TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(
                      item['menu'], // ชื่อเมนู
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(item['icon'],
                                color: Colors.orange), // ไอคอนของเมนู
                            const SizedBox(width: 8),
                            Text("ส่วนผสม:"),
                          ],
                        ),
                        Text(item['ingredients']), // ส่วนผสมหลัก
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addRandomMenu,
        child: const Icon(Icons.add),
        tooltip: "Add Menu",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
