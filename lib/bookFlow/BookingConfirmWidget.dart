
import 'package:appelsin/DashBoardWidget.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:appelsin/models/Booking.dart';
import 'package:flutter/material.dart';
import 'package:appelsin/apis/BookingApi.dart';
class Bookingconfirmwidget extends StatefulWidget {
final Appelsinbruger appelsinbruger;
final DateTime tidspunkt;
const Bookingconfirmwidget({Key? key, required this.appelsinbruger, required this.tidspunkt}): super(key: key);
  @override
  State<StatefulWidget> createState()  => _Bookingconfirmwidget();
}


class _Bookingconfirmwidget extends State<Bookingconfirmwidget> {
late Bookingapi _bookingapi;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
_bookingapi = Bookingapi();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Book tid"),),
    body: SafeArea(child: Container(
      child: Column(
        children: [
          Container(
            width: 400,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 48,
              children: [
                Container(
                  width: 159,
                  height: 128,
                  child:

                       Image.asset("assets/images/cfc2c04f950739b0f645ea35443a9df47e7b2039.png") ,


                ),
                Container(
                  width: double.infinity,
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
                      Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Text(
                              'Tak for at booke tid',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                                fontSize: 16,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w600,
                                height: 1.50,
                              ),
                            ),
                            SizedBox(
                              width: 336,
                              child: Text(
                                'Vi kontakter dig på dit telefonnummer på den dato og det tidspunkt du har valgt. Du kan ændre tidspunkt og telefonnummer her i app’en.',
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
                      Container(
                        width: double.infinity,
                        height: 1,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2CFBD) /* primary-dark-brown-beige-40 */,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                            SizedBox(
                              width: 280,
                              child: Text(
                                _formatDateTime(widget.tidspunkt),
                                style: TextStyle(
                                  color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                  fontSize: 14,
                                  fontFamily: 'Figtree',
                                  fontWeight: FontWeight.w400,
                                  height: 1.71,
                                ),
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                            SizedBox(
                              width: 280,
                              child: Text(
                                widget.appelsinbruger.PhoneNumber ?? '',
                                style: TextStyle(
                                  color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                  fontSize: 14,
                                  fontFamily: 'Figtree',
                                  fontWeight: FontWeight.w400,
                                  height: 1.71,
                                ),
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                            SizedBox(
                              width: 280,
                              child: Text(
                                widget.appelsinbruger.Email ?? '',
                                style: TextStyle(
                                  color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                  fontSize: 14,
                                  fontFamily: 'Figtree',
                                  fontWeight: FontWeight.w400,
                                  height: 1.71,
                                ),
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: ElevatedButton(onPressed: (){
              createBooking();
              navigateWithSlide(context, Dashboardwidget(), SlideDirection.down);
            }, child: Text("Færdig gå til din app")),
          )
        ],
      ),
    ))

  );
  }
  
  Future<void> createBooking() async{
  Booking booking = Booking(email: widget.appelsinbruger.Email, phone: widget.appelsinbruger.PhoneNumber!, appelsin_userid: widget.appelsinbruger.id!, tidspunkt:widget.tidspunkt );
  _bookingapi.create(booking);
  }

  String _formatDateTime(DateTime dt) {
    // Danish-like formatting without intl: "d. MMMM yyyy kl. HH:mm"
    final months = [
      'januar','februar','marts','april','maj','juni','juli','august','september','oktober','november','december'
    ];
    final d = dt.day;
    final m = months[dt.month - 1];
    final y = dt.year;
    final hh = dt.hour.toString().padLeft(2, '0');
    final mm = dt.minute.toString().padLeft(2, '0');
    return '$d. $m $y kl. $hh:$mm';
  }
}