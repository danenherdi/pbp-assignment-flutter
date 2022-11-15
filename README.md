# Danendra Herdiansyah - 2106707012 - PBP C

# Tugas 7

### _Stateless Widget_ dan _Stateful Widget_
_Stateless widget_ adalah widget yang tidak bisa berubah setelah widget tersebut dibuat. _Stateful widget_ adalah widget yang dapat berubah ketika aplikasi sedang berjalan. Perbedaan dari kedua jenis widget ini adalah _stateless widget_ memiliki sifat yang statis, tidak ada ketergantungan data yang bisa merubah _behavior_-nya, dan tidak memiliki _state_ sehingga tidak dapat diperbarui datanya secara otomatis melainkan dari kode inisial. Sedangkan _stateful widget_ memiliki widget yang bersifat dinamis, widget yang dapat diubah sesuai dengan interaksi pengguna ataupun perubahan data saat aplikasi berjalan, dan memiliki _state_ yang dapat merubah _behavior_ dari sebuah widget. Contoh dari _stateless widget_ bisa berupa text, icon, icon button dll. Sedangkan contoh dari _stateful widget_ bisa berupa checkbox, slider, form, textfield, radio button, dll. 
<br>
<br>


### Widget yang Dipakai dalam Program `counter_7`
Widget yang saya pakai dalam aplikasi `counter_7` adalah `MyApp` yang memiliki widget berupa text title dan `MyHomePage` yang yang memiliki widget berupa text ganjil/genap dan counter, button berbentuk `floatingActionButton` yang memiliki _state_ untuk _increment_ dan _decrement_, padding untuk mengatur batas button, row untuk mengatur posisi dua button, visibility untuk memunculkan dan menyembunyikan buttton, icon untuk tanda button, dan expanded untuk merentangkan row yang mengatur posisi button.
<br>
<br>

### Fungsi dari `setState()`
`setState()` adalah function bawaan dari class State yang fungsinya untuk mengubah object state dari sebuah widget secara dinamis sehingga diperlukan _passing state_ agar widget tersebut memiliki variabel yang dapat berubah di tampilan UI.
<br>
<br>

### Perbedaan antara `const` dengan `final`
Walaupun sama-sama memuat variabel yang bersifat _immutable_, perbedaan yang ada di kedua keyword tersebut ada pada pemberian (inialisasi) value di sebuah variabel. Variabel yang keywordnya `const` berarti value tersebut harus dinialisasi pada saat _compile time_ dengan nilai yang konstan sehingga saat proses kompilasi, variabel `const` tersebut sudah memiliki nilai. Sedangkan variabel yang keywordnya `final` berarti value tersebut dapat diketahui nilainya saat _runtime_ sehingga walaupun nilainya belum diketahui saat waktu kompilasi, variabel tersebut akan memiliki value yang bersifat dinamis (kalkulasi saat runtime) yang nilainya sudah _fixed_.
<br>
<br>


### Pengimplementasian _Checklist_ tugas 7 - `counter_7` 
1. Pembuatan program flutter
Setelah membuat direktori / tempat awal inisiasi program, maka _command_ `flutter create counter_7` dijalankan di command prompt untuk membuat proyek flutter baru.
<br>

2. Penambahan tombol '+' untuk menambahkan satuan angka dan tombol '-' untuk mengurangi satuan angka
Tombol tambah secara otomatis sudah terbuat saat pembuatan proyek flutter. Untuk memiliki dua tombol dengan posisi secara horizontal yang sama, maka ditambahkan widget `Row` yang di antara kedua widget ditambahkan widget `Expanded` untuk memisahkan kedua tombol dan  `crossAxisAlignment` pada row yang bernilai end untuk menyatakan button di posisi bawah. Kemudian di child `Row`, ditambahkan widget `FloatingActionButton` dengan spesifikasinya masing-masing. 
<br>

3. Perubahan state _counter_ untuk tombol '-'
Untuk menambahkan fungsi button saat ditekan, maka pada function button `onPressed` ditambahkan function `_decrementCounter`. `_decrementCounter` merupakah sebuah function yang berisi untuk mengurangi counter dan akan tetap bernilai 0 jika counter sudah bernilai 0. Implementasi tersebut dilakukan dengan menambahkan `_counter--;`
<br>

