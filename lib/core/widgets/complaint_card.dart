import 'package:flutter/material.dart';
import 'complaint_detail_row.dart';
import '../theming/color.dart';


class ComplaintCard extends StatefulWidget {
  final String status;
  final String number;
  final String date;
  final String time;
  final String lastUpdate;
  

  const ComplaintCard({
    super.key,
    required this.status,
    required this.number,
    required this.date,
    required this.time,
    required this.lastUpdate,
    
  });

  @override
  State<ComplaintCard> createState() => _ComplaintCardState();
}

class _ComplaintCardState extends State<ComplaintCard> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppColors.greyMedium),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // دائرة الحالة
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.status,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.white, fontSize: 14),
                ),
              ),

              Text(
                "شكوى ${widget.number}",
                style: TextStyle(
                  fontSize: 22,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text("التاريخ : ${widget.date}",
              textAlign: TextAlign.right,
              style: TextStyle(color: AppColors.greyDark, fontSize: 15)),

          Text("الوقت : ${widget.time}",
              textAlign: TextAlign.right,
              style: TextStyle(color: AppColors.greyDark, fontSize: 15)),

          Text("آخر تحديث : ${widget.lastUpdate}",
              textAlign: TextAlign.right,
              style: TextStyle(color: AppColors.greyDark, fontSize: 15)),

          const SizedBox(height: 15),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                setState(() {
                  showDetails = !showDetails;
                });
              },
              child: Text(
                showDetails ? "إخفاء التفاصيل" : "عرض التفاصيل",
                style: const TextStyle(fontSize: 17, color: AppColors.white),
              ),
            ),
          ),

          // تفاصيل الشكوى
          if (showDetails)
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.greyLight,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  ComplaintDetailRow(title: "الحالة الحالية", value: "منجزة" ,),
                  ComplaintDetailRow(title: "نوع الشكوى", value: "خدمة سيئة"),
                  ComplaintDetailRow(title: "الجهة المعنية", value: "بلدية جديدة عرطوز"),
                  ComplaintDetailRow(title: "موقع المشكلة", value: "جديدة عرطوز البلد - شارع مارديني"),
                  ComplaintDetailRow(title: "وصف الشكوى", value: "وجود حفرة في بداية الشارع "),
                ],
              ),
            ),
        ],
      ),
    );
  }
}