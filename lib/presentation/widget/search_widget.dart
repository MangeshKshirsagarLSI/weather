import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/presentation/pages/weather_page.dart';
import 'package:weather/viewmodels/blocs/search/search_bloc.dart';

import '../../models/cities.dart';

class SearchWidget extends StatefulWidget {
  final List<Cities> cities;

  const SearchWidget({Key? key, required this.cities}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchText = TextEditingController();

  @override
  void dispose() {
    _searchText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _searchText,
            autofocus: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
                hintText: 'Enter Location'
            ),
            validator: (value){
              if(value!=null&&value.length<3){
                return 'Enter location with at least three letters';
              }
            },
            onChanged: (value) {},
          ),
          TextButton(
              onPressed: () {
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchCitiesEvent(queryText: _searchText.text));
              },
              child: const Text('Search')),
          ListView.builder(
              itemCount: widget.cities.length,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    InkWell(
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          children: [
                        Text(widget.cities[i].name),
                        const Icon(Icons.navigate_next)
                      ]),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) =>
                                WeatherPage(location: widget.cities[i].name)));
                      },
                    ),
                    const Divider(),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
