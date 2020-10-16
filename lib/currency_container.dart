import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class CurrencyContainer extends StatefulWidget {

  String selectedCurrency;
   CurrencyContainer(this.selectedCurrency);

  @override
  _CurrencyContainerState createState() => _CurrencyContainerState();
}

class _CurrencyContainerState extends State<CurrencyContainer> {
  int selectedIndex =0;

  List <Widget> getPickerItems() {

    List<Widget> pickerItems= [];
    for (int i =0; i< currenciesList.length ; i++) {

        pickerItems.add(Text(currenciesFlagsList[i] +currenciesList[i],style: kBigNumStyle,));
    }
    return pickerItems;
  }

  showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height / 3.5,
            child: CupertinoPicker(
              backgroundColor: Colors.white,
              onSelectedItemChanged: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              itemExtent: 40.0,
              children: getPickerItems(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:  MediaQuery.of(context).size.height / 3.5,
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
            Text('Select your currency type', style: kMessageStyle),
            GestureDetector(
              onTap: showPicker,
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
                        child: Text(currenciesFlagsList[selectedIndex] + currenciesList[selectedIndex] , style: kTitleStyle,),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.arrow_drop_down , color: kGray,),
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
    );
  }
}
