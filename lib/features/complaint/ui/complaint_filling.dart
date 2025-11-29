import 'package:complaints_management/features/complaint/bussiness_logic/complaints_status.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/field_title.dart';
import '../../../../core/widgets/complaint_text_field.dart';
import '../../../../core/widgets/attach_button.dart';
import '../../../../core/theming/color.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  final typeController = TextEditingController();
  final entityController = TextEditingController();
  final locationController = TextEditingController();
  final descController = TextEditingController();

  final int complaintNumber = 1234;

  void clearAll() {
    typeController.clear();
    entityController.clear();
    locationController.clear();
    descController.clear();
    setState(() {});
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle,
                    size: 90, color: Colors.green),
                const SizedBox(height: 20),
                const Text(
                  "تم إرسال شكوتك بنجاح",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "رقم الشكوى المرجعي: $complaintNumber",
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text("تم",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void validateAndSubmit() {
    if (typeController.text.isEmpty ||
        entityController.text.isEmpty ||
        locationController.text.isEmpty ||
        descController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("يرجى تعبئة جميع الحقول"),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    showSuccessDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: const Text(
            "تقديم شكوى",
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,

          leading: IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),

          actions: [
            IconButton(
              icon: const Icon(Icons.list_alt, color: Colors.white),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ComplaintsPage() ));
                
              },
            ),
          ],
        ),

body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                const FieldTitle("نوع الشكوى"),
                ComplaintTextField(
                  controller: typeController,
                  hint: "ادخل نوع الشكوى",
                  onChanged: () => setState(() {}),
                ),

                const SizedBox(height: 15),
                const FieldTitle("الجهة المعنية"),
                ComplaintTextField(
                  controller: entityController,
                  hint: "ادخل الجهة المعنية بالشكوى",
                  onChanged: () => setState(() {}),
                ),

                const SizedBox(height: 15),
                const FieldTitle("موقع المشكلة"),
                ComplaintTextField(
                  controller: locationController,
                  hint: "ادخل الموقع",
                  onChanged: () => setState(() {}),
                ),

                const SizedBox(height: 15),
                const FieldTitle("وصف الشكوى"),
                ComplaintTextField(
                  controller: descController,
                  hint: "اكتب وصف تفصيلي للشكوى...",
                  maxLines: 5,
                  onChanged: () => setState(() {}),
                ),

                const SizedBox(height: 25),
                const Text(
                  "إرفاق الصور و الملفات",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    AttachButton(title: "إرفاق ملف", onPressed: () {}),
                    AttachButton(title: "إرفاق صورة", onPressed: () {}, ),
                  ],
                ),

                const SizedBox(height: 30),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: clearAll,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        child: const Text(
                          "إلغاء",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: validateAndSubmit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        child: const Text(
                          "إرسال",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}