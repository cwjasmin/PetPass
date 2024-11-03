import 'package:flutter/material.dart';
import 'package:petpassflutter/theme/widgets.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: EdgeInsets.zero,
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
          actions: [],
        ),
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
            Stepper(
              controlsBuilder: (BuildContext ctx, ControlsDetails dtl) {
                return Row(
                  children: <Widget>[
                    TextButton(
                      onPressed: dtl.onStepCancel,
                      child: const Text('Volver'),
                    ),
                    TextButton(
                      onPressed: dtl.onStepContinue,
                      child: const Text('Continuar'),
                    ),
                  ],
                );
              },
              steps: [
                Step(
                    isActive: _currentStep == 0,
                    title: const Text('Informacion'),
                    content: const Column(
                      children: [
                        Text(
                            '¡Es hora de organizar un increíble concurso y atraer a los amantes de las mascotas para que participen con sus adorables amigos! Este proceso te guiará paso a paso para crear el concurso perfecto.'),
                        Text("Continuar")
                      ],
                    )),
                Step(
                    isActive: _currentStep == 1,
                    title: const Text('General'),
                    content: Container(
                      width: 300,
                      child: Form(
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    hintText: 'Start Date',
                                    width: double.infinity,
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    hintText: 'End Date',
                                    width: double.infinity,
                                  ),
                                )
                              ],
                            ),
                            const Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    hintText: 'Start Date',
                                    width: double.infinity,
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    hintText: 'End Date',
                                    width: double.infinity,
                                  ),
                                )
                              ],
                            ),
                            const CustomTextField(
                              hintText: 'End Date',
                              width: double.infinity,
                            ),
                            CustomButton(
                              text: 'Adjuntar foto', 
                              onPressed: (){}
                              )
                          ],
                        ),
                      ),
                    )),
                Step(
                    isActive: _currentStep == 2,
                    title: const Text('Detalle'),
                    content: Container(
                      width: 300,
                      child: const Form(
                        child: Column(
                          children: [
                            ExpansionTile(
                              initiallyExpanded: true,
                                title: Text('Tracks and Criteria'),
                                children: [
                                  CustomTextField(
                                    hintText: 'End Date',
                                    width: double.infinity,
                                  ),
                                ]),
                            ExpansionTile(
                              initiallyExpanded: true,
                                title: Text('Awards by category'),
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomTextField(
                                              hintText: 'Start Date',
                                              width: double.infinity,
                                            ),
                                          ),
                                          Expanded(
                                            child: CustomTextField(
                                              hintText: 'End Date',
                                              width: double.infinity,
                                            ),
                                          )
                                        ],
                                      ),
                                      CustomTextField(
                                        hintText: 'End Date',
                                        width: double.infinity,
                                      )
                                    ],
                                  ),
                                ]),
                            ExpansionTile(
                              initiallyExpanded: true,
                                title: Text('Additional awards'),
                                children: [
                                  Column(children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextField(
                                            hintText: 'Start Date',
                                            width: double.infinity,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomTextField(
                                            hintText: 'End Date',
                                            width: double.infinity,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextField(
                                            hintText: 'Start Date',
                                            width: double.infinity,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomTextField(
                                            hintText: 'End Date',
                                            width: double.infinity,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextField(
                                            hintText: 'Start Date',
                                            width: double.infinity,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomTextField(
                                            hintText: 'End Date',
                                            width: double.infinity,
                                          ),
                                        )
                                      ],
                                    ),
                                  ])
                                ]),
                          ],
                        ),
                      ),
                    )),
                Step(
                    isActive: _currentStep == 3,
                    title: const Text('Requisitos'),
                    content: Column(
                      children: [
                        CustomButton(
                          width: 300,
                          text: 'Requisitos para participantes',
                          onPressed: () {},
                        ),
                        Container(
                            height: double.infinity,
                            constraints: const BoxConstraints(maxHeight: 300),
                            child: listCheck()),
                        const CustomTextField(hintText: 'Amount')
                      ],
                    )),
                Step(
                    isActive: _currentStep == 4,
                    title: const Text('Pago'),
                    content: const Column(
                      children: [
                        Text('Metodo para recaudar los fondos'),
                        Text("Wallet")
                      ],
                    )),
                Step(
                    isActive: _currentStep == 5,
                    title: const Text('Confirmación'),
                    content: Column(
                      children: [
                        const Text(
                            'Your contest has been successfully created, go to the contest panel to view the contests in progress and completed contests.'),
                        CustomButton(text: 'View Contest', onPressed: () {})
                      ],
                    )),
              ],
              onStepTapped: (int index) {
                setState(() {
                  _currentStep = index;
                });
              },
              currentStep: _currentStep,
              onStepContinue: () {
                if (_currentStep != 5) {
                  setState(() {
                    _currentStep += 1;
                  });
                }
              },
              onStepCancel: () {
                if (_currentStep != 0) {
                  setState(() {
                    _currentStep -= 1;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class listCheck extends StatefulWidget {
  @override
  _listCheckState createState() => _listCheckState();
}

class _listCheckState extends State<listCheck> {
  Map<String, bool> values = {
    '¿Se adjuntarán imágenes?': false,
    '¿Se adjuntarán videos?': false,
    '¿Se adjuntarán links?': false,
    '¿Se incluirá un texto explicativo del participante?': false,
    '¿Se solicitará cuenta de redes sociales?': false,
    '¿Se solicitará pago de inscripción?': true,
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: values.keys.map((String key) {
        return CheckboxListTile(
          value: values[key],
          onChanged: (bool? value) {
            if (value != null) {
              setState(() {
                values[key] = value;
              });
            }
          },
          title: Text(key), 
        );
      }).toList(),
    );
  }
}
