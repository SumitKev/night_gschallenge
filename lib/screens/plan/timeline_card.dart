import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/plan/addEdit_timeline.dart';

class TimelineCard extends StatelessWidget {
  bool isActive;
  String time;
  String task;
  String duration;
  int index;
  Map<String, dynamic>? suggestion;
  TimelineCard(
      {required this.index,
      this.isActive = false,
      required this.task,
      required this.time,
      required this.duration,
      this.suggestion});

  String processDuration(String str) {
    var arr = str.split(':');
    String ans = "";
    ans += "${arr[0]} : ";
    ans += arr[1];
    return ans;
  }

  @override
  Widget build(BuildContext context) {
    duration = processDuration(duration);
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: isActive || index==0
            ? Theme.of(context).canvasColor
            : Theme.of(context).buttonColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                child: isActive || index==0
                    ? Icon(
                        Icons.star,
                        color: Colors.yellow[400],
                      )
                    : const Icon(
                        Icons.timer_outlined,
                        color: Colors.black,
                      ),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                child: Text(isActive ? "Now" : "Upcoming"),
              ),
              if (suggestion != null)
                Expanded(
                    child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward, color: Colors.black),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(suggestion!['route'].toString());
                    },
                  ),
                ))
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            width: double.infinity,
            height: 1,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: const Text(""),
          ),
          Container(
            padding: const EdgeInsets.all(7),
            child: Text(
              time,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  task,
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                            child: AddEditTimeline(index));
                      },
                      backgroundColor: Colors.white);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