4. Pengimplementasian text ganjil/genap
Dikarenakan diperlukan perubahan state pada widget text, maka pada class `_MyHomePageState` ditambahkan function state baru `_isGanjilGenap()` dengan `setState()` yang berfungsi untuk mengetahui jika sisa pembagian counter dengan angka 2 bernilai 0 (dapat dibagi dengan 2) maka angka counter disebut genap dan warna dari text akan berwarna merah, selain itu bernilai ganjil dengan warna biru. Perubahan warna dilakukan dengan membuat variabel `_color` dengan class `Color` yang kemudian di widget text ganjil/genap ditambahkan function style berupa `TextStyle` yang berisi `color` yang isinya adalah value dari `_color`.
<br>

5. Penambahan fitur hilang/sembunyi tombol '-' saat counter bernilai 
Untuk melakukan fitur tersebut, maka yang perlu ditambahkan adalah widget `Visibility`. Widget tersebut akan mengambil sebuah parameter bool (true/false) terhadap function `visible`. Dikarenakan fitur ini merubah state tombol, maka pada class `_MyHomePageState` ditambahkan variabel bertipe bool yang dinamakan `_isVisible` dengan nilai default false (karena counter awal bernilai nol). Nilai tersebut akan berubah menjadi true ketika nilai counter lebih dari 0 di function `_incrementCounter()` dan kembali menjadi false ketika nilai counter sudah 0 di function `_decrementCounter()`. Kemudian untuk menambahkan tombol mana yang akan hilang, penempatan `FloatingActionButton` tombol '-' akan berada di child dari widget `Visibility`.
<br>

<hr>

# Tugas 8

### Perbedaan `Navigator.push` dengan `Navigator.pushReplacement`
 Perbedaan yang terdapat di kedua metode terdapat pada rute layar baru yang ditampilkan dimana ketika memakai `push` berarti rute layar baru yang ingin dikeluarkan hanya tampil sebagai urutan layar yang baru sehingga bisa kembali ke rute layar yang lama dengan menggunakan `pop`. `Navigator.push` biasanya digunakan ketika ingin memberikan layar baru yang tidak meninggalkan data-data di layar lama atau dalam kata lain terdapat tombol `back` untuk kembali ke layar lama. Sedangkan `pushReplacement` berarti mengganti keseluruhan rute layar saat ini dengan rute layar yang baru yang kemudian membuang rute sebelumnya setelah rute baru selesai terbuka.
<br>
<br>


### Widget yang Dipakai dalam Tugas 8 
Widget yang dipakai dimulai dari `ListTile` yang digunakan untuk menyimpan widget di dalamnya dalam bentuk _row_ dengan tinggi yang _fixed_ dimana isi dari barisan tersebut terdapat widget `Navigator` yang digunakan untuk mengubah rute layar dari aplikasi. Kemudian di halaman form terdapat widget ` SingleChildScrollView` yang digunakan untuk menyimpan widget-widget di dalamnya dengan fitur _scroll_ dalam satu kontainer dimana di dalamnya terdapat widget `Form` yang digunakan untuk mengambil input data dari pengguna dengan menggunakan widget `TextFormField` untuk mengambil data berupa text dan `DropdownMenuItem` untuk mengambil data berdasarkan _item_ yang dipilih. Kemudian terdapat juga widget `TextButton` yang memiliki _behavior_ untuk menyimpan data dari form tersebut. Layar penampilan data memiliki widget `ListView` yang menyimpan widget di dalamnya berupa barisan yang menggunakan _scrolling_ untuk menyimpan widget lainnya dimana di dalamnya terdapat widget `Container` yang berbentuk _box_ untuk menyimpan data dari form.
<br>
<br>

### Jenis-Jenis Event yang ada pada Flutter
- _onFocusChange_
    Event yang dipanggil ketika terdapat pergantian fokus terhadap widget.
- _onHover_
    Event yang dipanggil ketika pointer mouse sedang berada di widget (masuk dan keluar dari widget).
- _onLongPress_
    Event ini dipanggil ketika widget tersebut dipecet dengan waktu yang lama untuk memunculkan _behavior_-nya.
- _onPressed_
    Event ini dipanggil ketika widget tersebut dipencet sekali untuk menampilkan _behavior_ yang dikeluarkan dari widget tersebut.
