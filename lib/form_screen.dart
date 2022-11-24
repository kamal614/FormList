import 'package:flutter/material.dart';
import 'package:simplge_form/common_widget.dart';
import 'package:simplge_form/new.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int dataCount = 0;
  Map<int, dynamic> userData = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Name";
                      } else {
                        return null;
                      }
                    },
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Enter Name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Age";
                      } else {
                        return null;
                      }
                    },
                    controller: ageController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Enter Age"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Job Profile";
                      } else {
                        return null;
                      }
                    },
                    controller: jobController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Job Profile"),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        dataCount++;
                        var allUData = {
                          'name': nameController.text,
                          'age': ageController.text,
                          'job_profile': jobController.text
                        };

                        if (userData.containsValue(allUData)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Name and Age cannot be same")));
                        } else {
                          userData[dataCount] = allUData;
                        }

                        nameController.clear();
                        ageController.clear();
                        jobController.clear();

                        setState(() {});
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Check the form Again")));
                      }
                    },
                    child: const Text("SUBMIT")),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: userData.length,
                    itemBuilder: ((context, index1) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(userData[index1 + 1].toString()),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                userData.removeWhere(
                                    (key, value) => key == index1 + 1);
                              });
                            },
                            child: const Icon(Icons.close),
                          )
                        ],
                      );
                    }))
              ],
            )),
      ),
    );
  }
}
