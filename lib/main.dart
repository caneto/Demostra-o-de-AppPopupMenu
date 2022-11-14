import 'package:flutter/material.dart';

import '../subclass01.dart';
import '../subclass03.dart';
import '../subclass05.dart';
import 'app_pupup_menu.dart';
import 'build_inherited_widget.dart';

void main() => runApp(const MyMenuExampleApp(key: Key('MyApp')));

class MyMenuExampleApp extends StatelessWidget {
  const MyMenuExampleApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BuildInheritedWidget(
      child: HomeScreen(
        key: Key('HomeScreen'),
      ),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Campos que fazem referência à classe de menu mutável
  late AppPopupMenu<String> appMenu01;
  late AppPopupMenu<String> appMenu03;
  late SubClass05 appMenu05;

  @override
  void initState() {
    super.initState();

    /// O menu do App vem de uma subclasse
    appMenu01 = SubClass01(key: const Key('SubClass01'));

    /// O menu do App vem de uma subclasse
    appMenu03 = SubClass03<String>(
        key: const Key('SubClass03'),
        onSelected: (String value) {
          InheritedData.of(appMenu03.context!)?.data = value;
          ScaffoldMessenger.of(appMenu03.context!).showSnackBar(
            SnackBar(
              content: Text('appMenu03 option: $value'),
            ),
          );
        });

//    appMenu03.items = ['1', '2', '3'];  // Descomente para ter precedência.

    // Comente para ver as opções do menu, 'Olha isso aqui!', abaixo.
    appMenu03.menuEntries = const [
      PopupMenuItem(
        value: '1',
        child: Text('Olha'),
      ),
      PopupMenuItem(
        value: '2',
        child: Text('isso'),
      ),
      PopupMenuItem(
        value: '3',
        child: Text('aqui!'),
      ),
    ];

    // Isso tem a menor precedência entre os itens de menu fornecidos.
    // Deve ter mais precedência? Você me diz.
    appMenu03.itemBuilder = (BuildContext context) => const [
      PopupMenuItem(
        value: '4',
        child: Text('Olhar'),
      ),
      PopupMenuItem(
        value: '5',
        child: Text('no'),
      ),
      PopupMenuItem(
        value: '6',
        child: Text('naquele!'),
      ),
    ];

    appMenu03.onCanceled = () {
      ScaffoldMessenger.of(appMenu03.context!).showSnackBar(
        const SnackBar(
          content: Text('appMenu03: Nada selecionado.'),
        ),
      );
    };
    //
    appMenu03.tooltip = "Aqui está uma dica para você.";
    appMenu03.elevation = 14;
    appMenu03.padding = const EdgeInsets.all(8);
    appMenu03.icon = const Icon(Icons.settings);
    appMenu03.shape =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));

    /// A subclass of the class, PopupMenu.
    appMenu05 = SubClass05(
        onSelect: (String value) {
          InheritedData.of(context)?.data = value;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('appMenu05 option: $value'),
            ),
          );
        },
        onCancel: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('appMenu05: Nothing selected.'),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Popup Menu Examples'),
      actions: [
        appMenu01.popupMenuButton,
        appMenu02, // a menu assigned to a getter instead.
        appMenu03.popupMenuButton,
        // Um menu anônimo não atribuído a uma variável.
        PopupMenu<String>(
          items: const [
            'Este',
            'é',
            'legal'
          ], // Comente isto para obter as entradas abaixo.
          menuEntries: const [
            PopupMenuItem(
              child: Text('Este'),
            ),
            PopupMenuItem(
              child: Text('é'),
            ),
            PopupMenuItem(
              child: Text('também.'),
            ),
          ], // Comente tudo acima para itemBuilder's 'Só é este!' Itens.
          itemBuilder: (context) => const [
            PopupMenuItem(
              child: Text('Só'),
            ),
            PopupMenuItem(
              child: Text('é'),
            ),
            PopupMenuItem(
              child: Text('este!'),
            ),
          ],
          onSelected: (String value) {
            InheritedData.of(context)?.data = value;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Opção anônima: $value'),
              ),
            );
          },
          onCanceled: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Anônimo: Nada selecionado'),
            ),
          ),
          tooltip: "Menu pop-up anônimo",
          elevation: 14,
          //  icon: const Icon(Icons.add_circle),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          //  color: Colors.amber,
          position: PopupMenuPosition.under,
        ),
        appMenu05,
      ],
    ),
    body: const MenuExampleAppBody(),
  );

  /// Forneça o menu com um getter.
  // Retorna o objeto de menu imutável.
  // Está listando todas as funções 'inline' disponíveis para você.
  PopupMenu<int> get appMenu02 => PopupMenu<int>(
//        items: const [1, 2],  // Descomente para ter precedência
    menuEntries: const [
      PopupMenuItem(
        value: 1,
        child: Text('Primeiro'),
      ),
      PopupMenuItem(
        value: 2,
        child: Text('Segundo'),
      ),
    ],
    onSelected: (int value) {
      InheritedData.of(context)?.data = value;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('appMenu02 option: $value'),
        ),
      );
    },
    onCanceled: () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('appMenu02: Nada selecionado.'),
        ),
      );
    },
    inTooltip: () {
      return "Aqui vai uma dica para você.";
    },
    inElevation: () {
      return 8;
    },
    inPadding: () {
      return null;
    },
    inSplashRadius: () {
      return null;
    },
    inChild: () {
      return null;
    },
    inIcon: () {
      return null;
    },
    inIconSize: () {
      return null;
    },
    inOffset: () {
      return const Offset(0, 65);
    },
    inEnabled: () {
      return null;
    },
    inShape: () {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      );
    },
    inColor: () {
      return Colors.deepOrangeAccent;
    },
    inEnableFeedback: () {
      return null;
    },
    inConstraints: () {
      return null;
    },
    inPosition: () {
      return null;
    },
  );
}

/// Exibido na tela principal do aplicativo.
class MenuExampleAppBody extends StatelessWidget {
  const MenuExampleAppBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = InheritedData.of(context)?.data;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$data',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}