import 'package:flutter/material.dart';
import 'package:petpassflutter/theme/colors.dart';
import 'package:petpassflutter/theme/widgets.dart';

class RegisterPetScreen extends StatefulWidget {
  const RegisterPetScreen({super.key});

  @override
  State<RegisterPetScreen> createState() => _RegisterPetScreenState();
}

class _RegisterPetScreenState extends State<RegisterPetScreen> {
  int? _selectedChipIndex;
  int step = 0;
  // Lista de etiquetas para los chips
  final List<String> breed = [
    'Labrador Retriever',
    'Persian Cat',
    'Poodle',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/background2.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 38),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (step == 0) petregistration_A(),
                  if (step != 0) petregistration_B(),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Column petregistration_A() {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 60,
        ),
        const SizedBox(
          height: 12,
        ),
        GestureDetector(
          onTap: () {},
          child: Image.asset(height: 200, 'assets/images/addpet.png'),
        ),
        const Text('Pet Registration'),
        const SizedBox(
          height: 12,
        ),
        const CustomTextField(
          colorTextField: Colors.white70,
          hintText: 'Enter pet\'s name',
        ),
        const SizedBox(
          height: 12,
        ),
        const CustomTextField(
          colorTextField: Colors.white70,
          hintText: 'Enter pet\'s type',
        ),
        const SizedBox(
          height: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Breed",
            ),
            Container(
              width: 300,
              height: 50,
              child: ListView.builder(
                  itemCount: breed.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ChoiceChip(
                      label: Text(breed[index]),
                      selected: _selectedChipIndex == index,
                      selectedColor: WidgetColors.primaryColor,
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedChipIndex = selected ? index : null;
                        });
                      },
                      backgroundColor:
                          Colors.white, // Color opaco para los no seleccionados
                      labelStyle: TextStyle(
                        color: _selectedChipIndex == index
                            ? WidgetColors.textDark
                            : WidgetColors
                                .textDisable, // Cambia el color del texto
                      ),
                    );
                  }),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        const CustomTextField(
          colorTextField: Colors.white70,
          hintText: 'Enter date of birth',
        ),
        const SizedBox(
          height: 12,
        ),
        const CustomTextField(
          colorTextField: Colors.white70,
          hintText: 'Enter color',
        ),
        const SizedBox(
          height: 12,
        ),
        const CustomTextField(
          colorTextField: Colors.white70,
          hintText: 'Describe diseases',
        ),
        const SizedBox(
          height: 12,
        ),
        const CustomTextField(
          colorTextField: Colors.white70,
          hintText: 'Describe allergies',
        ),
        const SizedBox(
          height: 12,
        ),
        const CustomTextField(
          colorTextField: Colors.white70,
          hintText: 'N° Chip',
        ),
        const SizedBox(
          height: 12,
        ),
        CustomButton(
          height: 42,
          borderRadius: 16,
          text: 'Continue',
          onPressed: () {
            setState(() {
              step++;
            });
          },
        )
      ],
    );
  }

  Column petregistration_B() {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 60,
        ),
        const SizedBox(
          height: 12,
        ),
        const Text('Upload Documents'),
        const Text('Upload required documents for registration'),
        const SizedBox(
          height: 12,
        ),
        const Center(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.question_mark),
                  Icon(Icons.check),
                  Column(
                    children: [
                      Text('Vaccination Records'),
                      Text('Uploaded successfully')
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.question_mark),
                  Icon(Icons.check),
                  Column(
                    children: [
                      Text('Vaccination Records'),
                      Text('Uploaded successfully')
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        CustomButton(
          width: 300,
          height: 42,
          borderRadius: 16,
          text: 'Upload Health Certificate',
          onPressed: () {},
        ),
        CustomButton(
          width: 300,
          height: 42,
          borderRadius: 16,
          text: 'Upload Vaccination Records',
          onPressed: () {},
        ),
        CustomButton(
          width: 300,
          height: 42,
          borderRadius: 16,
          text: 'Return',
          onPressed: () {
            setState(() {
              step--;
            });
          },
        ),
        CustomButton(
          width: 300,
          height: 42,
          borderRadius: 16,
          text: 'Confirm Registration',
          onPressed: () {},
        ),
      ],
    );
  }
}
