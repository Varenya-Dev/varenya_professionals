import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:varenya_professionals/models/daily_mood_data/daily_mood_data.model.dart';
import 'package:varenya_professionals/services/records.service.dart';
import 'package:varenya_professionals/utils/logger.util.dart';
import 'package:varenya_professionals/utils/palette.util.dart';
import 'package:varenya_professionals/utils/responsive_config.util.dart';
import 'package:varenya_professionals/widgets/records/mood_chart.widget.dart';
import 'package:varenya_professionals/widgets/records/patient_record_list.widget.dart';

class UserRecord extends StatefulWidget {
  const UserRecord({Key? key}) : super(key: key);

  static const routeName = "/user-record";

  @override
  _UserRecordState createState() => _UserRecordState();
}

class _UserRecordState extends State<UserRecord> {
  late final RecordsService _recordsService;
  String? userId;

  @override
  void initState() {
    super.initState();

    this._recordsService = Provider.of<RecordsService>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    if (userId == null) {
      this.userId = ModalRoute.of(context)!.settings.arguments! as String;
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Palette.black,
                width: MediaQuery.of(context).size.width,
                height: responsiveConfig(
                  context: context,
                  large: MediaQuery.of(context).size.height * 0.3,
                  medium: MediaQuery.of(context).size.height * 0.3,
                  small: MediaQuery.of(context).size.height * 0.24,
                ),
                padding: EdgeInsets.all(
                  responsiveConfig(
                    context: context,
                    large: MediaQuery.of(context).size.width * 0.03,
                    medium: MediaQuery.of(context).size.width * 0.03,
                    small: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
                child: Text(
                  'Patient\nMood Track',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              StreamBuilder<DailyMoodData>(
                stream: this._recordsService.streamUserMood(this.userId!),
                builder: (BuildContext context,
                    AsyncSnapshot<DailyMoodData> snapshot) {
                  if (snapshot.hasError) {
                    dynamic errorCode = snapshot.error;
                    log.e(
                      "UserRecord Error",
                      snapshot.error,
                      snapshot.stackTrace,
                    );

                    return Text(
                      errorCode.code == "permission-denied"
                          ? 'User has not shared mood data with you'
                          : 'Something has went wrong, please try again later',
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  return Column(
                    children: [
                      MoodChart(
                        dailyMoodData: snapshot.data!,
                      ),
                      PatientRecordList(
                        dailyMoodData: snapshot.data!,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
