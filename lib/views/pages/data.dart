part of 'pages.dart';

final List<double> xTitles = [];

bool toBool(dynamic value) {
  if (value is bool) {
    return value;
  } else if (value is int) {
    return value != 0;
  } else if (value is double) {
    return value != 0.0;
  } else if (value is String) {
    return value.toLowerCase() == 'true';
  } else {
    return false;
  }
}


late DatabaseReference dbNode;
final FirebaseFirestore fsNode = FirebaseFirestore.instance;

class DataFireStore {
  String dbEnergy = '';
  String dbVoltage = '';
  String dbCurrent = '';
  String dbPower = '';
  String dbFrequency = '';
  String dbPowerFactor = '';
  String dbTemperature = '';
  String dbHumidity = '';
  DataFireStore(this.dbEnergy, this.dbHumidity, this.dbPowerFactor, this.dbFrequency,
      this.dbPower, this.dbCurrent, this.dbVoltage, this.dbTemperature);

}


class DataPoint {
  final DateTime time;
  final String value;

  DataPoint(this.time, this.value);
}


class DataRTDB {
  bool dbRelay = false;
  String dbEnergy = '';
  String dbVoltage = '';
  String dbCurrent = '';
  String dbPower = '';
  String dbFrequency = '';
  String dbPowerFactor = '';
  String dbTemperature = '';
  String dbHumidity = '';

  DataRTDB(this.dbRelay, this.dbEnergy, this.dbHumidity,
      this.dbPowerFactor, this.dbFrequency,
      this.dbPower, this.dbCurrent, this.dbVoltage, this.dbTemperature);

}

Stream<QuerySnapshot> getDataNodeStream(String nameCollection) {
  return fsNode.collection(nameCollection)
      .orderBy('ID', descending: true)
      .limit(1)
      .snapshots();
}







Stream<QuerySnapshot> getDataChart(String nameCollection) {
  return fsNode.collection(nameCollection)
      .orderBy('ID', descending: true)
      .limit(10)
      .snapshots();
}

T toDouble<T>(dynamic value) {
  try {
    if (value is String) {
      return double.parse(value) as T;
    } else if (value is int) {
      return value.toDouble() as T;
    } else if (value is double) {
      return value as T;
    } else {
      throw FormatException('Invalid value');
    }
  } catch (e) {
    return 0.0 as T;
  }
}



List<double> bottomValue = [];
List<double> leftValue = [];


int count = 0;


Widget bottomTitleWidgets(double value, TitleMeta meta, int limit) {
  const style = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 8,
  );


  final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
  final formattedDate = DateFormat('dd/MM/yyyy\nHH:mm:ss').format(date);


  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Text(formattedDate, style: style),
  );
  return Container();
  count++;
}


Widget leftTitleWidgets(double value, TitleMeta meta) {
  final style1 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 11,
  );

  final style2 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 11,
  );

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16,
    child: Text(meta.formattedValue, style: style2),
  );

}

String _nameNodeCollection = 'Node1_Data';


class TextAlarmColor {
  Color colorEnergy = Colors.black;
  Color colorVoltage = Colors.black;
  Color colorCurrent = Colors.black;
  Color colorPower = Colors.black;
  TextAlarmColor(this.colorEnergy, this.colorVoltage, this.colorCurrent, this.colorPower);
}



TextAlarmColor getTextCard(DataFireStore dbNode, String value1, String value2, String value3, String value4 ) {
  TextAlarmColor textColor = TextAlarmColor(Colors.black, Colors.black, Colors.black, Colors.black);
  toDouble(dbNode.dbVoltage) >= toDouble(value1) ? textColor.colorVoltage = Colors.red : Colors.black;
  toDouble(dbNode.dbCurrent) >= (toDouble(value2) * 1000.0) ? textColor.colorCurrent = Colors.red : Colors.black;
  print('test1: ${toDouble(dbNode.dbCurrent)} aaaaa: ${(toDouble(value2) * 1000.0)}');
  toDouble(dbNode.dbEnergy) >= (toDouble(value3) * 1000.0) ? textColor.colorEnergy = Colors.red : Colors.black;
  toDouble(dbNode.dbPower) >= toDouble(value4) ? textColor.colorPower = Colors.red : Colors.black;

  return textColor;
}

Stream<DocumentSnapshot> getAlarmValue(String nameDoc) {
  return fsNode.collection('Alarm_Setting')
      .doc(nameDoc)
      .snapshots();
}