- _onChanged_
    Event tersebut dipanggil ketika widget `TextField` telah diubah valuenya untuk menyimpan data.
- dll.
<br>
<br>

### Cara Kerja `Navigator`
`Navigator` memiliki tata cara penggunaan yang mirip dengan _stack_ pada umumnya. Cara kerja yang mirip tersebut terdapat pada `push` dan `pop` dimana ketika terjadi `Navigator.push` berarti rute dari layar aplikasi akan di-_push_ ke navigator yang kemudian akan mengganti dengan layar baru dengan menyimpan layar yang lama. Kemudian ketika terjadi `Navigator.pop` maka layar yang terbaru (saat ini ditampilkan) akan di-_pop_ atau dikeluarkan dari navigator yang mengganti layar baru ke satu rute layar sebelumnya.
<br>
<br>


### Pengimplementasian _Checklist_ Tugas 8 
1. Penambahan drawer/hamburger menu dilakukan dengan menambahkan class `Drawer` yang berisi widget `Navigator`yang memiliki _behavior_ saat dipencet berupa `pushReplacement` yang akan mengganti layar saat ini dengan `MaterialPageRoute`(rute) layar baru sesuai dengan `StatefullWidget` tujuan. Ketiga navigator tersebut kemudian dibungkus dalam `ListTile` yang merupakan bagian dari widget `Column` untuk dipasang ketiga rute tersebut.
<br> 

2. Penambahan dua tombol navigasi pada drawer/hamburger untuk halaman form dan data dilakukan dengan mengisi _context_ `MaterialPageRoute` dengan menambahkan rute dengan class widget halaman form dan halaman data yang sesuai (`TambahBudgetFormPage()` dan `DataBudgetViewPage()`). 
<br>

3. Penambahan halaman form dilakukan dengan menambahkan file baru bernama `tambah_form.dart` yang merupakan `StatefulWidget` yang memiliki _state_ berisi widget `Form()` pada bagian body _scaffold_. Untuk mengambil data input maka dibuatlah beberapa variabel dimana salah satunya variabel yang berguna untuk validasi dan mengidentifikasi form dengan `GlobalKey<FormState>()`. Kemudian form key tersebut ditambah pada bagian key di widget form. Setelah validasi form, maka untuk memunculkan tempat mengisi form, maka hal yang dilakukan adalah dengan menambahkan widget `TextFormField` untuk menyimpan judul budget dan nominal budget saat state-nya `onChanged` maka akan menyimpan data tersebut sesuai dengan variabelnya. Dikarenakan nominal bertipe data integer maka saat pengambilan data, `inputFormatters` diset filtering nya menjadi karakter angka saja dan kemudian menggunakan `int.parse(value)` untuk mengubah string menjadi integer. Pemilihan jenis budget dilakukan dengan `DropdownMenuItem` yang isinya list berisi string jenis yang ketika `onChanged`, jenis budget tersebut akan disimpan. Kemudian di paling bawah layar terdapat `TextButton` yang ketika dipencet maka akan melihat apakah key form tersebut valid dan ketika valid maka hal yang terjadi adalah menambahkan data-data dari input tersebut dan pindah ke rute layar halaman tampilan data.
<br>

4. Penambahan halaman data _budget_ dilakukan dengan menambahkan file baru bernama `data_view.dart` yang merupakan `StatefulWidget` yang memiliki _state_ berisi widget `ListView` untuk menampilkan data budget. Namun untuk menyimpan data yang telah diinput dari form maka hal yang dilakukan adalah menambahkan model terhadap budget dengan file `model.dart` yang berisi _constructor_ dengan variabel-variabelnya serta list dari model itu untuk menyimpan berbagai input data. Lalu untuk menampilkan data di layar, hal yang dilakukan adalah dengan mengambil data dari list model tersebut dengan _mapping_ ke `Column` yang berisi widget Text untuk data-data yang sesuai.
<br>

5. Pengimplementasian bonus terhadap _refactor_ widget `Drawer` dilakukan dengan menambahkan file `navigator_drawer.dart` yang berisi class _extend_ dari `Drawer`. Setelah itu menambahkan widget navigator dengan rute layar yang sesuai dengan judul navigatornya.
<br>

<br>
<hr>

# Counter_7
A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
