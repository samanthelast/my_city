import 'package:flutter/material.dart';



class AfterSplash extends StatefulWidget{
    AfterSplash({Key key, this.title}) : super(key: key);
  final String title; 
  @override
  State<StatefulWidget> createState() {   
    return  _AfterSplashState();
  }

}
class _AfterSplashState extends State<AfterSplash> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = List<String>();

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }

  }
 

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: Center(
            child: Text("انتخاب شهر"),
          ),
          automaticallyImplyLeading: false),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search2",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${items[index]}',textDirection: TextDirection.rtl,),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    
    );
  }
}
