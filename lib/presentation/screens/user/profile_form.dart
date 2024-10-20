import 'package:appnike/domain/user/gender.enum.dart';
import 'package:appnike/presentation/screens/user/validators.dart';
import 'package:flutter/material.dart';

class ProfileForm extends StatelessWidget {
  static const String name = 'profile_form';
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    // Controladores para los campos del formulario
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController documentController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController birthController = TextEditingController();
    TextEditingController streetController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController floorController = TextEditingController();
    TextEditingController appartmentController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController provinceController = TextEditingController();
    TextEditingController postalCodeController = TextEditingController();

    DateTime? birthDate;
    Gender? gender;

    Future<void> _selectBirthDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(2000), // Fecha inicial
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != birthDate) {
        birthDate = picked;
        birthController.text = picked.toLocal().toString().split(' ')[0];
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Campo de Nombre
              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) =>
                    Validators.validateRequired(value, 'nombre'),
              ),
              // Campo de Apellido
              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(labelText: 'Apellido'),
                validator: (value) =>
                    Validators.validateRequired(value, 'apellido'),
              ),
              // Campo de Documento
              TextFormField(
                controller: documentController,
                decoration: const InputDecoration(labelText: 'Documento'),
                validator: (value) =>
                    Validators.validateRequired(value, 'documento'),
              ),
              // Campo de Email
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: Validators.validateEmail,
              ),
              // Campo de Teléfono
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Teléfono'),
                keyboardType: TextInputType.phone,
                validator: Validators.validatePhone,
              ),
              // Campo de Género
              DropdownButtonFormField<Gender>(
                decoration: const InputDecoration(labelText: 'Género'),
                value: gender,
                onChanged: (Gender? selectedGender) {
                  gender = selectedGender;
                },
                items: Gender.values.map((Gender gender) {
                  return DropdownMenuItem<Gender>(
                    value: gender,
                    child: Text(gender.displayName), // Texto en español
                  );
                }).toList(),
              ),
              // Campo de Fecha de Nacimiento
              TextFormField(
                controller: birthController,
                decoration: InputDecoration(
                  labelText: 'Fecha de Nacimiento',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectBirthDate(context),
                  ),
                ),
                readOnly: true,
                onTap: () => _selectBirthDate(context),
              ),
              // Campo de Dirección: Calle
              TextFormField(
                controller: streetController,
                decoration: const InputDecoration(labelText: 'Calle'),
                validator: (value) =>
                    Validators.validateRequired(value, 'calle'),
              ),
              // Campo de Dirección: Número
              TextFormField(
                controller: numberController,
                decoration: const InputDecoration(labelText: 'Número'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    Validators.validateNumber(value, 'número'),
              ),
              // Campo de Piso
              TextFormField(
                controller: floorController,
                decoration: const InputDecoration(labelText: 'Piso'),
              ),
              // Campo de Departamento
              TextFormField(
                controller: appartmentController,
                decoration: const InputDecoration(labelText: 'Departamento'),
              ),
              // Campo de Ciudad
              TextFormField(
                controller: cityController,
                decoration: const InputDecoration(labelText: 'Ciudad'),
                validator: (value) =>
                    Validators.validateRequired(value, 'ciudad'),
              ),
              // Campo de Provincia
              TextFormField(
                controller: provinceController,
                decoration: const InputDecoration(labelText: 'Provincia'),
                validator: (value) =>
                    Validators.validateRequired(value, 'provincia'),
              ),
              // Campo de Código Postal
              TextFormField(
                controller: postalCodeController,
                decoration: const InputDecoration(labelText: 'Código Postal'),
              ),
              const SizedBox(height: 20),
              // Botón de Enviar
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Procesar los datos del formulario
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
