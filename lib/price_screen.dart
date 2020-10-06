import 'package:bitcoin_ticker/constants.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'KSA';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Currency Converter',
          style: kTitleStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
         // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            currencyContainer(),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('convert to', style: kTitleStyle),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    boxShadow:[containerShadow(kGreen)],
                    color: kGreen,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child:Icon(
                    Icons.arrow_downward,
                    color: kWhite,
                  )
                )
              ],
            ),
            SizedBox(height: 20,),
            currencyContainer(),
            SizedBox(height: 20,),

            GestureDetector(
              onTap: () {},
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  boxShadow:[containerShadow(kBlue)],
                  color: kBlue,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(child: Text('Convert' ,style: kButtonStyle,) ),
              ),
            ),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }

  Expanded currencyContainer() {
    return Expanded(
      child: Container(
       // height: MediaQuery.of(context).size.height / 4,
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
              DropdownButton(

              ),
              Text('Enter your currency', style: kMessageStyle),
              TextField(
                decoration: InputDecoration(
                    alignLabelWithHint: false,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: kFillGray,
                    labelText: '00000.00',
                    labelStyle: kBigNumStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
