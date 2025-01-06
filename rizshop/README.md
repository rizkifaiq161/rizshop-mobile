## TUGAS 9

**1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?**

Membuat model untuk pengambilan atau pengiriman data JSON penting untuk memastikan struktur data yang konsisten, validasi otomatis, dan integrasi mudah dengan database. Model membantu menjaga integritas data, mengurangi risiko kesalahan, dan mempermudah pengembangan dengan menyediakan alat bawaan dari framework untuk operasi data.

Jika tidak membuat model terlebih dahulu, error tidak selalu terjadi secara langsung, tetapi ada potensi masalah yang dapat muncul di berbagai tahap pengembangan. Tanpa model, struktur data JSON mungkin tidak sesuai dengan yang diharapkan, sehingga meningkatkan risiko data tidak valid atau tidak konsisten. Hal ini bisa menyebabkan error di runtime, terutama saat data yang tidak sesuai format diproses atau disimpan ke database.

**2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini**

-Mengirim permintaan http

mengirimkan permintaan HTTP seperti GET dan POST . Permintaan ini dapat digunakan untuk mengambil data dari server, mengirim data, atau melakukan operasi CRUD lainnya pada sumber daya web.

-Mengelola URL dan koneksi 

Library http ini mendukung manipulasi URL dan pengelolaan koneksi HTTP/HTTPS, seperti membuka, mengirim data, dan menutup koneksi. Ini memastikan komunikasi antara klien dan server berjalan dengan benar.

-Menerima respon http
brary ini juga menangani respons dari server, termasuk membaca status code (200 OK, 404 Not Found, dll.), header, dan isi (body) dari respons.

**3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.**

Fungsi CookieRequest:

-Menyimpan Cookie Otomatis
CookieRequest menyimpan cookie yang dikirimkan oleh server, seperti session token atau data autentikasi, sehingga dapat digunakan kembali pada permintaan berikutnya tanpa memerlukan autentikasi ulang.

-Mengirim Cookie ke Server
Saat aplikasi melakukan permintaan HTTP, CookieRequest dapat menyertakan cookie yang telah disimpan sebelumnya ke dalam header permintaan. Hal ini penting untuk menjaga status login atau sesi pengguna.

-Mempermudah Autentikasi dan Sesi
CookieRequest mengelola cookie untuk menjaga pengguna tetap login selama sesi mereka berlangsung. Dengan cara ini, pengguna tidak perlu memasukkan ulang kredensialnya setiap kali berinteraksi dengan server.

-Mengelola Data HTTP
Selain cookie, CookieRequest biasanya memiliki fitur tambahan untuk mempermudah pengelolaan permintaan HTTP, seperti GET, POST, atau operasi lainnya.

Mengapa Instance CookieRequest Perlu Dibagikan ke Semua Komponen di Aplikasi Flutter?

-Mempertahankan Status Sesi
Dalam aplikasi yang membutuhkan autentikasi, cookie digunakan untuk menjaga sesi pengguna. Dengan membagikan instance CookieRequest, semua komponen aplikasi dapat menggunakan cookie yang sama untuk memastikan sesi tetap konsisten.

-Mencegah Duplikasi Data
Jika setiap komponen memiliki instance CookieRequest sendiri, cookie atau data sesi mungkin menjadi tidak sinkron, yang dapat menyebabkan error seperti pengguna dianggap logout meskipun sudah login.

-Efisiensi dalam Komunikasi HTTP
Dengan satu instance CookieRequest, semua permintaan HTTP menggunakan sumber daya yang sama untuk mengelola koneksi, sehingga lebih efisien dibandingkan membuat koneksi baru untuk setiap permintaan.

-Pengelolaan Terpusat
Membagikan instance CookieRequest memungkinkan pengelolaan cookie dan data terkait lainnya dilakukan secara terpusat, mempermudah debugging dan pengembangan.

