import 'package:flutter/material.dart';
import '../../../../core/widgets/complaint_card.dart';
import '../../../../core/theming/color.dart';


class ComplaintsPage extends StatefulWidget {
  const ComplaintsPage({super.key});

  @override
  State<ComplaintsPage> createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor:AppColors.primary ,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "حالة الشكوى",
          style: TextStyle(fontSize: 20, color: AppColors.white , fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ComplaintCard(
                status: "منجزة",
                number: "123",
                date: "2025-09-08",
                time: "11:22 م",
                lastUpdate: "منذ يومين",
                
              ),

              const SizedBox(height: 20),

              ComplaintCard(
                status: "قيد المعالجة",
                number: "124",
                date: "2025-02-07",
                time: "2:30 م",
                lastUpdate: "منذ أسبوع",
             
              ),

              const SizedBox(height: 20),

              ComplaintCard(
                status: "مرفوضة",
                number: "125",
                date: "2025-05-03",
                time: "09:25 ص",
                lastUpdate: "منذ دقيقتين",
              
              ),
            ],
          ),
        ),
      ),
    );
  }
}