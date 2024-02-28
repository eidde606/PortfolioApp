// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: ContactForm(),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> _sendEmail({name, email, message}) async {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String message = _messageController.text;

    const service_id = 'service_kqvz64k';
    const template_id = 'template_dqlx05c';
    const user_id = 'IJlyxBIWWLdS2KCZR';

    try {
      final response = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'service_id': service_id, // Replace with your service ID
          'template_id': template_id, // Replace with your template ID
          'user_id': user_id, // Replace with your user ID
          'template_params': {
            'name': name,
            'email': email,
            'message': message,
          },
        }),
      );

      if (response.statusCode == 200) {
        // Email sent successfully
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Your message has been sent.'),
            duration: Duration(seconds: 3),
          ),
        );
        _emailController.clear();
        _messageController.clear();
        _nameController.clear();
      } else {
        // Error sending email
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to send message. Please try again later.'),
            duration: Duration(seconds: 3),
          ),
        );
        _emailController.clear();
        _messageController.clear();
        _nameController.clear();
      }
    } catch (error) {
      // Handle exception
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while sending the email.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Contact Me',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          const Divider(
            height: 50,
            color: Colors.white,
            thickness: .5,
          ),
          const Text(
            'Get in touch',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Looking forward hearing from you!',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _nameController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            controller: _emailController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            controller: _messageController,
            style: const TextStyle(color: Colors.white),
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Message',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          OutlinedButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all<BorderSide>(
                const BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
            onPressed: _sendEmail,
            child: const Text(
              'Send',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
