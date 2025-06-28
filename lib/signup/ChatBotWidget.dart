import 'dart:ffi';
import 'dart:math';

import 'package:appelsin/signup/VerifyPhoneNumberWidget.dart';
import 'package:flutter/material.dart';

class ChatBotWidget extends StatefulWidget {
  @override
  _ChatBotWidgetState createState() => _ChatBotWidgetState();
}

class _ChatBotWidgetState extends State<ChatBotWidget> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

String welcome = "Hej og velkommen til Appelsin";
String welcome2 = "Hvad er dit navn";
int index =0;
String fornavn = "";
String efternavn ="";
int telefonnummer=0;
bool showBottom = false;
int getIndex() {
  return index;
}

void setIndex(int i) {
  index = i;
}

void setFornavn(String fornavn) {
  this.fornavn = fornavn;
}

String getFornavn(){
  return this.fornavn;
}

void setEfternavn(String efternavn) {
  this.efternavn = efternavn;
}

String? getEfternavn(){
  return this.efternavn;
}

void setTelefonnummer(int cvr) {
  this.telefonnummer = cvr;
}

int? getTelefonnummer(){
  return this.telefonnummer;
}

@override
void initState() {
    super.initState();
    _sendMessage(welcome);
    _sendMessage(welcome2);

  }
  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({"role": "user", "text": text});
    });

    _controller.clear();

    // Scroll to bottom
    _scrollToBottom();

    // Simulated bot response
    Future.delayed(Duration(milliseconds: 600), () {
      // Skip bot response if both "Hej" and "Appelsin" are NOT in the text
      if (!(text.contains("Hej") && !text.contains("Appelsin"))) {
        final botResponse = _generateBotResponse(text);
if(botResponse == "Tak!") {
  _generateBotResponse("");
}
        if (botResponse != null && botResponse.trim().isNotEmpty) {
          setState(() {
            _messages.add({
              "role": "bot",
              "text": botResponse,
            });
          });
          _scrollToBottom();
        }
      }
    });


  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 100,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  String? _generateBotResponse(String userInput) {
    final welcome = "Hej og velkommen til Appelsin";
    final welcome2 = "Hvad er dit navn";

    if (userInput != welcome && userInput != welcome2 && getIndex() == 0) {
      setFornavn(userInput);
      setIndex(1);
      return "Hej $userInput 😊 Hvad er dit efternavn?";
    } else if (getIndex() == 1) {
      setEfternavn(userInput);
      setIndex(2);
      return "Okay $fornavn $efternavn. Hvad er dit telefonnummer?";
    } else if (getIndex() == 2) {
      final phone = int.tryParse(userInput);
      if (phone != 0 ) {
        setTelefonnummer(phone!);
        setIndex(3);
        return "Vi sender dig en SMS for at \n verificere det næste trin. Hvad er din \n e-mail addresse ";
      } else if(getIndex() == 3){
        return "Det ligner ikke et gyldigt telefonnummer. Prøv igen.";
      }
    } else if (getIndex() == 3) {
      setIndex(4);
      return "Tak! Til sidst skal vi høre hvad dit firma hedder";
    }  else if(getIndex() == 4){
      setState(() {
              showBottom = true;
            });
    }

    return null;
  }






  Widget _buildMessage(Map<String, String> message) {
    bool isUser = message["role"] == "user";
    return Align(
      alignment: isUser ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isUser ? Colors.orange : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(isUser ? 16 : 0),
            bottomRight: Radius.circular(isUser ? 0 : 16),
          ),
        ),
        child: Text(
          message["text"] ?? "",
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(),
        body:
    Container(
  margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
    child:
    Column(
      children: [
        // Chat Messages
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return _buildMessage(_messages[index]);
            },
          ),
        ),
        if(!showBottom)
        Divider(height: 1),
        // Input Field
        if(!showBottom)
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  onSubmitted: _sendMessage,
                  decoration: InputDecoration(
                    hintText: "Type a message...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              SizedBox(width: 6),
              CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                child: IconButton(
                  icon: Icon(Icons.send, color: Colors.white),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ),
            ],
          ),
        ),
        if(showBottom)
        (onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Verifyphonenumberwidget(phonenumber: telefonnummer)));

        },

          child: Text("Verificere"),
        )
      ],
    )));
  }


  bool containsWordStartingWithCapital(String input) {
    final regex = RegExp(r'\b[A-Z][a-zA-Z]*\b');
    return regex.hasMatch(input);
  }

}
