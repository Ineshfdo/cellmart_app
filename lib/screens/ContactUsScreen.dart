// ignore_for_file: unused_local_variable, duplicate_ignore
import 'package:cellmart_app/components/InfoSection.dart';
import 'package:cellmart_app/components/MainInfoSection.dart';
import 'package:cellmart_app/components/footer.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  String _topic = 'General Inquiry';
  bool _acceptTerms = false;
  double _urgency = 2;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = theme.textTheme.bodyLarge?.color;
    final bgColor = theme.scaffoldBackgroundColor;

    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 800;
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
          leading: Icon(Icons.phone, color: Color.fromARGB(255, 0, 0, 0)),
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
          leading: Icon(
            Icons.video_library,
            color: Color.fromARGB(255, 236, 59, 59),
          ),
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

    Widget buildFormFields() {
      if (isDesktop || isLandscape) {
        // Desktop Layout
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    style: TextStyle(color: textColor),
                    decoration: InputDecoration(
                      hintText: "Your Name",
                      hintStyle: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: textColor),
                    decoration: InputDecoration(
                      hintText: "Your Email",
                      hintStyle: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: _subjectController,
                    style: TextStyle(color: textColor),
                    decoration: InputDecoration(
                      hintText: "Subject",
                      hintStyle: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                    onChanged: (value) {
                      setState(() {
                        _topic = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Topic",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                    dropdownColor: bgColor,
                    style: TextStyle(color: textColor),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  TextField(
                    controller: _messageController,
                    maxLines: 12,
                    style: TextStyle(color: textColor),
                    decoration: InputDecoration(
                      hintText: "Your Message",
                      hintStyle: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Message Urgency",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                      Slider(
                        value: _urgency,
                        min: 1,
                        max: 10,
                        divisions: 9,
                        label: _urgency.round().toString(),
                        onChanged: (value) {
                          setState(() {
                            _urgency = value;
                          });
                        },
                      ),
                    ],
                  ),
                  CheckboxListTile(
                    title: Text(
                      "I accept the terms and conditions",
                      style: TextStyle(color: textColor),
                    ),
                    value: _acceptTerms,
                    onChanged: (value) {
                      setState(() {
                        _acceptTerms = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0A4C8A),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Send Message",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }

      // Mobile Layout
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _nameController,
                  style: TextStyle(color: textColor),
                  decoration: InputDecoration(
                    hintText: "Your Name",
                    hintStyle: TextStyle(
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: textColor),
                  decoration: InputDecoration(
                    hintText: "Your Email",
                    hintStyle: TextStyle(
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _subjectController,
            style: TextStyle(color: textColor),
            decoration: InputDecoration(
              hintText: "Subject",
              hintStyle: TextStyle(
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            value: _topic,
            items: const [
              DropdownMenuItem(
                value: 'General Inquiry',
                child: Text('General Inquiry'),
              ),
              DropdownMenuItem(value: 'Feedback', child: Text('Feedback')),
              DropdownMenuItem(value: 'Support', child: Text('Support')),
            ],
            onChanged: (value) {
              setState(() {
                _topic = value!;
              });
            },
            decoration: InputDecoration(
              labelText: "Topic",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
            dropdownColor: bgColor,
            style: TextStyle(color: textColor),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _messageController,
            maxLines: 6,
            style: TextStyle(color: textColor),
            decoration: InputDecoration(
              hintText: "Your Message",
              hintStyle: TextStyle(
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Message Urgency",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              Slider(
                value: _urgency,
                min: 1,
                max: 10,
                divisions: 9,
                label: _urgency.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _urgency = value;
                  });
                },
              ),
            ],
          ),
          CheckboxListTile(
            title: Text(
              "I accept the terms and conditions",
              style: TextStyle(color: textColor),
            ),
            value: _acceptTerms,
            onChanged: (value) {
              setState(() {
                _acceptTerms = value!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0A4C8A),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Send Message",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 15, 0, 15),
            child: const Text(
              "Contact CellMart",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Color(0xFF0A4C8A),
                fontFamily: "Nano",
              ),
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
                  "At CellMart, we prioritize our customers above all. Whether you have a question about our products, need assistance with an order, or want to provide feedback, we are here to help. Our dedicated support team is committed to ensuring your experience with CellMart is smooth, efficient, and enjoyable.",
              content2:
                  "You can reach out to us via email, phone, or through our social media channels. We value communication and are always open to hearing from you to improve our services and product offerings.",
            ),
            Divider(color: isDark ? Colors.grey[700] : Colors.grey[300]),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
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

            InfoSection(
              title: "Customer Care Promise",
              imagePath: "assets/images/pro1.png",
              content1:
                  "At CellMart, we don’t just provide products—we create meaningful relationships with our customers. Every interaction is an opportunity to deliver support, guidance, and care. We believe that customer service should be more than solving problems; it should be about making every experience with us seamless, stress-free, and enjoyable.",
              content2:
                  "No matter how simple or complex your concern, we want you to feel valued and heard. Our team is trained to offer patient, friendly, and professional assistance at every stage of your journey. By choosing CellMart, you are choosing a partner that is dedicated to walking beside you every step of the way.",
            ),
            Divider(color: isDark ? Colors.grey[700] : Colors.grey[300]),

            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Get In Touch",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF0A4C8A),
                      fontFamily: "Nano",
                    ),
                  ),
                  const SizedBox(height: 30),
                  buildFormFields(),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Divider(color: isDark ? Colors.grey[700] : Colors.grey[300]),

            InfoSection(
              title: "After-Sales Support",
              imagePath: "assets/images/after.jpg",
              content1:
                  "Our commitment to you extends beyond your purchase. At CellMart, we provide reliable after-sales support to ensure you enjoy lasting satisfaction with your products. From troubleshooting and warranty guidance to technical advice, our dedicated team is here to provide the assistance you need, long after your order has been delivered.",
              content2:
                  "We understand that peace of mind comes from knowing support is always available. That’s why we strive to make after-sales service efficient, accessible, and dependable. With CellMart, you are never left alone—we stand firmly by our promise to ensure you receive help whenever you need it most.",
            ),
            Divider(),
            const Footer(),
          ],
        ),
      ),
      backgroundColor: bgColor,
    );
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
      SnackBar(
        content: Text(
          "Thank you, $name! We will respond to $email. Urgency level: ${_urgency.round()}",
        ),
      ),
    );

    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();
    setState(() {
      _topic = 'General Inquiry';
      _acceptTerms = false;
      _urgency = 2;
    });
  }
}
