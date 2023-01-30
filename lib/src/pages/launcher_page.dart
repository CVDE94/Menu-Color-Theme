import 'package:flutter/material.dart';
import 'package:flutter_theme/src/routes/routes.dart';
import 'package:flutter_theme/src/theme/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños en Flutter'),
      ),
      drawer: const _MenuPrincipal(),
      body: const _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(
        color: Colors.indigo,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: Colors.indigo,
        ),
        title: Text(pageRoutes[index].titulo),
        trailing: const Icon(
          Icons.chevron_right_outlined,
          color: Colors.indigo,
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => pageRoutes[index].page));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: 150,
                child: const CircleAvatar(
                  backgroundColor: Colors.indigo,
                  child: Text('CV', style: TextStyle(fontSize: 50)),
                ),
              ),
            ),
            const Expanded(
              child: _ListaOpciones(),
            ),
            ListTile(
              leading: const Icon(Icons.lightbulb_circle_outlined,
                  color: Colors.indigo),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                  value: appTheme.darkTheme,
                  activeColor: Colors.indigo,
                  onChanged: (value) => appTheme.darkTheme = value),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: const Icon(Icons.add_to_home_screen_outlined,
                    color: Colors.indigo),
                title: const Text('Custom Theme'),
                trailing: Switch.adaptive(
                    value: appTheme.customTheme,
                    activeColor: Colors.indigo,
                    onChanged: (value) => appTheme.customTheme = value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
