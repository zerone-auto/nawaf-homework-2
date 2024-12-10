import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/nawaf_custom_textfield.dart';
import '../widgets/nawaf_custom_button.dart';
import '../utils/nawaf_validators.dart';
import '../theme/nawaf_colors.dart';

class NawafFormScreen extends StatefulWidget {
  const NawafFormScreen({Key? key}) : super(key: key);

  @override
  State<NawafFormScreen> createState() => _NawafFormScreenState();
}

class _NawafFormScreenState extends State<NawafFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'تم بنجاح',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Cairo'),
          ),
          backgroundColor: NawafColors.successColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NawafColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'نموذج المعلومات',
          style: TextStyle(
            color: NawafColors.textColor,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: NawafColors.primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              NawafCustomTextField(
                controller: _emailController,
                label: 'البريد الإلكتروني',
                validator: NawafValidators.validateEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              NawafCustomTextField(
                controller: _phoneController,
                label: 'رقم الهاتف',
                validator: NawafValidators.validatePhone,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              NawafCustomTextField(
                controller: _nameController,
                label: 'الاسم',
                validator: NawafValidators.validateText,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              NawafCustomTextField(
                controller: _descriptionController,
                label: 'الوصف',
                validator: NawafValidators.validateText,
                keyboardType: TextInputType.text,
                maxLines: 3,
              ),
              const SizedBox(height: 40),
              NawafCustomButton(
                onPressed: _submitForm,
                text: 'إرسال',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
