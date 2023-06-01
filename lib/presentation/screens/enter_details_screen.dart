import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:my_app/domain/models/basic_details_model.dart';

class EnterDetailsScreen extends StatefulWidget {
  final BasicDetailsModel? data;

  const EnterDetailsScreen({
    super.key,
    this.data,
  });

  @override
  State<EnterDetailsScreen> createState() => _EnterDetailsScreenState();
}

class _EnterDetailsScreenState extends State<EnterDetailsScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
          onPressed: () {
            Beamer.of(context).beamBack();
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
                  'Enter basic details',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          FormBuilderTextField(
                            name: 'firstName',
                            initialValue: widget.data?.firstName,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            decoration: InputDecoration(
                              labelText: 'First Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          FormBuilderTextField(
                            name: 'lastName',
                            initialValue: widget.data?.lastName,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            decoration: InputDecoration(
                              labelText: 'Last Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          FormBuilderTextField(
                            name: 'contactNumber',
                            initialValue: widget.data?.contactNumber,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.numeric(),
                              FormBuilderValidators.maxLength(10),
                              FormBuilderValidators.minLength(10),
                            ]),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            maxLength: 10,
                            decoration: InputDecoration(
                              labelText: 'Contact Number',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() == false) {
                      return;
                    }
                    Beamer.of(context).beamToNamed(
                      '/display-details',
                      data: BasicDetailsModel(
                        firstName:
                            _formKey.currentState!.fields['firstName']!.value,
                        lastName:
                            _formKey.currentState!.fields['lastName']!.value,
                        contactNumber: _formKey
                            .currentState!.fields['contactNumber']!.value,
                      ),
                    );
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
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
