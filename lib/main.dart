import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

Color greyColor = Colors.grey.shade200;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black45,
          leading: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
            size: 20,
          ),
          titleSpacing: 90,
          title: Text(
            'PLANA',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.black,
              letterSpacing: 3,
            ),
          ),
        ),
        body: Container(
          color: Colors.black45,
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: const Text(
                  'Create a New Plan',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.82,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                padding: EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reuseFilled(
                          'Plan Name', Icon(Icons.celebration_outlined)),
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('Is this plan a offer/discount/voucher'),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: greyColor,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Description About Plan',
                          ),
                          maxLines: 7,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async{
                              final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2015, 8),
                                  lastDate: DateTime(2101));
                              if (picked != null) {
                                print(picked);
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                                color: greyColor,
                              ),
                              child: ListTile(
                                minVerticalPadding: 0,
                                title: Text('Start'),
                                subtitle: Text('Date | Time'),
                                trailing: Icon(Icons.calendar_today_outlined),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async{
                              final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2015, 8),
                                  lastDate: DateTime(2101));
                              if (picked != null) {
                                print(picked);
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                                color: greyColor,
                              ),
                              child: ListTile(
                                minVerticalPadding: 0,
                                title: Text('End'),
                                subtitle: Text('Date | Time'),
                                trailing: Icon(Icons.calendar_today_outlined),
                              ),
                            ),
                          ),
                        ],
                      ),
                      reuseFilled('Venue', Icon(Icons.location_pin)),
                      reuseFilled(
                          'Upload New Image', Icon(Icons.add_circle_rounded)),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black45),
                            fixedSize: MaterialStatePropertyAll(
                                Size(double.infinity, 50))),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          child: Text(
                            'Next',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container reuseFilled(String text, Icon icon) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: greyColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none, suffixIcon: icon, hintText: text),
      ),
    );
  }
}
