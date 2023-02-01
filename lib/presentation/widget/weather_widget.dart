import 'package:flutter/material.dart';
import '../../models/weather.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;

  const WeatherWidget({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(weather.location!.name.toUpperCase()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              color: Colors.blue.shade200,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  '${weather.location!.name},${weather.location!.region}, ${weather.location!.country}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Temperature in degree'),
                    Text(weather.current!.tempC.toString()),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Temperature in F'),
                    Text(weather.current!.tempF.toString()),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Humidity'),
                    Text(weather.current!.humidity.toString()),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Temperature in degree'),
                    Text(weather.current!.tempC.toString()),
                  ],
                ),
                const SizedBox(height: 20,),
              ],
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Expanded(flex: 1, child: Text('Updated At:')),
                    Expanded(
                        flex: 1,
                        child: Text(weather.current!.lastUpdated.toString())),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
