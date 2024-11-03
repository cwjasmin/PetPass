// ignore: file_names
import 'package:flutter/material.dart';
import 'package:petpassflutter/theme/colors.dart';
import 'package:petpassflutter/theme/widgets.dart';

class DetailCompetenciesScreen extends StatefulWidget {
  const DetailCompetenciesScreen({super.key});

  @override
  State<DetailCompetenciesScreen> createState() =>
      _DetailCompetenciesScreenState();
}

class _DetailCompetenciesScreenState extends State<DetailCompetenciesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
          actions: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        "4.7",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 4),
                    ],
                  ),
                ),
              ],
            ),
          ],
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
            Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          color: Colors.grey[300], // Imagen de lugar
                          child:
                              const Icon(Icons.image, size: 100, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ChoiceChip(label: Text("Belleza"), selected: true),
                          ChoiceChip(
                              label: Text("Acrobacias"), selected: false),
                          ChoiceChip(
                              label: Text("Acrobacias"), selected: false),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Competitions Agenda',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildDateField('Inicio', '01/12/2024'),
                          _buildDateField('Fin', '01/12/2024'),
                          _buildParticipantField('59'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '¡Es hora de organizar un increíble concurso y atraer a los amantes de las mascotas para que participen con sus adorables amigos! Este proceso te guiará paso a paso para crear el concurso perfecto.',
                      ),
                      const SizedBox(height: 20),
                      _buildDropdownButton('Tracks and Criteria'),
                      _buildDropdownButton('Awards'),
                      _buildDropdownButton('Reglas'),
                      const SizedBox(height: 20),
                      const CardHorizontalB(
                        image: 'https://cdn.pixabay.com/photo/2024/03/04/16/38/cat-8612685_1280.jpg',
                      ),
                      const SizedBox(height: 8,)
                    ],
                  ),
                )),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xFFFF7643),
                    minimumSize: const Size(0, 48),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
      
                        )
                      ),
                      builder: (context) => InscriptionModal(),
                    );
                  },
                  child: const Text("Inscribirme"),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: WidgetColors.textAccent,
                  minimumSize: Size(MediaQuery.of(context).size.width / 3, 51),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 600,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Form(
                              child: Column(
                                children: [
                                  TextFormField(
                                    onSaved: (firstName) {},
                                    onChanged: (firstName) {},
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      hintText: "Enter your first name",
                                      labelText: "First Name",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintStyle: TextStyle(
                                          color: Color(0xFF757575)),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 16,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 24),
                                    child: TextFormField(
                                      onSaved: (lastName) {},
                                      onChanged: (lastName) {},
                                      textInputAction: TextInputAction.next,
                                      decoration: const InputDecoration(
                                        hintText: "Enter your last name",
                                        labelText: "Last Name",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        hintStyle: TextStyle(
                                            color: Color(0xFF757575)),
                                        contentPadding:
                                            EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    onSaved: (password) {},
                                    onChanged: (password) {},
                                    keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                      hintText: "Enter your phone number",
                                      labelText: "Phone Number",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintStyle: TextStyle(
                                          color: Color(0xFF757575)),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 16,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 24),
                                    child: TextFormField(
                                        onSaved: (address) {},
                                        onChanged: (address) {},
                                        decoration: const InputDecoration(
                                          hintText: "Enter your address",
                                          labelText: "Address",
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          hintStyle: TextStyle(
                                              color: Color(0xFF757575)),
                                          contentPadding:
                                              EdgeInsets.symmetric(
                                            horizontal: 24,
                                            vertical: 16,
                                          ),
                                        )),
                                  ),
                                  const SizedBox(height: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      //lamado a pagar
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: const Color(0xFFFF7643),
                                      foregroundColor: Colors.white,
                                      minimumSize:
                                          const Size(double.infinity, 48),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(16)),
                                      ),
                                    ),
                                    child: const Text("Continue"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text("Mas opciones", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDateField(String label, String date) {
  return Column(
    children: [
      Text(label),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(date),
      ),
    ],
  );
}

Widget _buildParticipantField(String participants) {
  return Column(
    children: [
      const Text('Participantes'),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(participants),
      ),
    ],
  );
}

Widget _buildDropdownButton(String title) {
  return ExpansionTile(title: Text(title), children: [
    ListTile(
      title: Text(
        title,
        
      ),
    ),
  ]);
}

class InscriptionModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.png'), // Imagen del avatar
              ),
              title: Text('Conni_1214'),
              subtitle: Text('Body text for whatever you’d like to say...'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Debes llenar algunos campos solicitados por la organización para la inscripción',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            _buildTextField('Input Texto Explicativo', Icons.text_fields),
            _buildTextField('Input Link', Icons.link),
            _buildTextField('Input Link VideoDemo', Icons.video_library),
            _buildTextField('Input Red Social 1', Icons.share),
            _buildTextField('Input Red Social 2', Icons.share),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.camera_alt, size: 40),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/dog_image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                
              },
              child: const Text('Pagar solo gas'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.teal),
          hintText: hintText,
          filled: true,
          fillColor: Colors.blue[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}