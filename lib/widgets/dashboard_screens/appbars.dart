import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appbars {
  //Main App Bar

  static PreferredSizeWidget mainAppBar() {
    return AppBar(
      toolbarHeight: 135,
      backgroundColor: const Color(0xffF6F6F6),
      elevation: 0.0,
      leadingWidth: double.infinity,
      leading: Padding(
        padding: const EdgeInsets.only(
          right: 12,
          top: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: Color(0xff374151),
                  ),
                  onPressed: () {},
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on_sharp,
                      color: Color(0xff32B768),
                      size: 16,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      "Gulshan-e-Iqbal, Karachi",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    const SizedBox(
                      width: 11,
                    )
                  ],
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    image: const DecorationImage(
                      scale: 2,
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/Profile.jpg'),
                    ),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                right: 23,
                left: 35,
              ),
              child: TextFormField(
                cursorColor: const Color(0xff9CA3AF),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.inter(
                    color: const Color(0xff9CA3AF),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: const EdgeInsets.only(
                    top: 0.0,
                    bottom: 0.0,
                    right: 0.0,
                    left: 0.0,
                  ),
                  fillColor: const Color(0xffE6E7E9),
                  filled: true,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 6,
                      top: 0.0,
                      bottom: 0.0,
                    ),
                    child: Icon(
                      Icons.search,
                      color: Color(0xff9CA3AF),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        11,
                      ),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        11,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Booking App Bar

  static PreferredSizeWidget bookingAppbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: const Color(0xff32B768),
      title: Text(
        'Booking History',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
    );
  }

  //Account App Bar

  static PreferredSizeWidget accountAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: const Color(0xffF6F6F6),
    );
  }

  static PreferredSizeWidget bookingDetailsAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color(0xff32B768),
      title: Text(
        'Details Restaurant',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
    );
  }
}
