import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHomeScreen;
  const CommonAppbar({super.key, required this.isHomeScreen});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isHomeScreen?Color(0xFF0C54BE):Color(0xFFCED3DC),
      title: Text('e-Shop',
          style: GoogleFonts.poppins(
              color: isHomeScreen?Colors.white:Color(0xFF0C54BE),
              fontWeight: FontWeight.bold
          )
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);

}

