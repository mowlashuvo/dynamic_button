import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/blocs.dart';

class DynamicButtonView extends StatelessWidget {
  final String text;
  final int index;
  final double height;
  const DynamicButtonView({super.key, required this.text, required this.index, this.height = 40});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<DynamicButtonBloc>().add(ChangeDynamicButtonEvent(index: index));
      },
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // borderSide:
      // BorderSide(color: (value == index) ? Colors.green : Colors.black),
      child: BlocBuilder<DynamicButtonBloc, DynamicButtonState>(
        builder: (context, state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height,
                child: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Theme.of(context).primaryColor,
                  value: state.index==index?true:false,
                  onChanged: (value) {
                    context.read<DynamicButtonBloc>().add(ChangeDynamicButtonEvent(index: index));
                  },
                ),
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          );
        },
      ),
    );
  }
}
