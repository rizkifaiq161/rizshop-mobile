import 'package:rizshop/screens/shoplist_form.dart';
import 'package:rizshop/screens/menu.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  
  const ItemCard(this.item, {super.key}); 

  @override
  Widget build(BuildContext context) {
    // Mendefinisikan warna berdasarkan nama item.
    Color backgroundColor;
    Color iconAndTextColor;

    switch (item.name) {
      case "Lihat Daftar Produk":
        backgroundColor = Colors.lightBlue.shade200; // Biru muda
        iconAndTextColor = Colors.blue.shade900; // Biru tua
        break;
      case "Tambah Produk":
        backgroundColor = Colors.blue.shade300; // Biru medium
        iconAndTextColor = Colors.white; // Biru sedikit lebih gelap
        break;
      case "Logout":
        backgroundColor = Colors.blue.shade400; // Biru sedikit lebih terang
        iconAndTextColor = Colors.red; // merah
        break;
      default:
        backgroundColor = Theme.of(context).colorScheme.secondary;
        iconAndTextColor = Colors.white;
    }

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          if (item.name == "Tambah Produk") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopFormPage()));
          }else if (item.name == "Lihat Produk"){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopFormPage()));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: iconAndTextColor,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: iconAndTextColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}