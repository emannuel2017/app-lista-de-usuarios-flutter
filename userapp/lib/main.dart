import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;// biblioteca para requisições
import 'dart:async';// utilizar async
import 'dart:convert';// converte para json

void main() {
   runApp(
     MaterialApp(
       home: _HomePage()  
     ),
   );
}

class _HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage>{
   
   Map data;
   List userData;
   String a = '{"users":[{"_id":"5d3494705563ff3184b59b69","firstName":"Jenifer","lastName":"Upton","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/isacosta/128.jpg","__v":0},{"_id":"5d3494715563ff3184b59b6a","firstName":"Milo","lastName":"Kautzer","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/sokaniwaal/128.jpg","__v":0},{"_id":"5d3494715563ff3184b59b6b","firstName":"Rebeka","lastName":"Blanda","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/davidmerrique/128.jpg","__v":0},{"_id":"5d3494715563ff3184b59b6c","firstName":"Frederic","lastName":"Prosacco","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/angelcolberg/128.jpg","__v":0},{"_id":"5d3494715563ff3184b59b6d","firstName":"Mario","lastName":"Bashirian","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/gmourier/128.jpg","__v":0},{"_id":"5d3494715563ff3184b59b6e","firstName":"Lavern","lastName":"Greenholt","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/marcobarbosa/128.jpg","__v":0},{"_id":"5d3494735563ff3184b59b6f","firstName":"Nyah","lastName":"Beer","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/francis_vega/128.jpg","__v":0},{"_id":"5d3494735563ff3184b59b70","firstName":"Marlene","lastName":"Jenkins","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/dss49/128.jpg","__v":0},{"_id":"5d3494735563ff3184b59b71","firstName":"Jayme","lastName":"Jacobs","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/txcx/128.jpg","__v":0},{"_id":"5d3494735563ff3184b59b72","firstName":"Cassandre","lastName":"Von","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/ludwiczakpawel/128.jpg","__v":0},{"_id":"5d3494735563ff3184b59b73","firstName":"Jorge","lastName":"Kunde","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/joannefournier/128.jpg","__v":0},{"_id":"5d3494735563ff3184b59b74","firstName":"Oceane","lastName":"Johns","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/desastrozo/128.jpg","__v":0},{"_id":"5d34947d5563ff3184b59b75","firstName":"Elvie","lastName":"Cummerata","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/danro/128.jpg","__v":0},{"_id":"5d34947d5563ff3184b59b76","firstName":"Narciso","lastName":"Emard","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/_dwite_/128.jpg","__v":0},{"_id":"5d34947d5563ff3184b59b77","firstName":"Clement","lastName":"Bailey","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/adhamdannaway/128.jpg","__v":0},{"_id":"5d34947d5563ff3184b59b78","firstName":"Otho","lastName":"Quitzon","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/janpalounek/128.jpg","__v":0},{"_id":"5d34947d5563ff3184b59b79","firstName":"Belle","lastName":"Purdy","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/thaodang17/128.jpg","__v":0},{"_id":"5d34947d5563ff3184b59b7a","firstName":"Annetta","lastName":"Koepp","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/mufaddal_mw/128.jpg","__v":0}]}';
    getUsers() async{
    http.Response response = await http.get('http://10.0.2.2:3333/api/users');
     data = json.decode(response.body);
     setState(() {
       userData = data['users']; 
       print(userData);

     });
   }
   
   @override
   void initState(){
     super.initState();
     getUsers();
   }

   Widget build(BuildContext context){
     return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
         title: Text("User"),
         backgroundColor: Colors.black12
         ),
       body: ListView.builder(
         itemCount: userData == null ? 0 : userData.length,
         itemBuilder: (BuildContext context, int index){
           return Card(
             child: Padding(
               padding: const EdgeInsets.all(12.0),
               child: Row(
                 children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: Text("${index + 1}",
                         style: TextStyle(
                            fontSize: 20.0,
                           fontWeight: FontWeight.w500
                      ),
                     )
                   ),
                   CircleAvatar(backgroundImage: NetworkImage(userData[index]['avatar']),),
                   Padding(
                     padding: EdgeInsets.all(10.0),
                     child: Text("${userData[index]["firstName"]} ${userData[index]["lastName"]}",
                     style: TextStyle(
                       fontSize: 20.0,
                       fontWeight: FontWeight.w700
                       
                     ),)
                   )        
                 ],
               ),
             ),
           );
         },
       )  
     );
   }
}