import 'package:energy_meter_app/shared/shared.dart';
import 'package:energy_meter_app/views/pages/pages.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(

        show: true,
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            // reservedSize: 50,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 50,
            getTitlesWidget: (value, meta) => leftTitleWidgets(value, meta),

          ),
        ),
        bottomTitles: AxisTitles(
          axisNameSize: 20,
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 40,
            getTitlesWidget: (value, meta) => bottomTitleWidgets(value, meta, 5)
          ),
        ),
      );
}
