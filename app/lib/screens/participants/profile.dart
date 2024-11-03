import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petpassflutter/config/app_routes.dart';
import 'package:petpassflutter/theme/widgets.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  bool isSelected = false;

  void toggleSwitch(bool value) {
    setState(() {
      isSelected = !isSelected;
    });
    // Mostrar el AlertDialog cuando el switch es seleccionado
    if (isSelected) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Activar modo ONG",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            content:
                const Text("¿Estás seguro de que deseas activar el modo ONG?"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Cierra el diálogo
                },
                child: const Text("Cancelar"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  //Modal si el usuario tiene una ong aceptada
                  //Pasa a las pantallas ONG
                  //Modal si el usuario todavia no tiene una ong
                  //Llena el formulario
                  //register();
                  //Modal si el usuario tiene una ong en espera
                  //Modal de aviso
                  wait();
                },
                child: const Text("Aceptar"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              press: () {},
            ),
            //Activar modo ONG
            ListTile(
              title: const Text("Activar modo ONG"),
              trailing: Switch(
                value: isSelected,
                onChanged: toggleSwitch,
                activeColor: Colors.orange,
              ),
            )
          ],
        ),
      ),
    );
  }

  void register() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.8,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text('Registra tu ONG'),
                Container(
                    width: 200,
                    child: const Text(
                        'A continuación deberas rellenar el formulario para que tu ONG participe dentro del aplicativo, al enviar el formulario quedarás como representante de la ONG')),
                const CustomTextField(
                  hintText: 'Nombre de la ONG',
                  isIconVisible: false,
                ),
                const CustomTextField(
                  hintText: 'Descripción de la ONG',
                  isIconVisible: false,
                ),
                Container(width: 300, child: const ChipExample()),
                const CustomTextField(
                  hintText: 'Nombre Completo del Representante',
                  isIconVisible: false,
                ),
                const CustomTextField(
                  hintText: 'Correo de la ONG',
                  isIconVisible: false,
                ),
                const CustomTextField(
                  hintText: 'Ingresa el sitio web de la ONG o LinkedIn',
                  isIconVisible: false,
                ),
                //Foto / Logo de la ONG
                CustomButton(
                  text: 'Enviar',
                  onPressed: () {
                    //Quitar solo es para ver la otra pantalla
                    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.splashScreen, (Route<dynamic> route) => false);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void wait() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
              title: Text("En espera"),
              content: Text("El registro de tu ONG esta siendo revisada"));
        });
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundImage:
                NetworkImage("https://i.postimg.cc/0jqKB6mS/Profile-Image.png"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: SvgPicture.string(cameraIcon),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFFFF7643),
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF757575),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF757575),
            ),
          ],
        ),
      ),
    );
  }
}

const cameraIcon =
    '''<svg width="20" height="16" viewBox="0 0 20 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M10 12.0152C8.49151 12.0152 7.26415 10.8137 7.26415 9.33902C7.26415 7.86342 8.49151 6.6619 10 6.6619C11.5085 6.6619 12.7358 7.86342 12.7358 9.33902C12.7358 10.8137 11.5085 12.0152 10 12.0152ZM10 5.55543C7.86698 5.55543 6.13208 7.25251 6.13208 9.33902C6.13208 11.4246 7.86698 13.1217 10 13.1217C12.133 13.1217 13.8679 11.4246 13.8679 9.33902C13.8679 7.25251 12.133 5.55543 10 5.55543ZM18.8679 13.3967C18.8679 14.2226 18.1811 14.8935 17.3368 14.8935H2.66321C1.81887 14.8935 1.13208 14.2226 1.13208 13.3967V5.42346C1.13208 4.59845 1.81887 3.92664 2.66321 3.92664H4.75C5.42453 3.92664 6.03396 3.50952 6.26604 2.88753L6.81321 1.41746C6.88113 1.23198 7.06415 1.10739 7.26604 1.10739H12.734C12.9358 1.10739 13.1189 1.23198 13.1877 1.41839L13.734 2.88845C13.966 3.50952 14.5755 3.92664 15.25 3.92664H17.3368C18.1811 3.92664 18.8679 4.59845 18.8679 5.42346V13.3967ZM17.3368 2.82016H15.25C15.0491 2.82016 14.867 2.69466 14.7972 2.50917L14.2519 1.04003C14.0217 0.418041 13.4113 0 12.734 0H7.26604C6.58868 0 5.9783 0.418041 5.74906 1.0391L5.20283 2.50825C5.13302 2.69466 4.95094 2.82016 4.75 2.82016H2.66321C1.19434 2.82016 0 3.98846 0 5.42346V13.3967C0 14.8326 1.19434 16 2.66321 16H17.3368C18.8057 16 20 14.8326 20 13.3967V5.42346C20 3.98846 18.8057 2.82016 17.3368 2.82016Z" fill="#757575"/>
</svg>
''';

class ChipExample extends StatefulWidget {
  const ChipExample({super.key});

  @override
  _ChipExampleState createState() => _ChipExampleState();
}

class _ChipExampleState extends State<ChipExample> {
  // Variable que almacenará el índice del chip seleccionado
  int _selectedChipIndex = 0;

  // Lista de etiquetas para los chips
  final List<String> options = [
    "Rescate",
    "Adopción",
    "Voluntariado",
    "Donaciones",
    "Concienciación"
  ];
  // Lista de opciones seleccionadas
  List<String> selectedChoices = [];

  // Función para seleccionar/deseleccionar opciones
  void _onSelected(bool selected, String option) {
    setState(() {
      if (selected) {
        // Solo permite seleccionar hasta 3 opciones
        if (selectedChoices.length < 3) {
          selectedChoices.add(option);
        } else {}
      } else {
        selectedChoices.remove(option);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 8.0,
        children: options.map((option) {
          return ChoiceChip(
            label: Text(option),
            selected: selectedChoices.contains(option),
            onSelected: (selected) {
              _onSelected(selected, option);
            },
            selectedColor:
                Colors.orange, // Cambia el color al estar seleccionado
          );
        }).toList(),
      ),
    );
  }
}
