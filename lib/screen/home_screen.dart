import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFC4C3C9),
        body: SafeArea(
          bottom: false,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                _TopPart(
                  selectedDate: selectedDate,
                  onPressed: onHeartPressed,
                ),
                _BottonPart(),
              ],
            ),
          ),
        ));
  }

  onHeartPressed() {
    final now = DateTime.now();

    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: 300.0,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: selectedDate,
                maximumDate: DateTime(
                  now.year,
                  now.month,
                  now.day,
                ),
                onDateTimeChanged: (DateTime date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
            ),
          );
        });
  }
}

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;

  _TopPart({required this.selectedDate, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final now = DateTime.now();

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'U&I',
            style: textTheme.displayLarge,
          ),
          Column(
            children: [
              Text(
                'Started to work at',
                style: textTheme.bodyLarge,
              ),
              Text(
                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: textTheme.bodyMedium,
              ),
            ],
          ),
          IconButton(
            iconSize: 60.0,
            onPressed: onPressed,
            icon: Icon(
              Icons.work_history,
              color: Colors.white,
            ),
          ),
          Text(
            'D+${DateTime(
                  now.year,
                  now.month,
                  now.day,
                ).difference(selectedDate).inDays + 1}',
            style: textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}

class _BottonPart extends StatelessWidget {
  const _BottonPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        'asset/img/middle_image.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
