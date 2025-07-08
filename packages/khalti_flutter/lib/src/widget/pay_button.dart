// Copyright (c) 2021 The Khalti Authors. All rights reserved.

import 'package:flutter/material.dart';
import 'package:khalti_flutter/localization/khalti_localizations.dart';
import 'package:khalti_flutter/src/widget/color.dart';

/// The internal pay button for KPG interface.
class PayButton extends StatelessWidget {
  /// Creates [PayButton] with the provided properties.
  const PayButton({
    Key? key,
    required this.amount,
    required this.onPressed,
    this.textColor,
    this.iconColor,
    this.icon,
  }) : super(key: key);

  /// The [amount] in paisa.
  final int amount;

  /// Called when user presses the button.
  final VoidCallback onPressed;

  /// The color of the button text. Defaults to surface.shade900.
  final Color? textColor;

  /// The color of the button icon. Defaults to [textColor] or surface.shade900.
  final Color? iconColor;

  /// An optional leading icon for the button.
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _AmountWidget(amount: amount),
        const SizedBox(height: 32),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: KhaltiColor.of(context).surface.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 2,
            minimumSize: const Size(double.infinity, 48),
            textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: textColor ?? KhaltiColor.of(context).surface.shade900,
                ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: iconColor ?? textColor ?? KhaltiColor.of(context).surface.shade900,
                  size: 20,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                context.loc.pay.toUpperCase(),
                style: TextStyle(
                  color: textColor ?? KhaltiColor.of(context).surface.shade900,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AmountWidget extends StatelessWidget {
  const _AmountWidget({Key? key, required this.amount}) : super(key: key);

  final int amount;

  @override
  Widget build(BuildContext context) {
    final headline6 = Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.loc.amount,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: KhaltiColor.of(context).surface.shade50),
        ),
        const SizedBox(height: 4),
        Text(context.loc.rupee(amount / 100), style: headline6),
      ],
    );
  }
}
