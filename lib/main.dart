import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  static const List categories = [
    'Capuccino',
    'Macchiato',
    'Latte',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 1 / 2 * width,
                  width: width,
                  decoration: BoxDecoration(
                    color: const Color(0xFF202020),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          blurRadius: 4,
                          offset: const Offset(0.0, 4.0)),
                    ],
                  ),
                ),
                // Expanded(
                //   flex: 1,
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 4.0),
                //     child: Container(
                //       color: const Color(0xFFF9F9F9),
                //     ),
                //   ),
                // )
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        // prefixStyle: ,
                        prefixIconConstraints: BoxConstraints(minWidth: 46.0),
                        hintText: 'Search coffee',
                        hintStyle: TextStyle(
                          color: Color(0xFF989898),
                        ),
                        filled: true,
                        fillColor: Color(0xFF313131),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Latte_and_dark_coffee.jpg/640px-Latte_and_dark_coffee.jpg',
                      width: width - 64.0,
                      height: 1 / 2 * (width - 64.0),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 32.0),
                    width: double.infinity,
                    height: 34,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int i) {
                        final category = categories[i];
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          color: const Color(0xFFC67C4E),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              category,
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
