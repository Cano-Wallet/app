import 'package:cano/core/utils/styles.dart';
import 'package:cano/core/utils/utils.dart';
import 'package:cano/features/general/z_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';
import 'package:supercharged/supercharged.dart';

import 'balance_card.controller.dart';

class BalanceUI extends GetView<BalanceCardController> {
  const BalanceUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZCard(
      title: 'Balance',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'ZNN',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.circle, color: Colors.green, size: 10)
                    ],
                  ),
                  Obx(
                    () => Text(
                      Utils.formatCurrency(AmountUtils.addDecimals(
                        controller.znn(),
                        znnDecimals,
                      )),
                      style: Styles.dashboardNumberStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'QSR',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.circle, color: Colors.blue, size: 10)
                    ],
                  ),
                  Obx(
                    () => Text(
                      Utils.formatCurrency(AmountUtils.addDecimals(
                        controller.qsr(),
                        qsrDecimals,
                      )),
                      style: Styles.dashboardNumberStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 15),
          Obx(
            () => PieChart(
              dataMap: {
                "ZNN": controller.znn().toDouble(),
                "QSR": controller.qsr().toDouble(),
              },
              colorList: const [
                Colors.green,
                Colors.blueAccent,
              ],
              animationDuration: 800.milliseconds,
              chartRadius: 600 / 10,
              initialAngleInDegree: 0,
              chartType: ChartType.disc,
              ringStrokeWidth: 10,
              legendOptions: const LegendOptions(
                showLegends: false,
              ),
              chartValuesOptions: const ChartValuesOptions(
                showChartValues: false,
              ),
              // gradientList: ---To add gradient colors---
              // emptyColorGradient: ---Empty Color gradient---
            ),
          ),
        ],
      ),
    );
  }
}
