import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/models/Customer.dart';
class CreateCustomerWidget extends StatefulWidget {
  final Function(Customer cus) addCustomer;


  const CreateCustomerWidget({Key? key, required this.addCustomer}): super(key: key);
  @override
  State<StatefulWidget> createState() => _CreateCustomerWidgetState();
}

class _CreateCustomerWidgetState extends State<CreateCustomerWidget> {
  String? _selectedCountry;
  List<String> _email = <String>[];
  List<String> _emailWork = <String>[];
  // Brug separate controllere for hvert felt
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cvrController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefonnummer = TextEditingController();
final TextEditingController city = TextEditingController();
  final List<String> _countries = [
    'Denmark', 'Germany', 'Sweden', 'Norway',
    'Finland', 'France', 'United Kingdom',
    'United States', 'India', 'China',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Opret kunde", style: TextStyle(fontWeight: FontWeight.w400)),
          bottom: TabBar(
            tabs: [

              Container(
                width: 160,
                height: 40,
                alignment: Alignment.center,
                child: Text('Erhverv'),
              ),
              Container(
                width: 160,
                height: 40,
                alignment: Alignment.center,
                child: Text('Privat'),
              ),

            ],
          ),
        ),
        body: TabBarView(
          children: [
            createCompanyUser(),
            createPrivateUser(),
          ],
        ),
      ),
    );
  }

  Widget createPrivateUser() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
        Customwidgets.buildLabel("Land", margin: EdgeInsets.only(left: 16, right: 16, bottom: 4, top: 8)),
          dropdownCountry(),
        Customwidgets.buildLabel("Navn", margin: EdgeInsets.only(left: 16, right: 16, bottom: 4, top: 8)),
    Customwidgets.textField(nameController),
          Customwidgets.buildLabel("CVR", margin: EdgeInsets.only(left: 16, right: 16, bottom: 4, top: 8)),
          Customwidgets. textField(cvrController),
          Customwidgets. buildLabel("Adresse", margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16), style: TextStyle(
            color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
            fontSize: 14,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w500,
          )),
          Customwidgets. buildLabel("Vejnavn", margin: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 4)),
          Customwidgets. textField(streetController),
          Customwidgets. buildLabel("Nummer", margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16)),
          Customwidgets. textField(numberController),
          Row(
            children: [
              Expanded(child: Column( children: [
                Customwidgets. buildLabel("Postnummer", margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16)),
                Customwidgets. textField(zipController)
              ]

              )),
              Expanded(child: Column(
                children: [
                  Customwidgets. buildLabel("By", margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16)),
                  Customwidgets. textField(city),
                ]

              ))
            ],
          ),
          Customwidgets. buildLabel("Email", margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16)),
          Customwidgets. textField(emailController),

   if(_email.length > 0)
   listEmails(),
   addEmail(),
          Customwidgets.buildLabel("Telefonnummer", margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16)),
          Customwidgets.textField(telefonnummer),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),

            child:    ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 22),
                backgroundColor: Color(0xFF0354F0)
              ),
              onPressed: () {
                Customer cu  = Customer(country:  _selectedCountry ??'',name: nameController.value.text, emails: _email, by:city.value.text,nummer: int.tryParse(nameController.value.text) ?? 0, postnummer: int.parse(zipController.value.text), telefon:  telefonnummer.value.text, vejnavn:streetController.value.text, cpr: cvrController.value.text, email: emailController.value.text);
                widget.addCustomer(cu);

                },
              child: Text(
                'Opret kunde',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Figtree',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )

        ],
      ),
    );
  }

  Widget createCompanyUser() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Customwidgets.buildLabel("Land", margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16)),
          dropdownCountry(),
          Customwidgets. buildLabel("Firma navn", margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16)),
          Customwidgets. textField(nameController),
          Customwidgets. buildLabel("CVR", margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16)),
          Customwidgets. textField(cvrController),
          Customwidgets. buildLabel("Adresse", margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16)),
          Customwidgets. buildLabel("Vejnavn", margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16)),
          Customwidgets. textField(streetController),
          Customwidgets. buildLabel("Nummer", margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16)),
          Customwidgets. textField(numberController),
          Row(
            children: [
              Expanded(child: Column( children: [
                Customwidgets. buildLabel("Postnummer", margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16)),
                Customwidgets. textField(zipController)
              ]

              )),
              Expanded(child: Column(
                  children: [
                    Customwidgets. buildLabel("By", margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16)),
                    Customwidgets. textField(city),
                  ]

              ))
            ],
          ),
          Customwidgets. buildLabel("Email", margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16)),
          Customwidgets. textField(emailController),

          if(_email.length > 0)
            listEmails(),
          addEmail(),
          Customwidgets.buildLabel("Telefonnummer", margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16)),
          Customwidgets.textField(telefonnummer),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),

            child:    ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 22),
                  backgroundColor: Color(0xFF0354F0)
              ),
              onPressed: () {
                Customer cu  = Customer(country:  _selectedCountry ??'',name: nameController.value.text, emails: _email, by:city.value.text,nummer: int.tryParse(nameController.value.text) ?? 0, postnummer: int.parse(zipController.value.text), telefon:  telefonnummer.value.text, vejnavn:streetController.value.text, cvr: cvrController.value.text, email: emailController.value.text);
               widget.addCustomer(cu);

              },
              child: Text(
                'Opret kunde',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Figtree',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget addEmail() {
    return        Container(
      margin: EdgeInsets.only(left: 50, right: 50),
      child: ElevatedButton(onPressed: () {
        emailSheet();
      }, child: Text(
        'Tilføj modtager e-mail',
        textAlign: TextAlign.center,

      ),

        style:    ElevatedButton.styleFrom(
            fixedSize: Size(210, 22),
            backgroundColor: Color(0xFFF9F7F4)
        ),),
    );
}


  Future<void> emailSheet() async {
    final TextEditingController controller = TextEditingController();
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        final bottomInset = MediaQuery.of(context).viewInsets.bottom;
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: bottomInset + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tilføj e-mail',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Skriv e-mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
                autofocus: true,
                onSubmitted: (_) {
                  // valider og tilføj på enter
                  final value = controller.text.trim();
                  if (value.isNotEmpty) {
                    addElementToList(value);
                    Navigator.of(context).pop();
                  }
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0354F0),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    final value = controller.text.trim();
                    if (value.isEmpty) return;
                    addElementToList(value);
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Tilføj',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  Widget listEmails() {

    return      ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _email.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final email = _email[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          title:Container(
            width: double.infinity,
            height: 48,
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: const Color(0xFFF3F7FF) /* primary-fresh-blue-fresh-blue-5 */,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: const Color(0xFFCCDDFE) /* primary-fresh-blue-fresh-blue-20 */,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child:  Text(email )
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline, color:  Color(0xFF0354F0)),
            onPressed: () {
              setState(() {
                _email.removeAt(index);
              });
            },
            tooltip: 'Fjern',
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFE0E0E0)),
            borderRadius: BorderRadius.circular(8),
          ),
        );
      },
    );

  }

  Widget emailItem(){
    return Container(
      child: TextField(),
    );

  }
  Widget dropdownCountry() {
    return SizedBox(
      width: 370,
        child:   DropdownButtonFormField<String>(
      value: _selectedCountry,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
      ),
      items: _countries.map((country) {
        return DropdownMenuItem(
          value: country,
          child: Text(country, style: TextStyle(fontSize: 14)),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedCountry = value;
        });
      },
    ));
  }

  Future<void> addElementToList(String value) async {
    setState(() {
      _email.add(value);
    });
  }


}
