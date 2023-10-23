import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list_with_cubit/src/shopping_list_cubit.dart';

class CreateNewItemForm extends StatefulWidget {
  const CreateNewItemForm({
    super.key,
  });

  @override
  State<CreateNewItemForm> createState() => _CreateNewItemFormState();
}

class _CreateNewItemFormState extends State<CreateNewItemForm> {
  late final TextEditingController _quantityController;
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  TextFormField(
                    controller: _quantityController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: false,
                      signed: false,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                minimumSize: const Size.fromHeight(50.0),
              ),
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                final quantity = int.tryParse(_quantityController.text) ?? 1;
                final name = _nameController.text;
                context.read<ShoppingListCubit>().addItem(
                      name: name,
                      quantity: quantity,
                    );
                Navigator.of(context).pop();
              },
              child: const Text(
                'Add',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
