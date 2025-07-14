import 'package:flutter/material.dart';
import '../core/network/states/status.dart';

class Dataloading extends StatelessWidget {
  Status status = Status.loading;
  Widget hasData;
  Dataloading({required this.status, required this.hasData});

  @override
  Widget build(BuildContext context) {
  
     if (status == Status.loading) {
        return Container();
      } else if (status == Status.error) {
        return Container();
      } else if (status == Status.completed) {
        return hasData;
      } else {
        return Container();
      }
  }
}
