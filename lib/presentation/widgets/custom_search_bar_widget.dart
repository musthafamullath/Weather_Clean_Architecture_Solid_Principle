import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/blocs/weather_bloc/weather_bloc_bloc.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/blocs/weather_bloc/weather_bloc_event.dart';

class CustomSearchBarWidget extends StatelessWidget {
  const CustomSearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search A Place',
          hintStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 24,
            ),
          ),
          suffixIcon: const IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        onChanged: (query) {
          // print("Query: $query");
          context
              .read<WeatherBloc>()
              .add(OnCityChanged(query));
        },
      ),
    );
  }
}

