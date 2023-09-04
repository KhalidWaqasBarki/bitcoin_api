import 'dart:convert';

import 'package:bitcoin_api/bcmodel.dart';
import 'package:bitcoin_api/models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class BitCoinMainPage extends StatefulWidget {
  const BitCoinMainPage({super.key});

  @override
  State<BitCoinMainPage> createState() => _BitCoinMainPageState();
}

class _BitCoinMainPageState extends State<BitCoinMainPage> {
  Future<BitCoinModel> fetchData() async {
    http.Response response = await http
        .get(Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json'));
    var jsondecode = json.decode(response.body);
    BitCoinModel bm = BitCoinModel.fromJson(jsondecode);
    return bm;
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlue,
        title: Center(child: Text('BitCoin API',style: GoogleFonts.oswald(fontWeight: FontWeight.bold),)),),
      backgroundColor: Colors.tealAccent,
      body: FutureBuilder(
          future: fetchData(),
          builder: (context, AsyncSnapshot<BitCoinModel> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Textt(text: 'TIME'),
                    MyCard(
                      text: snapshot.data!.time.updated,
                      colour: Colors.blueGrey[350],
                    ),
                    Textt(text: 'DISCLAIMER'),
                    MyCard(
                      text: snapshot.data!.disclaimer,
                      colour: Colors.blueGrey[350],
                    ),
                    Textt(text: 'RATES'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Textt(text: 'EUR'),
                          Expanded(
                              child: MyCard(
                            text: snapshot.data!.bpi.eur.rate,
                            colour: Colors.blueGrey[350],
                          ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Textt(text: 'USD'),
                          Expanded(
                              child: MyCard(
                            text: snapshot.data!.bpi.usd.rate,
                            colour: Colors.blueGrey[350],
                          ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Textt(text: 'GBP'),
                          Expanded(
                            child: MyCard(
                              text: snapshot.data!.bpi.gbp.rate,
                              colour: Colors.blueGrey[350],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
