import 'package:bitcoin_ticker/ConverterModel.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/constants.dart';
import 'package:bitcoin_ticker/currency_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String result;
  String fromCurrency ='CAD';
  String fromCurrencyFlag =' 🇨🇦 ';
  String toCurrency = 'CAD';
  String toCurrencyFlag =' 🇨🇦 ';
  String CC;
  String CF;
  int selectedIndex1 = 0;
  int selectedIndex2 = 0;
  final fromTextController = TextEditingController();
  List<String> currencies;


  @override
  void initState() {
    super.initState();
    loadCurrencies();
  }

  Future<String> loadCurrencies() async {
    String uri = "http://api.openrates.io/latest";
    var response = await http
        .get(Uri.encodeFull(uri), headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body);
    Map curMap = responseBody['rates'];
    currencies = curMap.keys.toList();
    setState(() {});
    print(currencies);
    return "Success";
  }

  Future<String> _doConversion() async {
    String uri =
        "https://api.exchangeratesapi.io/latest?base=$fromCurrency&symbols=$toCurrency";
    var response = await http
        .get(Uri.encodeFull(uri), headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body);
    setState(() {
       result = (double.parse(fromTextController.text) * (responseBody["rates"][toCurrency])).toString();
    });
    print(result);
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Currency Converter',
          style: kTitleStyle,
        ),
      ),
      body: currencies == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Select your currency type',
                                style: kMessageStyle),
                            GestureDetector(
                              onTap: showPicker1,
                              child: Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kLightGray,
                                ),
                                alignment: Alignment.centerLeft,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          fromCurrencyFlag + fromCurrency,
                                          style: kTitleStyle,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.arrow_drop_down,
                                          color: kGray,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text('Enter your currency', style: kMessageStyle),
                            Container(
                              height: 60,
                              child: TextField(
                                keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                                controller: fromTextController,
                                style: kBigNumStyle,
                                decoration: InputDecoration(
                                  alignLabelWithHint: false,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: kFillGray,
                                  hintText: '00000.00',
                                  hintStyle: kBigNumStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('convert to', style: kTitleStyle),
                        GestureDetector(
                          onTap: (){
                            CC = fromCurrency;
                            CF = fromCurrencyFlag;
                            fromCurrency = toCurrency;
                            fromCurrencyFlag = toCurrencyFlag;
                            toCurrency = CC;
                            fromCurrencyFlag = CF;
                            setState(() {

                            });
                          },
                          child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                boxShadow: [containerShadow(kGreen)],
                                color: kGreen,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Icon(
                                Icons.swap_vert,
                                color: kWhite,
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Select your currency type',
                                style: kMessageStyle),
                            GestureDetector(
                              onTap: showPicker2,
                              child: Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kLightGray,
                                ),
                                alignment: Alignment.centerLeft,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          toCurrencyFlag + toCurrency,

                                          style: kTitleStyle,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.arrow_drop_down,
                                          color: kGray,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text('Enter your currency', style: kMessageStyle),
                            Container(
                              height: 60,
                              child: TextField(
                                enabled: false,
                                style: kBigNumStyle,
                                //keyboardType: TextInputType.numberWithOptions(decimal: true),
                                decoration: InputDecoration(
                                  alignLabelWithHint: false,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: kFillGray,
                                  hintText:  result != null ? result : '00000.00',
                                  hintStyle: kBigNumStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        _doConversion();
                        print("from $fromCurrency to $toCurrency");
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          boxShadow: [containerShadow(kBlue)],
                          color: kBlue,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                            child: Text(
                          'Convert',
                          style: kButtonStyle,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  showPicker1() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height / 3.5,
            child: CupertinoPicker(
              backgroundColor: Colors.white,
              onSelectedItemChanged: (value) {
                setState(() {
                  selectedIndex1 = value;
                  print(selectedIndex1);
                  fromCurrency = currencies[selectedIndex1];
                  fromCurrencyFlag = currenciesFlagsList[selectedIndex1];

                });
              },
              itemExtent: 40.0,
              children: getPickerItems(currencies),
            ),
          );
        });
  }

  showPicker2() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height / 3.5,
            child: CupertinoPicker(
              backgroundColor: Colors.white,
              onSelectedItemChanged: (value) {
                setState(() {
                  selectedIndex2 = value;
                  toCurrency = currencies[selectedIndex2];
                  toCurrencyFlag = currenciesFlagsList[selectedIndex2];

                });
              },
              itemExtent: 40.0,
              children: getPickerItems(currencies),
            ),
          );
        });
  }

  List<Widget> getPickerItems(List<String> currencies) {
    List<Widget> pickerItems = [];
    for (int i = 0; i < 31; i++) {
      pickerItems.add(Text(
        currenciesFlagsList[i] + currencies[i],
        style: kBigNumStyle,
      ));
    }
    return pickerItems;
  }

}
