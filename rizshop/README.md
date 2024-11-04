## TUGAS 7

**1. jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.**

-StatelessWidget adalah widget yang tidak memiliki state (keadaan). yang berarti bahwa widget ini bersifat statis, tidak berubah setelah dirender. StatelessWidget cocok untuk menampilkan konten yang tidak memerlukan perubahan secara dinamis.

-StatefulWidget adalah widget yang memiliki state (keadaan) yang dapat berubah selama masa hidupnya. Setiap kali state berubah, widget akan merender ulang tampilan sesuai dengan data terbaru.

**Perbedaan StatelessWidget dan StatefulWidget**

-State
StatelessWidget : Tidak memiliki state yang bisa berubah setelah pertama kali dirender.
StatefulWidget : Memiliki state yang bisa berubah dan diperbarui secara dinamis.


-Kapan Digunakan	
StatelessWidget: Untuk konten atau tampilan yang tetap, tidak memerlukan pembaruan data.
StatefulWidget :
Untuk konten atau tampilan yang membutuhkan pembaruan atau perubahan berdasarkan interaksi pengguna atau data yang berubah.

-Contoh Penggunaan
StatelessWidget	: Label teks tetap, ikon, atau gambar statis.	
StatefulWidget : Formulir input, tombol yang merespons klik, counter yang bertambah, slider, animasi.

-Fungsi Utama
StatelessWidget	 : Tidak memiliki fungsi setState() karena tidak memerlukan pembaruan.	

StatefulWidget	: Memiliki fungsi setState() yang memungkinkan widget diperbarui ketika state berubah.



**2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.**

-MaterialApp: Widget ini menjadi entry point aplikasi berbasis Material Design. Digunakan untuk mengatur tema aplikasi serta menyediakan routing dan konfigurasi aplikasi secara global.

-Scaffold: Memberikan struktur dasar untuk halaman yang dilengkapi dengan AppBar, Body, dan FloatingActionButton. Scaffold juga menyediakan kerangka dasar untuk desain yang konsisten di setiap halaman aplikasi

-AppBar: Bagian atas halaman yang menampilkan judul atau informasi singkat. Dalam proyek ini, AppBar digunakan untuk menampilkan nama toko "Rizshop🏪" pada setiap halaman.

-Padding: Memberikan ruang di sekitar widget di dalamnya, memastikan jarak antar elemen teratur. Padding membantu menciptakan tampilan yang lebih rapi dan enak dilihat.

-Column: Menyusun widget secara vertikal. Column digunakan untuk menampilkan InfoCard dan elemen lainnya secara berurutan dalam halaman.

-Row: Menyusun widget secara horizontal. Dalam proyek ini, Row digunakan untuk menampilkan tiga InfoCard secara sejajar.

-InfoCard (kustom): Widget ini adalah kartu yang menampilkan informasi dasar, seperti NPM, Nama, dan Kelas. Di dalamnya terdapat Text untuk menampilkan title dan content.

-Center: Menyusun widget di tengah layar. Dalam proyek ini, Center membantu menempatkan elemen-elemen tertentu seperti Column yang menampilkan teks selamat datang dan GridView.

-GridView.count: Menyusun elemen dalam bentuk grid dengan jumlah kolom yang ditentukan. GridView digunakan untuk menampilkan ItemCard dalam format 3 kolom dengan jarak antar item.

-ItemCard (kustom): Kartu ini menampilkan ikon dan nama dari setiap item di halaman utama. ItemCard juga dilengkapi dengan fitur interaktif menggunakan InkWell untuk memberikan respons saat kartu ditekan.

-Material: Memberikan elemen tampilan dengan efek interaktif seperti bayangan dan sentuhan InkWell. Digunakan untuk membungkus ItemCard, sehingga kartu dapat memiliki efek interaksi ketika ditekan.

-InkWell: Menyediakan efek sentuhan atau animasi ketika widget ditekan. Digunakan untuk menangani aksi interaktif saat pengguna menekan ItemCard.

-Container: Widget yang digunakan untuk mengatur ukuran, margin, padding, dan warna latar dari widget di dalamnya. Digunakan dalam InfoCard dan ItemCard untuk menata tampilannya.

-Card: Digunakan sebagai dasar untuk menampilkan elemen berbentuk kartu dengan efek bayangan, seperti InfoCard.

