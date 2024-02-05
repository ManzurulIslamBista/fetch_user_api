import 'package:fetch_api/model/Users.dart';
import 'package:fetch_api/provider/FetchApiProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleUserView extends StatelessWidget {
  Users userDetails;
  SingleUserView({super.key,required this.userDetails});
  String removeExtension(String phoneNumber) {
    RegExp regex = RegExp(r'\sx.*$');
    return phoneNumber.replaceAll(regex, '');
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: const Color(0xFF2AB27A),
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                  image: NetworkImage("https://cdn.vectorstock.com/i/1000x1000/73/23/developer-icon-defi-related-vector-41827323.webp"),
                  fit: BoxFit.fill
                )
          ),
        ),
        const SizedBox(width: 10,),
        Container(
          height: 100,
          width: (MediaQuery.of(context).size.width/1.5)-16,
          color: null,
          child:Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(userDetails.name.toString(),style: const TextStyle(fontSize: 19,fontWeight: FontWeight.bold,)),
                  ],
                ),
                Row(
                  children: <Widget>[

                    const Icon(Icons.email,size: 16,color: Color(0xFF647481)),
                    Text(" ${userDetails.email.toString()}",style: const TextStyle(fontSize: 16,color: Color(0xFF647481),fontWeight: FontWeight.w500,),),
                  ],

                ),
                Row(
                  children: <Widget>[

                    const Icon(Icons.phone,size: 16,color: Color(0xFF647481)),
                    Text(" ${removeExtension(userDetails.phone.toString())}",style: const TextStyle(fontSize: 16,color: Color(0xFF647481),fontWeight: FontWeight.w500),),
                  ],

                ),
                Row(
                  children: <Widget>[

                    const Icon(Icons.home,size: 16,color: Color(0xFF647481)),
                    Expanded(child:
                    Text(
                      " ${removeExtension(userDetails.address.street.toString())},${removeExtension(userDetails.address.city.toString())},Zip:${removeExtension(userDetails.address.zipcode.toString())}",
                      style: const TextStyle(fontSize: 16, color: Color(0xFF647481),fontWeight: FontWeight.w500),
                      maxLines: 1, // Set the maximum number of lines
                      overflow: TextOverflow.ellipsis, // Overflow property to display ellipsis
                    ),                    )
                  ],

                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
