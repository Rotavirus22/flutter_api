import 'package:flutter/material.dart';
import 'package:flutter_api/Models/Screens/details_model/detailState.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final detailState = Provider.of<DetailState>(context);
    final args = ModalRoute.of(context)!.settings.arguments as dynamic;
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text('Team'),
      ),
      body: detailState.isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Card(
                child: Column(
                  children: [
                    Text(detailState.teamsData!.teams![args-1].name!,style: TextStyle(
                      fontSize: 30,backgroundColor: Colors.black,color: Colors.white,
                    ),),
                    Image.network(detailState.teamsData!.teams![args - 1].flag!,fit:BoxFit.fill,),
                  ],
                ),
              ),
            ),
    );
  }
}