-Konsistensi Pengalaman Pengguna
Dengan instance CookieRequest yang dibagikan, aplikasi dapat memberikan pengalaman yang mulus kepada pengguna, misalnya tetap login meskipun berpindah halaman atau komponen.


**4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.**

Mekanisme pengiriman data dari input hingga ditampilkan pada Flutter dimulai dengan pengguna memasukkan data melalui antarmuka aplikasi, seperti form atau field input. Data ini kemudian divalidasi di sisi Flutter untuk memastikan formatnya benar, misalnya memeriksa apakah field kosong atau sesuai format tertentu. Setelah validasi, data dikirim ke backend menggunakan protokol HTTP, biasanya dalam format JSON, melalui library seperti http. Backend menerima data tersebut, memprosesnya, dan menyimpannya ke dalam database jika diperlukan, sambil melakukan validasi tambahan untuk menjaga integritas data. Setelah data diproses, backend mengirimkan respons ke Flutter, yang berisi status operasi dan, jika berhasil, data yang diperlukan untuk ditampilkan. Flutter menerima respons tersebut, mengolahnya, dan memperbarui antarmuka menggunakan widget seperti Text atau lainnya untuk menampilkan data kepada pengguna


**5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.**

Register: User memasukkan data → Flutter mengirim data ke Django → Django menyimpan data akun → Django mengirim respons → Flutter menampilkan hasil.

Login: User memasukkan kredensial → Flutter mengirim data ke Django → Django memverifikasi dan mengirim token/session → Flutter menyimpan token dan mengarahkan ke menu.

Logout: Flutter mengirim permintaan logout → Django menghapus session/token → Flutter menghapus data lokal dan kembali ke halaman login.

Navigasi Menu: Setelah login, Flutter mengirim permintaan ke Django dengan token/session untuk memverifikasi identitas dan menampilkan data pengguna.


**6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).**

Secara keseluruhan, implementasi checklist diatas sesuai dengan yang ada di tutorial, tetapi ada beberapa hal yang saya tambahkan pada file Shop_Entry.dart dan shoplist_form.dart dimana saya menambahkan atribut amount/jumlah produk dengan tampilan seperti dibawah ini

-File Shop_Entry.dart

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.amount,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        amount: json["amount"],
    );

