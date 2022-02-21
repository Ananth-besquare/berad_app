// ignore_for_file: avoid_print, unused_import, non_constant_identifier_names, camel_case_types, prefer_const_constructors, empty_constructor_bodies, no_logic_in_create_state, prefer_const_literals_to_create_immutables, unused_label, unused_field

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'chart.dart';

class Graph extends StatefulWidget {
  const Graph({Key? key}) : super(key: key);

  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  late ChartSeriesController _chartSeriesController;

  String symbolName = "Volatility 50 Index";
  String symbol = "R_50";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int counts = 4;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color.fromRGBO(8, 217, 217, 100),
        title: Center(
          child: Text(
            symbolName,
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 400,
              width: double.infinity,
              child: chartBuilder(
                symbol: symbol,
                counts: counts,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Icon(Icons.watch_later_outlined),
              ),
              Text(
                "Time Intervals",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              ToggleSwitch(
                fontSize: 11,
                iconSize: 8.0,
                minWidth: 60,
                inactiveBgColor: Colors.grey.shade400,
                activeFgColor: Colors.black,
                activeBgColor: [Colors.grey],
                initialLabelIndex: 4,
                totalSwitches: 4,
                labels: ['1 Hour', '1 Day', '7 Days', '30 Days'],
                onToggle: (index) {
                  counts = index as int;
                },
              )
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: () {},
                  child: SizedBox(
                    height: 40,
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.black,
                        ),
                        Text(
                          "Rise",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {},
                  child: SizedBox(
                    height: 40,
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.black,
                        ),
                        Text(
                          "Fall",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
