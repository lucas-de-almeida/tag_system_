class OsModel {
  int id;
  //Map<String, Horarios> tempoServico;
  //Maquina maquina;
  String descricaoOcorrido;
  String trabalhoExecutado;
  //List<Usuario> responsaveis;
  OsModel osVinculada;
  Status status;

  OsModel({
    this.id,
    this.descricaoOcorrido = 'Sem descrição',
    this.trabalhoExecutado = 'Aguardando atualização',
    this.osVinculada,
    this.status = Status.aguardando,
  });

  static List<OsModel> osListMock = [
    OsModel(
      id: 1,
      descricaoOcorrido: 'Rompimento de esteira nº123',
      status: Status.aberto,
    ),
    OsModel(
      id: 2,
      descricaoOcorrido: 'Para de máquina',
      trabalhoExecutado:
          'Chamado cancelado, botão de emergencia estava acionado.',
      status: Status.cancelado,
    ),
    OsModel(
      id: 3,
      descricaoOcorrido: 'Queima de motor nº456',
      status: Status.fechado,
      trabalhoExecutado: 'Foi substituido o motor',
    ),
    OsModel(
      id: 4,
      descricaoOcorrido: 'Vazamento vapor caldeira',
      status: Status.aberto,
    ),
    OsModel(
      id: 5,
      descricaoOcorrido: 'Parada esteira 789',
      status: Status.fechado,
      trabalhoExecutado: 'Substituido relé',
    ),
    OsModel(
      id: 6,
      descricaoOcorrido: 'Bebedouro dando choque',
      status: Status.aberto,
    ),
    OsModel(
        id: 7,
        descricaoOcorrido: 'Ventilador do setor XA estragou',
        status: Status.fechado,
        trabalhoExecutado: 'Foi substituido o ventilador'),
  ];
}

enum Status {
  aberto,
  fechado,
  cancelado,
  aguardando,
}