-File shoplist_form.dart

    onPressed: () async {
    if (_formKey.currentState!.validate()) {
    // Kirim ke Django dan tunggu respons
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    final response = await request.postJson(
        "http://127.0.0.1:8000/create-flutter/",
        jsonEncode(<String, String>{
            'name': _name,
            'price': _price.toString(),
            'description': _description,
            'amount': _amount.toString(),
        }));

###

## TUGAS 8
**1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?**

const adalah modifier yang digunakan untuk menandai objek sebagai konstan pada waktu kompilasi. Saat kita menandai suatu widget atau objek dengan const, artinya objek tersebut bersifat immutable dan tidak akan berubah selama aplikasi berjalan. Ini memberikan beberapa manfaat dalam hal performa, terutama dalam hal efisiensi memori dan penghematan proses rendering.

**keuntungan menggunakan const dalam flutter**

-Menghemat Memori: Dengan const, objek hanya dibuat sekali dan disimpan dalam memori untuk digunakan kembali. Jika ada dua atau lebih widget atau objek yang identik dan ditandai dengan const, mereka akan merujuk ke objek yang sama dalam memori.

-Meningkatkan Performa Rendering: Flutter menggunakan pendekatan declarative UI, di mana tampilan (UI) sering di-rebuild. Dengan const, widget tidak perlu di-rebuild jika sudah ada di memori, sehingga proses rendering menjadi lebih cepat.

-Mengurangi Overhead Waktu Kompilasi: Pada saat kompilasi, const memberitahu Dart bahwa objek ini bersifat tetap (immutable), jadi Dart tidak perlu lagi memeriksa atau menghitung ulang nilainya. Ini membuat aplikasi lebih efisien saat dijalankan.

**kapan sebaiknya menggunakan const?**

-Untuk Widget yang Tidak Berubah: Jika suatu widget atau nilai tertentu tidak berubah selama aplikasi berjalan, gunakan const. Contohnya, widget statis seperti Text, Icon, atau Container yang tidak tergantung pada input atau state.

-Saat Menggunakan Properti Literal: Misalnya, nilai seperti Text("Hello"), Icon(Icons.home), atau Color(0xFF000000) dapat ditandai dengan const jika nilainya tidak akan diubah.

-Untuk Objek yang Dapat Digunakan Kembali: Jika ada objek atau widget yang sama muncul berkali-kali di UI, gunakan const untuk mengurangi duplikasi objek di memori.

**kapan sebaiknya tidak menggunakan const?**

-Saat Objek Akan Berubah Berdasarkan State: Jika suatu widget atau objek dipengaruhi oleh setState() atau tergantung pada variabel yang bisa berubah, hindari penggunaan const. Karena const tidak bisa diterapkan pada objek yang berubah selama runtime.

-Untuk Objek yang Bergantung pada Input atau Parameter: Jika widget membutuhkan parameter yang dihasilkan secara dinamis atau bergantung pada input pengguna, lebih baik tidak menggunakan const.

***

**2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!**

Column: Menyusun widget secara vertikal, dari atas ke bawah.
Row: Menyusun widget secara horizontal, dari kiri ke kanan.

**Perbandingan column dan row**

 Pada Column, mainAxisAlignment menentukan posisi vertikal anak-anaknya, sedangkan pada Row, mengatur posisi horizontal. Demikian juga, crossAxisAlignment pada Column mengatur posisi horizontal anak-anaknya, sedangkan pada Row, mengatur posisi vertikal.

**contoh implementasi nya** 

implementasi Column

    Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text('Ini adalah widget pertama'),
        Text('Ini adalah widget kedua'),
        ElevatedButton(
        onPressed: () {},
        child: Text('Tombol'),
        ),
    ],
    );

implementasi Row 

    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Icon(Icons.home, size: 30),
            Icon(Icons.favorite, size: 30),
            Icon(Icons.person, size: 30),
        ],
    );

***
**3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!**

Elemen input yang digunakan 

TextFormField: Digunakan untuk input teks yang memerlukan validasi. Pada halaman ini, terdapat empat TextFormField:

-Nama Produk: Untuk memasukkan nama produk.

-Harga: Untuk memasukkan harga produk (tipe data integer).

-Jumlah: Untuk memasukkan jumlah produk (tipe data integer).

-Deskripsi: Untuk memberikan deskripsi produk.

ElevatedButton: Tombol untuk menyimpan data setelah pengguna mengisi form. Tombol ini menampilkan dialog konfirmasi jika form valid dan berhasil disimpan.

beberapa elemen innput flutter yang lain tidak digunakan seperti dropdownbutton,checkbox,radiobutton, switch, slider, dan lain lain

**4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?**
Mengatur tema dalam aplikasi Flutter dapat dilakukan dengan menggunakan properti theme pada MaterialApp.Dengan mengatur tema, dapat membuat tampilan aplikasi yang konsisten, seperti warna latar belakang, teks, tombol, dan elemen lainnya, sehingga seluruh halaman memiliki gaya visual yang seragam.

Ya, saya juga menerapkan tema di aplikasi yang saya buat

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Rizshop',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue, // Light blue as primary color
            ).copyWith(secondary: Colors.blue[900]), // Dark blue as secondary color
            useMaterial3: true,
        ),
        home : MyHomePage(),
        );
    }
    }


**5.Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?**
Untuk menangani navigasi dalam aplikasi Flutter yang memiliki banyak halaman, ada beberapa metode yang bisa digunakan, namun untuk aplikasi yang dibuat saat ini menggunakan Navigator yaitu ada Navigator push() dan Navigator Pop() 


****
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

