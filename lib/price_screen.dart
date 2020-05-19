import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String _selectedItem = 'INR';
  CoinData coinData = CoinData();
  String btcval = 'Getting Value In ';
  String ethval = 'Getting Value In ';
  String ltcval = 'Getting Value In ';

  List<ListTile> getSheetItemList(){

    List<ListTile> itemList = [];

    for (int i=0;i<currenciesList.length;i++){

      String x = currenciesList[i];
      itemList.add(
        ListTile(
          leading: Icon(FontAwesomeIcons.moneyBill,color: Colors.green,),
          title: Text(x,style: TextStyle(color: Colors.blueAccent),),
          onTap: ()=> _selectItem(x),
        ),
      );
    }
    return itemList;
  }

  void updateData(String currency) async {

    dynamic coinValue = await coinData.getData(currency);
    setState(() {
      _selectedItem = currency;
      String btc = coinValue[0]['price'];
      btcval = double.parse(btc).round().toString();
      String eth = coinValue[1]['price'];
      ethval = double.parse(eth).round().toString();
      String ltc = coinValue[2]['price'];//2.price
      ltcval = double.parse(ltc).round().toString();
    });
  }
@override
  void initState(){
    super.initState();
    updateData(_selectedItem);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $btcval $_selectedItem',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = $ethval $_selectedItem',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = $ltcval $_selectedItem',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 100.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: FlatButton(
              onPressed: (){
                onButtonPressed();
              },
              child: Container(
                child: Text('Change Currency',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void onButtonPressed(){
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        color: Color(0xFF737373),
        height: 180.0,
        child: Container(
          child: _buildBottomNavigationMenu(),
          decoration: BoxDecoration(
            color: Colors.white,//Theme.of(context).canvasColor
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )
          ),
        ),
      );
    });
  }

  ListView _buildBottomNavigationMenu() {
    return ListView(
      children: getSheetItemList(),
    );
  }

  void _selectItem(String value){
    Navigator.pop(context);
      updateData(value);
  }
}
