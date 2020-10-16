import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> currenciesFlagsList = [
  ' 🇦🇺 ',
  ' 🇧🇷 ',
  ' 🇨🇦 ',
  ' 🇨🇳 ',
  ' 🇪🇺 ',
  ' 🇬🇧 ',
  ' 🇭🇰 ',
  ' 🇮🇩 ',
  ' 🇮🇳 ',
  ' 🇯🇵 ',
  ' 🇲🇽 ',
  ' 🇳🇴 ',
  ' 🇳🇿 ',
  ' 🇵🇱 ',
  ' 🇷🇴 ',
  ' 🇷🇺 ',
  ' 🇸🇪 ',
  ' 🇸🇬 ',
  ' 🇺🇸 ',
  ' 🇿🇦 '
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {}
