import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mycountryapp/apicomponents/countrydetails.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycountryapp/themes/provider_themes.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryListScreen extends StatefulWidget {
  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  List<dynamic> countries = [];
  List<dynamic> filteredCountries = [];
  bool isLoading = true;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200) {
      setState(() {
        countries = json.decode(response.body);
        countries
            .sort((a, b) => a['name']['common'].compareTo(b['name']['common']));
        filteredCountries = List.from(countries);
        isLoading = false;
      });
    } else {
      throw Exception('countries failed to load');
    }
  }

  void filterCountries(String query) {
    setState(() {
      filteredCountries = countries
          .where((country) => country['name']['common']
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (Theme.of(context).brightness == Brightness.dark)
                  Image.asset(
                    'assets/images/whitelogo.png',
                    width: 98,
                    height: 24,
                  )
                else
                  Image.asset(
                    'assets/images/darklogo.png',
                    width: 98,
                    height: 24,
                  ),
                IconButton(
                  onPressed: () {
                    Provider.of<ProviderThemes>(context, listen: false)
                        .screenChanger();
                  },
                  icon: Icon(
                    // color: Theme.of(context).colorScheme.primary,
                    Theme.of(context).brightness == Brightness.light
                        ? Icons.light_mode
                        : Icons.dark_mode,
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Theme.of(context).colorScheme.primary,
                    filled: true,
                    labelText: 'Search Country',
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
            // language and filter
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 73.h,
                    height: 40.h,
                    child: Row(
                      children: [Icon(Icons.language), Text(' EN ')],
                    ),
                  ),
                  Container(
                    width: 73.h,
                    height: 40.h,
                    child: Row(
                      children: [Icon(Icons.filter_alt), Text(' FILTER')],
                    ),
                  )
                ],
              ),
            ),

            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: filteredCountries.length,
                      itemBuilder: (context, index) {
                        final country = filteredCountries[index];
                        return ListTile(
                          leading: Image.network(
                            country['flags']['png'],
                            width: 40,
                            height: 40,
                          ),
                          title: Text(
                            country['name']['common'],
                            style: TextStyle(
                             
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          subtitle: Text(
                            '${country['capital']?.join(', ') ?? 'N/A'}',
                            style: TextStyle(
                               fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          //  subtitle:Text(country['capital']['capital']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CountryDetailScreen(country: country),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
