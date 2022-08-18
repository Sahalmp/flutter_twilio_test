import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  final String? title;

  const MyHomeScreen({Key? key, this.title}) : super(key: key);
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  late TwilioFlutter twilioFlutter;
  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC7e323e2de908da4ec5d62bfd8f799bbd',
        authToken: '8d9c52dc9f218389743e85dcd315b74c',
        twilioNumber: '+19705949183');
    super.initState();
  }

  void sendSms() async {
    twilioFlutter.sendSMS(
        toNumber: '+919633894729', messageBody: 'You have an appointment.');
  }

  void getSms() async {
    var data = await twilioFlutter.getSmsList();
    print(data);
    await twilioFlutter.getSMS('***************************');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.title!),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Press the button to send SMS.',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendSms,
        tooltip: 'Send Sms',
        child: Icon(Icons.send),
      ),
    );
  }
}
