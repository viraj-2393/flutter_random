

import 'package:ambibuzz/controller/country_controller.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class WorldCountries extends StatefulWidget{
  @override
  State<WorldCountries> createState() => _WorldCountriesState();
}

class _WorldCountriesState extends State<WorldCountries>{
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  CountryController? countryController = CountryController();
  List<String> suggestions = ["United States", "Canada", "Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and/or Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Cook Islands", "Costa Rica", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecudaor", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France, Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Ivory Coast", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kosovo", "Kuwait", "Kyrgyzstan", "Lao People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfork Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia South Sandwich Islands", "South Sudan", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbarn and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States minor outlying islands", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City State", "Venezuela", "Vietnam", "Virigan Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zaire", "Zambia", "Zimbabwe"];
  bool isLoading = false;
  @override
  Widget build(BuildContext context){
    return Obx(
            () =>Scaffold(
              appBar: AppBar(
                title: const Text('Search Countries'),
                centerTitle: true,
              ),
              body: isLoading ?
              Center(child: CupertinoActivityIndicator(),):
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      SimpleAutoCompleteTextField(
                        key: key,
                        decoration: InputDecoration(
                          hintText: 'search country name...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey, width: 2),
                          ),
                        ),
                        //controller: TextEditingController(text: "Starting Text"),
                        suggestions: suggestions,
                        textChanged: (text) => currentText = text,
                        clearOnSubmit: true,
                        textSubmitted: (text)  {
                          setState((){
                            isLoading = true;
                          });
                          countryController!.getCountryData(text).then((value){
                            setState((){
                              isLoading = false;
                            });
                          });
                        },
                      ),

                      (countryController!.name != "".obs &&
                       countryController!.officialName != "".obs &&
                       countryController!.flag != "".obs
                      ) ? Column(
                        children: [
                          Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Image.network(
                                    countryController!.flag.toString(),
                                    errorBuilder: (context, exception, stackTrace){
                                      return Image.asset('assets/images/not_found.png',width: 90,);
                                    },
                                    width: 90,
                                  ),
                                  title: Text(countryController!.name.toString()),
                                  subtitle: Text(countryController!.officialName.toString()),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Area: ',style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text(countryController!.area.toString()+" kmsq")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Population: ',style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text(countryController!.population.toString())
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text('UN Member: ',style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text(countryController!.unMember == true ? 'Yes':'No')
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Independent: ',style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text(countryController!.independent == true ? 'Yes':'No')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Currency: ',style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text(countryController!.currency.toString())
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Text('1 USD: ',style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text(countryController!.rate_against_usd.toString())
                                        ],
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.sunny_snowing),
                                  title: Text(countryController!.description.toString()),
                                  subtitle: Text(countryController!.officialName.toString()),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Humidity: ',style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text(countryController!.humidity.toString()+" %"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Cloud: ',style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text(countryController!.cloud.toString()+" %")
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Temperature: ',style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text(countryController!.temperature.toString()+"°C")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Wind Speed: ',style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text(countryController!.windSpeed.toString()+" KPH")
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                          :
                          Container()


                    ],
                  ),
                ),
              ),
            )
    );
  }
}