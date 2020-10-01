import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tag_system/components/large_button_default.dart';
import 'package:tag_system/pages/open_solicitation_page/open_solicitation_controller.dart';

class OpenSolicitationPage extends StatelessWidget {
  final OpenSolicitationController c = Get.put(OpenSolicitationController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Abertura de solicitação de OS',
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 20,
            ),
            child: Card(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Título da solicitação',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Ex: Parada de motor extrusora nº16',
                            errorText: c.nameError,
                          ),
                          onChanged: (value) => c.setSolicitationTitle(value),
                          validator: (value) {
                            if (value.isEmpty) return 'Campo obrigatório!';
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Descrição do ocorrido',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => SizedBox(
                          height: 100,
                          child: TextFormField(
                            maxLines: null,
                            minLines: null,
                            expands: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText:
                                  'Ex: O motor estava com ruído anormal.\nHouve um estouro e o motor parou.\nCheiro de queimado.',
                              errorText: c.descriptionError,
                            ),
                            onChanged: (value) => c.setDescription(value),
                            validator: (value) {
                              if (value.isEmpty) return 'Campo obrigatório!';
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropdownButton(
                        hint: Text('TAG/APELIDO MÁQUINA'),
                        items: [
                          DropdownMenuItem(
                            child: Text('Tag de máquina'),
                          ),
                        ],
                        onChanged: (value) {},
                        isExpanded: true,
                        itemHeight: kMinInteractiveDimension + 20,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: LargeButtonDefault(
                              label: 'ABRIR SOLICITAÇÃO',
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  c.openSolicitation();
                                  Get.back();
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: LargeButtonDefault(
                              label: 'CANCELAR SOLICITAÇÃO',
                              onPressed: () => Get.back(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
