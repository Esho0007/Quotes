import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QouteTile extends StatelessWidget {
  var quote = '';
  var author = '_';
  var onShareClick;
  var onLikeClick;
  var bgColor;

  QouteTile(
      {Key? key,
      required this.quote,
      required this.author,
      this.onShareClick,
      this.onLikeClick,
      required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(28),
        color: bgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: Colors.white.withOpacity(0.8), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    blurRadius: 30,
                    spreadRadius: 3,
                    offset: const Offset(-5, 5),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/inspire2.png',
                color: Colors.white.withOpacity(0.9),
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              quote,
              style: GoogleFonts.akronim(
                  fontWeight: FontWeight.normal,
                  fontSize: 32,
                  color: Colors.white.withOpacity(0.9)),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              author,
              style: GoogleFonts.abel(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white),
            ),
            const Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: onShareClick,
                  child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Favourite',
                            style: GoogleFonts.abel(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: onShareClick,
                  child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Share',
                            style: GoogleFonts.abel(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: onShareClick,
                  child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.not_interested_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Dislike',
                            style: GoogleFonts.abel(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
