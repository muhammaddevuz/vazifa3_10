import 'package:dars_3_9_uy_ishi/model/lesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LessonScreen extends StatefulWidget {
  Lesson lesson;
  LessonScreen({required this.lesson});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.lesson.title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "description: ${widget.lesson.description}",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 3,
              color: Colors.grey,
            ),
            for (var value in widget.lesson.quizes.values)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    value.question,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 0; i < value.options.length; i++)
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                value.check = !value.check;

                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: value.check == true
                                        ? null
                                        : Colors.blue,
                                    border: value.check == true
                                        ? Border.all(
                                            color: Colors.blue, width: 3)
                                        : null),
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                child: Text(
                                  "${i + 1}) ${value.options[i]}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            SizedBox(height: 10)
                          ],
                        )
                    ],
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
