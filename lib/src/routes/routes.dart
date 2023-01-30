import 'package:flutter/material.dart';
import 'package:flutter_theme/src/pages/pages.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', const SlideShowPage()),
  _Route(FontAwesomeIcons.elementor, 'Emergencia', const EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', const HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarryBox, 'Cuadro Animado',
      const CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra Progreso',
      const GraficasCirculaesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', const PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', const SlideShowPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(
    this.icon,
    this.titulo,
    this.page,
  );
}
