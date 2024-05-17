import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScholarshipPage extends StatelessWidget {
  ScholarshipPage({super.key});

  Set<String> links = {
    'https://ssp.postmatric.karnataka.gov.in/',
    'https://scholarships.gov.in/',
    'http://gmsp.org',
  };
  Set<String> names = {
    'state scholarship portal',
    'National scholarship portal',
    'The Gates Millennium Scholars Program',
  };

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 400,
                  width: width,
                  child: Image.asset(
                    "Assets/Images/scholar.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
                // Text at the bottom
                Container(
                  padding: const EdgeInsets.only(top: 340),
                  //width: 200,
                  child: const Center(
                    child: Text(
                      'Scholarship Service Providers',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            for (int i = 0; i < names.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 0.001,
                        offset: const Offset(-3, -2),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 0.01,
                        offset: const Offset(3, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 50,
                  width: width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        names.elementAt(i),
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL(links.elementAt(i));
                        },
                        child: Text(
                          'Click here',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blue.withOpacity(0.6),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  //

  Future<void> _launchURL(String url) async {
    //final Uri uri = Uri(scheme: 'https', host: url);
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
