import 'package:flutter/material.dart';

class ReverseScreen extends StatelessWidget {
  const ReverseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title:
            Text("طلباتى", style: TextStyle(fontSize: 17, color: Colors.green)),
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffF3F3F3), width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: TabBar(
                  tabs: [
                    Tab(
                      text: "ألمنتهيه",
                    ),
                    Tab(
                      text: "الحاليه",
                    ),
                  ],
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  ListView.builder(
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            builder: (context) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Center(child: Text("Hello World")),
                                  Expanded(
                                    child: ListView.builder(itemBuilder: (context, index) => Container(
                                      height: 100,
                                      width: 100,
                                      margin: EdgeInsets.all(10),
                                      color: Colors.orange,
                                    ),
                                    itemCount: 10,),
                                  ),
                                  ElevatedButton(onPressed: (){}, child: Text("hi"))
                                ],
                              ),
                            ));
                      },
                      child: Container(
                        height: 100,
                        margin: EdgeInsets.only(top: 10),
                        width: 100,
                        color: Colors.red,
                      ),
                    ),
                    itemCount: 10,
                  ),
                  ListView.builder(
                    itemBuilder: (context, index) => Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(top: 10),
                      color: Colors.yellow,
                    ),
                    itemCount: 10,
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