-Text: Menampilkan teks statis pada layar. Widget ini digunakan untuk menampilkan teks seperti judul, nama toko, nama item, dan informasi kartu lainnya.

-Icon: Menampilkan ikon pada layar. Digunakan di dalam ItemCard untuk menggambarkan ikon sesuai fungsi item, misalnya ikon troli untuk produk, ikon tambah, dan ikon keluar.

-SnackBar: Menampilkan pesan notifikasi di bagian bawah layar saat suatu aksi terjadi. Dalam proyek ini, digunakan untuk menampilkan pesan ketika pengguna menekan salah satu ItemCard.

**3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.**

-Fungsi setState() berfungsi untuk memperbarui tampilan (UI) pada sebuah StatefulWidget saat terjadi perubahan pada data atau variabel yang ingin ditampilkan. Ketika setState() dipanggil, Flutter akan merender ulang bagian dari widget yang bergantung pada data atau variabel yang berubah, sehingga UI dapat menampilkan data terbaru

-Variabel yang dapat terdampak oleh setState() adalah variabel-variabel yang dideklarasikan dalam state dari sebuah StatefulWidget dan digunakan dalam metode build() untuk menampilkan data atau elemen UI pada layar.
variabel-variabel ini dapat mencakup:
-Variabel Data Tampilan
int counter = 0;

-Variabel Status Interaksi Pengguna
bool isButtonPressed = false;

-Variabel Kondisi Tampilan UI
Color backgroundColor = Colors.white;

-Data Sementara yang Bergantung pada State
String searchQuery = '';

-Variabel Kontrol untuk Animasi atau Progress
double animationValue = 0.0;


**4. Jelaskan perbedaan antara const dengan final.**

-Const
Kata kunci const digunakan untuk mendeklarasikan variabel yang merupakan konstanta compile-time. Ini berarti bahwa nilai variabel harus ditentukan pada saat kompilasi, dan tidak dapat diubah setelahnya. Nilai yang diberikan kepada variabel const harus bersifat tetap dan tidak akan berubah.

-Final
Kata kunci final digunakan untuk mendeklarasikan variabel yang juga bersifat tidak dapat diubah, tetapi nilainya dapat ditentukan pada saat runtime. Variabel yang dideklarasikan sebagai final harus diinisialisasi hanya sekali, dan setelah itu, nilainya tidak dapat diubah. Nilai final tidak perlu ditentukan pada saat kompilasi, sehingga dapat menggunakan hasil dari perhitungan atau fungsi untuk menginisialisasinya.

Perbedaan Const dan Final

-Waktu Penetapan Nilai:

const: Nilai harus ditetapkan pada saat kompilasi.
final: Nilai dapat ditetapkan pada saat runtime.

-Kemampuan untuk Mengubah:

const: Setelah ditentukan, nilai tidak dapat diubah dan bersifat konstan.
final: Setelah diinisialisasi, nilai tidak dapat diubah, tetapi dapat ditentukan melalui perhitungan atau fungsi.

-Penggunaan dalam Koleksi:

const: Koleksi yang dideklarasikan sebagai const juga tidak dapat diubah, termasuk elemen di dalamnya.
final: Koleksi yang dideklarasikan sebagai final dapat diubah (misalnya, user dapat menambahkan elemen), tetapi referensinya tidak dapat diubah untuk menunjuk ke koleksi baru.

**5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.**

-Pertama membuat file folder yang dimana untuk menyimpan proyek flutter saya kemudian meng create flutter nya bernama rizshop

-Selanjutnya merapihkan struktur proyek nya
membuat file baru yang bernama menu.dart di dalam file tersebut meng import package flutter 
material.dart

-Kemudian mengubah tema warna aplikasi nya disini saya memasukkan warna biru, setelah itu mengubah widget halaman menu menjadi stateless

-Membuat card yang berikan nama,npm, dan kelas, setalh itu membuat class baru bernama info card untuk menampilkan informasi yang diberikan 

-Membuat tombol button card
membuat class baru yang  bernama item home page kemudian menambahkan tombol tombol yang berisikan lihat item, tambah item, dan logout, kemudian saya mengubah ketiga warna tombol tersebut dengan nuansa biru tetapi dengan warna biru yang berbeda 



# rizshop

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

