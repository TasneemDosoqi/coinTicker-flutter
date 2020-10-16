import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/constants.dart';
import 'package:bitcoin_ticker/currency_container.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String fromSelectedCurrency = 'AUD';
  String toSelectedCurrency = 'BRL';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Currency Converter',
          style: kTitleStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CurrencyContainer(toSelectedCurrency),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('convert to', style: kTitleStyle),
                  Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        boxShadow: [containerShadow(kGreen)],
                        color: kGreen,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(
                        Icons.arrow_downward,
                        color: kWhite,
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CurrencyContainer(fromSelectedCurrency),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
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

}
