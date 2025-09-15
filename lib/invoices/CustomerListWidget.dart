import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/models/Customer.dart';
import 'package:appelsin/customer/CreateCustomerWidget.dart';
class CustomerListWidget extends StatefulWidget {
  final Function(Customer customer)  addCustomer;

  const CustomerListWidget({Key? key, required this.addCustomer}):super(key: key);
  @override
  State<StatefulWidget> createState() => _CustomerListWidget();

}

class _CustomerListWidget extends State<CustomerListWidget> {
List<Customer> _list = [];
  late final TextEditingController _searchController;
  int? _selectedIndex; // Til Radio groupValue

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
// ... existing code ...
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          'Vælg kunde',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
            fontSize: 20,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [

            Row(
              children: [
                Expanded(
                  child: Customwidgets.textField(
                    _searchController,
                    prefix: Icon(Icons.search),
                  ),
                ),
                SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    navigateWithSlide(context, CreateCustomerWidget(addCustomer:addCustomer), SlideDirection.left);
                  },
                  child: Text(
                    'Opret kunde',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xFF0354F0) /* primary-fresh-blue-fresh-blue-100 */,
                      fontSize: 14,
                      fontFamily: 'Figtree',
                      fontWeight: FontWeight.w600,
                      height: 1.71,
                    ),
                  ),
                )
              ],
            ),
            Expanded(child:  ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _list.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                Customer  c = _list[index];
                return ListTile(
                  onTap: () {

                    setState(() {
                      _selectedIndex = index;
                      widget.addCustomer(c);

                    });
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  title:Container(
                    height: 56,
                    padding: const EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF9F7F4) /* primary-dark-brown-beige-5 */,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: const Color(0xFFEEE3D8) /* primary-dark-brown-beige-20 */,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ... existing code ...
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Radio<int>(
                            value: index,
                            groupValue: _selectedIndex,
                            onChanged: (int? v) {
                              widget.addCustomer(c);
                              setState(() {
                                _selectedIndex = v;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            c.name,
                            style: TextStyle(
                              color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                              fontSize: 16,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w400,
                              height: 1.50,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFFE0E0E0)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
// ... existing code ...
  }
addCustomer(Customer customer){

    setState(() {
      _list.add(customer);
    });

}}