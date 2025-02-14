import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryDetailScreen extends StatelessWidget {
  final dynamic country;

  CountryDetailScreen({required this.country});

  @override
  Widget build(BuildContext context) {
    Widget fineText(String label, String value) {
      return Text(
        '$label: $value',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          country['name']['common'],
          style: GoogleFonts.montserrat(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (country['flags'] != null)
              Image.network(
                country['flags']['png'],
                width: 380.w,
                height: 200.h,
              ),
            SizedBox(height: 10),

            Text(
              'Name: ${country['name']['common']}',
              style: TextStyle(
                 fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            fineText('Official Name', country['name']['official']),
            SizedBox(height: 5),
            fineText('Population', '${country['population']}'),
            SizedBox(height: 5),
            fineText('Capital', country['capital']?.join(', ') ?? 'N/A'),
            SizedBox(height: 5),
            fineText('Continent', country['continents']?.join(', ') ?? 'N/A'),
            SizedBox(height: 5),
            fineText('Country Code', country['cca2']),
            SizedBox(height: 5),
            if (country['president'] != null)
              fineText('President', country['president']),
            SizedBox(height: 5),
            if (country['states'] != null)
              fineText(
                  'States/Provinces', country['states']?.join(', ') ?? 'N/A'),

          ],
        ),
      ),
    );
  }
}
