import 'package:buttomnavigationbar/provider/stepper_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final stepperProvider =
        Provider.of<StepperProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Center(child: Consumer<StepperProvider>(
          builder: (context, value, child) {
            return Stepper(
              steps: [
                Step(
                    isActive: value.currentStep == 0,
                    title: const Text("Step 1"),
                    content: const Text(
                      "Information for step 1",
                      style: TextStyle(color: Colors.red),
                    )),
                Step(
                    isActive: value.currentStep == 1,
                    title: const Text("Step 2"),
                    content: const Text(
                      "Information for step 2",
                      style: TextStyle(color: Colors.red),
                    )),
                Step(
                    isActive: value.currentStep == 2,
                    title: const Text("Step 3"),
                    content: const Text(
                      "Information for step 3",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
              onStepTapped: (int newIndex) {},
              currentStep: value.currentStep,
              onStepContinue: () {
                if (value.currentStep != 2) {
                  value.continueStepper();
                }
              },
              onStepCancel: () {
                if (value.currentStep != 0) {
                  value.cancelStepper();
                }
              },
              type: StepperType.horizontal,
            );
          },
        )),
      ),
    );
  }
}
