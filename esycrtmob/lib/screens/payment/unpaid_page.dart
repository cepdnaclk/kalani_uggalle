import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/screens/payment/promo_item.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_int2/screens/payment/bill_view.dart';

class UnpaidPage extends StatefulWidget {
  @override
  _UnpaidPageState createState() => _UnpaidPageState();

  
}

class _UnpaidPageState extends State<UnpaidPage> {
  Color active;
  
  final name = TextEditingController();
  final  List  lista = [{"itemName": "AB Milk(2xpkt)", "price": "Rs.1200"}, {"itemName": "xy yoghurt(x4)", "price": "Rs.160"}];

  @override
  Widget build(BuildContext context) {
    Widget payNow = InkWell(
//      onTap: () => Navigator.of(context)
//          .push(MaterialPageRoute(builder: (_) => ViewProductPage())),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("Pay Now",
              style: const TextStyle(
                  color: const Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return Material(
        color: Colors.white,
        child: SafeArea(
          child: LayoutBuilder(
              builder: (_, constraints) => SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(top: kToolbarHeight),
                          child: Column(children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Your Bill',
                                    style: TextStyle(
                                      color: darkGrey,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  CloseButton()
                                ],
                              ),
                            ),
                            //PromoItem(),
                            Container(
                              margin: const EdgeInsets.all(16.0),
                              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: shadow,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              // child: Column(                                  //See https://flutter.dev/docs/cookbook/lists/long-lists
                              //   mainAxisSize: MainAxisSize.min,
                              //   //Replaced from line 84.See unpaid.dart
                              //   children:Bill() 
                                
                                //height: 250,
                               child:ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: lista.length,
                                    itemBuilder: (BuildContext ctxt, int index) {
                                      return Container(
                                        //child: Text(lista[index]["name"].toString()),
                                        child:ListTile(
                                                title: Text(lista[index]["itemName"].toString()),
                                                trailing: Text(lista[index]["price"].toString()),
                                              ),
                                      );
                                    }
                                ),
                             ),
                            
                            PromoItem(),//Tken down

                            SizedBox(
                              height: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: payNow,
                            )

                          ]))))),
        ));
  }
}
