import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/pallets.dart';
import 'package:url_launcher/url_launcher.dart';

class SendFeedback extends StatefulWidget {
  const SendFeedback({super.key});

  @override
  State<SendFeedback> createState() => _SendFeedbackState();
}

class _SendFeedbackState extends State<SendFeedback> {
  int selected = 0;
  final String recipientEmail = "ssarathcholakkall@gmail.com";
  var message = TextEditingController();
  var subject = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ListView(
        children: <Widget>[
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  2,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              selected = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: selected == index
                                    ? Theme.of(context).primaryColorLight
                                    : null,
                                border: Border.all(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color!)),
                            child: Text(index == 0 ? "Mail" : "SMS"),
                          ),
                        ),
                      ))),
          selected == 1
              ? Container()
              : textFieldCustome(
                  controller: subject,
                  hint: "Subject",
                  type: TextInputType.name),
          textFieldCustome(
              controller: message, hint: "Message", type: TextInputType.name),
          ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Pallete.logoGreenColor),
              ),
              onPressed: () {
                selected == 0
                    ? launchUrl(Uri.parse(
                        "mailto:$recipientEmail?subject=${subject.text}&body=${message.text}"))
                    : launchUrl(
                        Uri.parse("sms:+918891038454?body=${message.text}"));
              },
              child: Text(
                selected == 0 ? "Send Mail" : "Send SMS",
                style: Theme.of(context).textTheme.bodyLarge,
              ))
        ],
      )),
    );
  }
  //!=================extracted methods========================

  textFieldCustome(
      {required TextEditingController controller,
      required String hint,
      TextInputType? type}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Theme.of(context).cardColor)),
        ),
      ),
    );
  }
}
