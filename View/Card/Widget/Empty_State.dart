import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image.asset('assets/images/tempsnip.png'),
        ),
        Text(
          '! محصولی در سبد خرید موجود نیست',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: Colors.grey),
        )
      ],
    ),
  );
}
