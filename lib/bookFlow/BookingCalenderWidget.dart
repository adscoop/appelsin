import 'package:appelsin/bookFlow/BookingConfirmWidget.dart';
import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
class BookingCalenderWidget extends StatefulWidget {
final Appelsinbruger appelsinbruger;
const BookingCalenderWidget({Key? key, required this.appelsinbruger}):super(key: key);
  @override
  State<StatefulWidget> createState() => _BookingCalenderWidget();
}

class _BookingCalenderWidget  extends State<BookingCalenderWidget>  {
  final Map<String, String> _mapTider = {};
  // Selected time slot label: 'morgen' | 'middag' | 'eftermiddag'
  String _hvorofte = '';
  // Date bounds
  final DateTime _initialDate = DateTime.now();
  final DateTime _firstDate = DateTime.now().subtract(const Duration(days: 30));
  final DateTime _lastDate = DateTime.now().add(const Duration(days: 365));
  // Actual chosen date (defaults to today)
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book tid'),
      ),
      body: SingleChildScrollView(child: Container(

        child: Column(
          children: [
            Container(
              child: Text('Vælg et tidspunkt du vil ringes op på. Vi ringer op\n på dit telefonnummer ${widget.appelsinbruger.PhoneNumber}'),
            ),
            Container(
              height: 500,
              margin: const EdgeInsets.all(16),
              child: SizedBox(
                height: 300,
                child: CalendarDatePicker(
                  initialDate: _initialDate,
                  firstDate: _firstDate,
                  lastDate: _lastDate,
                  onDateChanged: (d) {
                    setState(() {
                      _selectedDate = d;
                    });
                  },
                ),
              ),
            ),
            Container(
              width: 370,
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 16,
                children: [
                  SizedBox(
                    width: 338,
                    child: Text(
                      _selectedDate != null
                          ? 'Tider den ${_formatDateHeadline(_selectedDate!)}'
                          : 'Vælg en dato ovenfor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                        fontSize: 16,
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w600,
                        height: 1.50,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2CFBD) /* primary-dark-brown-beige-40 */,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 24,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8,
                      children: [

                      Container(
                      width: 24,
                      height: 24,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 24,
                              height: 24,

                              child: _buildRadioOption('morgen'),
                            ),
                          ),
                        ],
                      ),
                    ),
                        SizedBox(
                          width: 149,
                          child: Text(
                            'Morgen',
                            style: TextStyle(
                              color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                              fontSize: 14,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w400,
                              height: 1.71,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 149,
                          child: Text(
                            '8:00 til 11:00',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                              fontSize: 14,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w400,
                              height: 1.71,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2CFBD) /* primary-dark-brown-beige-40 */,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 24,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8,
                      children: [

                      Container(
                      width: 24,
                      height: 24,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 24,
                              height: 24,

                              child: _buildRadioOption('middag'),
                            ),
                          ),
                        ],
                      ),
                    ),
                        SizedBox(
                          width: 149,
                          child: Text(
                            'Middag',
                            style: TextStyle(
                              color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                              fontSize: 14,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w400,
                              height: 1.71,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 149,
                          child: Text(
                            '11:00 til 14:00',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                              fontSize: 14,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w400,
                              height: 1.71,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2CFBD) /* primary-dark-brown-beige-40 */,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 24,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 24,
                                  height: 24,

                                  child: _buildRadioOption('eftermiddag'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 149,
                          child: Text(
                            'Eftermiddag',
                            style: TextStyle(
                              color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                              fontSize: 14,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w400,
                              height: 1.71,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 149,
                          child: Text(
                            '14:00 til 17:00',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                              fontSize: 14,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w400,
                              height: 1.71,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(left: 16, right:  16, top: 10, bottom: 10),
              child: ElevatedButton(
                  onPressed: _onBookPressed,
                  child: Text('Book'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 48),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right:  16, top: 10, bottom: 10),
              child: ElevatedButton(onPressed: (){}, child: Text('Spring over'), style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 48),
              )),
            )
          ],
        ),
      )),
    );

  }
  Widget _buildRadioOption(String label) {

      return  Radio<String>(
          overlayColor: WidgetStatePropertyAll(Colors.black12),
          value: label.toLowerCase(),
          groupValue: _hvorofte,
          onChanged: (value) {
            setState(() {
              _hvorofte = value ?? '';
            });
          },


    );
  }

  // Compose headline date like '11. juni 2025'
  String _formatDateHeadline(DateTime d) {
    final months = [
      'januar','februar','marts','april','maj','juni','juli','august','september','oktober','november','december'
    ];
    return '${d.day}. ${months[d.month-1]} ${d.year}';
  }

  // Map selected slot to a representative start time (local)
  DateTime? _composeSelectedDateTime() {
    final date = _selectedDate ?? _initialDate;
    int? hour;
    switch (_hvorofte) {
      case 'morgen':
        hour = 8; // 08:00
        break;
      case 'middag':
        hour = 11; // 11:00
        break;
      case 'eftermiddag':
        hour = 14; // 14:00
        break;
      default:
        return null; // no slot
    }
    return DateTime(date.year, date.month, date.day, hour, 0);
  }

  void _onBookPressed() {
    final dt = _composeSelectedDateTime();
    if (dt == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vælg dato og tidsrum')), 
      );
      return;
    }
    // Prevent booking in the past
    final now = DateTime.now();
    if (dt.isBefore(now)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidspunktet er i fortiden. Vælg et senere tidspunkt.')),
      );
      return;
    }
    navigateWithSlide(
      context,
      Bookingconfirmwidget(appelsinbruger: widget.appelsinbruger, tidspunkt: dt),
      SlideDirection.down,
    );
  }
}