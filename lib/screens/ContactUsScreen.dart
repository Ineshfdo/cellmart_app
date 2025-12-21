// ignore_for_file: unused_local_variable, duplicate_ignore
import 'dart:io';
import 'package:cellmart_app/components/InfoSection.dart';
import 'package:cellmart_app/components/MainInfoSection.dart';
import 'package:cellmart_app/components/footer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  // Form Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  String _topic = 'General Inquiry';
  bool _acceptTerms = false;
  double _urgency = 2;

  // Image Picker Logic
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  bool get _canPickImage {
    if (kIsWeb) return false;
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  Future<void> _pickImage(ImageSource source) async {
    if (!_canPickImage) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Image picker not supported on this platform."),
        ),
      );
      return;
    }

    final image = await _picker.pickImage(source: source);
    if (image != null && mounted) {
      setState(() => _selectedImage = image);
    }
  }

  void _submitForm() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();

    if (name.isEmpty || email.isEmpty || !_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in your name, email, and accept terms."),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Thank you, $name! We will respond to $email.")),
    );

    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();

    setState(() {
      _selectedImage = null;
      _topic = 'General Inquiry';
      _acceptTerms = false;
      _urgency = 2;
    });
  }

  InputDecoration _inputDecoration(String hint, bool isDark) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: isDark ? Colors.grey.shade800 : Colors.grey.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
    );
  }

  Widget _imagePickerUI(bool isDark, Color? textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          "Attach Image (optional)",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 12,
          children: [
            OutlinedButton.icon(
              onPressed: () => _pickImage(ImageSource.camera),
              icon: const Icon(Icons.camera_alt),
              label: const Text("Camera"),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => _pickImage(ImageSource.gallery),
              icon: const Icon(Icons.photo_library),
              label: const Text("Gallery"),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
        if (_selectedImage != null) ...[
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.file(
              File(_selectedImage!.path),
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = theme.textTheme.bodyLarge?.color;
    final bgColor = theme.scaffoldBackgroundColor;

    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 900;
    final isLandscape = size.width > size.height;

    final contactCards = [
      Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        color: isDark
            ? Colors.grey[850]
            : const Color.fromARGB(255, 233, 233, 233),
        child: const ListTile(
          leading: Icon(Icons.email, color: Colors.blueAccent),
          title: Text("Email Address"),
          subtitle: Text("Cellmart@gmail.com"),
        ),
      ),
      Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        color: isDark
            ? Colors.grey[850]
            : const Color.fromARGB(255, 233, 233, 233),
        child: const ListTile(
          leading: Icon(Icons.phone, color: Colors.black),
          title: Text("Phone Number"),
          subtitle: Text("075-869-0018"),
        ),
      ),
      Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        color: isDark
            ? Colors.grey[850]
            : const Color.fromARGB(255, 233, 233, 233),
        child: const ListTile(
          leading: Icon(Icons.video_library, color: Colors.red),
          title: Text("YouTube Channel"),
          subtitle: Text("CellMart2.0"),
        ),
      ),
      Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        color: isDark
            ? Colors.grey[850]
            : const Color.fromARGB(255, 233, 233, 233),
        child: const ListTile(
          leading: Icon(Icons.chat, color: Colors.green),
          title: Text("WhatsApp"),
          subtitle: Text("075-869-0018"),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "Contact CellMart",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Color(0xFF0A4C8A),
              fontFamily: "Nano",
            ),
          ),
        ),
        backgroundColor: bgColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: isDark ? Colors.grey[700] : Colors.grey[300]),

            MainInfoSection(
              imagePath: "assets/images/store12.jpg",
              content1:
                  "At CellMart, we prioritize our customers above all. Whether you have a question about our products, need assistance with an order, or want to provide feedback, we are here to help.",
              content2:
                  "You can reach out to us via email, phone, or through our social media channels. We value communication and are always open to hearing from you.",
            ),

            Divider(color: isDark ? Colors.grey[700] : Colors.grey[300]),

            // CONTACT DETAILS SECTION
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Details",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: textColor,
                      fontFamily: "Nano",
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (isDesktop || isLandscape)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(children: contactCards.sublist(0, 2)),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(children: contactCards.sublist(2, 4)),
                        ),
                      ],
                    )
                  else
                    Column(children: contactCards),
                ],
              ),
            ),

            Divider(color: isDark ? Colors.grey[700] : Colors.grey[300]),

            // CONTACT FORM SECTION
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1100),
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey.shade900 : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 25,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Get In Touch",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF0A4C8A),
                          fontFamily: "Nano",
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Responsive Form Fields
                    if (isDesktop)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextField(
                                  controller: _nameController,
                                  decoration: _inputDecoration(
                                    "Your Name",
                                    isDark,
                                  ),
                                  style: TextStyle(color: textColor),
                                ),
                                const SizedBox(height: 16),
                                TextField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: _inputDecoration(
                                    "Your Email",
                                    isDark,
                                  ),
                                  style: TextStyle(color: textColor),
                                ),
                                const SizedBox(height: 16),
                                TextField(
                                  controller: _subjectController,
                                  decoration: _inputDecoration(
                                    "Subject",
                                    isDark,
                                  ),
                                  style: TextStyle(color: textColor),
                                ),
                                const SizedBox(height: 16),
                                DropdownButtonFormField<String>(
                                  value: _topic,
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'General Inquiry',
                                      child: Text('General Inquiry'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Feedback',
                                      child: Text('Feedback'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Support',
                                      child: Text('Support'),
                                    ),
                                  ],
                                  onChanged: (value) =>
                                      setState(() => _topic = value!),
                                  decoration: _inputDecoration("Topic", isDark),
                                  dropdownColor: isDark
                                      ? Colors.grey.shade900
                                      : Colors.white,
                                  style: TextStyle(color: textColor),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: Column(
                              children: [
                                TextField(
                                  controller: _messageController,
                                  maxLines: 10,
                                  decoration: _inputDecoration(
                                    "Your Message",
                                    isDark,
                                  ),
                                  style: TextStyle(color: textColor),
                                ),
                                _imagePickerUI(isDark, textColor),
                                const SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Urgency Level",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: textColor,
                                    ),
                                  ),
                                ),
                                Slider(
                                  value: _urgency,
                                  min: 1,
                                  max: 10,
                                  divisions: 9,
                                  label: _urgency.round().toString(),
                                  onChanged: (value) =>
                                      setState(() => _urgency = value),
                                ),
                                CheckboxListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    "I accept the terms and conditions",
                                    style: TextStyle(color: textColor),
                                  ),
                                  value: _acceptTerms,
                                  onChanged: (value) =>
                                      setState(() => _acceptTerms = value!),
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: _submitForm,
                                    style: ElevatedButton.styleFrom(
                                      elevation: 6,
                                      backgroundColor: const Color(0xFF0A4C8A),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 18,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    child: const Text(
                                      "Send Message",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    else
                      Column(
                        children: [
                          TextField(
                            controller: _nameController,
                            decoration: _inputDecoration("Your Name", isDark),
                            style: TextStyle(color: textColor),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: _inputDecoration("Your Email", isDark),
                            style: TextStyle(color: textColor),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _subjectController,
                            decoration: _inputDecoration("Subject", isDark),
                            style: TextStyle(color: textColor),
                          ),
                          const SizedBox(height: 16),
                          DropdownButtonFormField<String>(
                            value: _topic,
                            items: const [
                              DropdownMenuItem(
                                value: 'General Inquiry',
                                child: Text('General Inquiry'),
                              ),
                              DropdownMenuItem(
                                value: 'Feedback',
                                child: Text('Feedback'),
                              ),
                              DropdownMenuItem(
                                value: 'Support',
                                child: Text('Support'),
                              ),
                            ],
                            onChanged: (value) =>
                                setState(() => _topic = value!),
                            decoration: _inputDecoration("Topic", isDark),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _messageController,
                            maxLines: 6,
                            decoration: _inputDecoration(
                              "Your Message",
                              isDark,
                            ),
                            style: TextStyle(color: textColor),
                          ),
                          _imagePickerUI(isDark, textColor),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Urgency Level",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: textColor,
                              ),
                            ),
                          ),
                          Slider(
                            value: _urgency,
                            min: 1,
                            max: 10,
                            divisions: 9,
                            label: _urgency.round().toString(),
                            onChanged: (value) =>
                                setState(() => _urgency = value),
                          ),
                          CheckboxListTile(
                            title: Text(
                              "I accept the terms and conditions",
                              style: TextStyle(color: textColor),
                            ),
                            value: _acceptTerms,
                            onChanged: (value) =>
                                setState(() => _acceptTerms = value!),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _submitForm,
                              style: ElevatedButton.styleFrom(
                                elevation: 6,
                                backgroundColor: const Color(0xFF0A4C8A),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: const Text(
                                "Send Message",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),

            Divider(color: isDark ? Colors.grey[700] : Colors.grey[300]),

            InfoSection(
              title: "Customer Care Promise",
              imagePath: "assets/images/pro1.png",
              content1:
                  "At CellMart, we don’t just provide products—we create meaningful relationships with our customers.",
              content2:
                  "Our team is trained to offer patient, friendly, and professional assistance at every stage of your journey.",
            ),

            Divider(color: isDark ? Colors.grey[700] : Colors.grey[300]),

            InfoSection(
              title: "After-Sales Support",
              imagePath: "assets/images/after.jpg",
              content1:
                  "Our commitment to you extends beyond your purchase. We provide reliable after-sales support.",
              content2:
                  "With CellMart, you are never left alone—we stand firmly by our promise to support you.",
            ),

            Divider(color: isDark ? Colors.grey[700] : Colors.grey[300]),

            const Footer(),
          ],
        ),
      ),
      backgroundColor: bgColor,
    );
  }
}
