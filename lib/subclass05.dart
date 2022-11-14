import 'app_pupup_menu.dart';

class SubClass05 extends PopupMenu<String> {
  const SubClass05({
    Key? key,
    this.onSelect,
    this.onCancel,
  }) : super(key: key ?? const Key('SubClass05'));

  /// Quando uma opção de menu é selecionada
  final void Function(String value)? onSelect;

  /// Quando o menu é fechado sem nada selecionado
  final void Function()? onCancel;

  /// Lista de itens de menu a serem exibidos no menu pop-up.
  @override
  List<String>? onItems() => const ['Dentro', 'seu', 'próprio', 'classe'];

  /// Comente a linha onItems acima para obter essas entradas.
  @override
  List<PopupMenuEntry<String>> get menuItems => const [
    PopupMenuItem(
      child: Text('Este'),
    ),
    PopupMenuItem(
      child: Text('é'),
    ),
    PopupMenuItem(
      child: Text('outro'),
    ),
    PopupMenuItem(
      child: Text('caminho'),
    ),
  ];

  /// Comente os itens acima para que este itemBuilder retorne as opções do menu.
  @override
  List<PopupMenuEntry<String>> Function(BuildContext context)?
  get itemBuilder => (context) => const [
    PopupMenuItem(
      child: Text('Este'),
    ),
    PopupMenuItem(
      child: Text('é'),
    ),
    PopupMenuItem(
      child: Text('ainda'),
    ),
    PopupMenuItem(
      child: Text('outro'),
    ),
  ];

  /// O valor do item de menu, se houver, que deve ser destacado quando o menu for aberto.
  @override
  String? onInitialValue() => null;

  /// Chamado quando o usuário seleciona um valor do menu popup criado por este botão.
  @override
  void selected(String value) {
    onSelect?.call(value);
  }

  /// Chamado quando o usuário dispensa o menu popup sem selecionar um item.
  @override
  void canceled() {
    onCancel?.call();
  }

  /// Texto que descreve a ação que ocorrerá quando o botão for pressionado.
  @override
  String? onTooltip() => "As funções 'on' são implementadas nesta classe.";

  /// Isso controla o tamanho da sombra abaixo do menu.
  @override
  double? onElevation() => 12;

  /// Em alguns casos, é útil poder definir o preenchimento como zero.
  @override
  EdgeInsetsGeometry? onPadding() => const EdgeInsets.all(16);

  /// O raio de respingo. Se nulo, o raio de respingo padrão de [InkWell] ou [IconButton] é usado.
  @override
  double? onSplashRadius() => null;

  /// O widget usado para este botão
  @override
  Widget? onChild() => null;

  /// O ícone é usado para este botão
  @override
  Widget? onIcon() => null;

  /// o tamanho do [Ícone].
  @override
  double? onIconSize() => null;

  /// O deslocamento é aplicado em relação à posição inicial
  @override
  Offset? onOffset() => const Offset(0, 85);

  /// Se este botão do menu popup é interativo
  @override
  bool? onEnabled() => true;

  /// A forma usada para o menu
  @override
  ShapeBorder? onShape() => RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  );

  /// A cor de fundo usada para o menu
  @override
  Color? onColor() => Colors.yellow;

  /// Se os gestos detectados devem fornecer feedback acústico e/ou tátil
  @override
  bool? onEnableFeedback() => null;

  /// Se os gestos detectados devem fornecer feedback acústico e/ou tátil
  @override
  BoxConstraints? onConstraints() => null;

  /// Se o menu está posicionado sobre ou sob o botão do menu pop-up
  @override
  PopupMenuPosition? onPosition() => null;
}