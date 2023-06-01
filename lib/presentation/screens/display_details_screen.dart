import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:my_app/domain/models/basic_details_model.dart';

class DisplayDetailsScreen extends StatefulWidget {
  final BasicDetailsModel data;

  const DisplayDetailsScreen({
    super.key,
    required this.data,
  });

  @override
  State<DisplayDetailsScreen> createState() => _DisplayDetailsScreenState();
}

class _DisplayDetailsScreenState extends State<DisplayDetailsScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamBack(data: widget.data);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
          onPressed: () {
            Beamer.of(context).beamBack(data: widget.data);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        )),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'First Name: ${widget.data.firstName}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Last Name: ${widget.data.lastName}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Contact Number: ${widget.data.contactNumber}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
