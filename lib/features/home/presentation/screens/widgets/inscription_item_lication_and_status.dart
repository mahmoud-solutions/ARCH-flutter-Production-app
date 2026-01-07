import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InscriptionItemLicationAndStatus extends StatelessWidget {
  const InscriptionItemLicationAndStatus({
    super.key,
    required this.location,
    required this.status,
  });

  final String location;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 16,
                color: Colors.grey,
              ),
              SizedBox(width: 4.w),
              Text(
                location,
                style: AppTextStyles.syleNorsalMedium10(
                  context,
                ).copyWith(color: Colors.grey),
              ),
            ],
          ),
          Expanded(
            child: Text(
              status,
              textAlign: TextAlign.end,
              style: AppTextStyles.syleNorsalMedium10(context),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
