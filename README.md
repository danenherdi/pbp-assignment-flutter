# Danendra Herdiansyah - 2106707012 - PBP C

# Tugas 7

### _Stateless Widget_ dan _Stateful Widget_
_Stateless widget_ adalah widget yang tidak bisa berubah setelah widget tersebut dibuat. _Stateful widget_ adalah widget yang dapat berubah ketika aplikasi sedang berjalan. Perbedaan dari kedua jenis widget ini adalah _stateless widget_ memiliki sifat yang statis, tidak ada ketergantungan data yang bisa merubah _behaviour_-nya, dan tidak memiliki _state_ sehingga tidak dapat diperbarui datanya secara otomatis melainkan dari kode inisial. Sedangkan _stateful widget_ memiliki widget yang bersifat dinamis, widget yang dapat diubah sesuai dengan interaksi pengguna ataupun perubahan data saat aplikasi berjalan, dan memiliki _state_ yang dapat merubah _behaviour_ dari sebuah widget. Contoh dari _stateless widget_ bisa berupa text, icon, icon button dll. Sedangkan contoh dari _stateful widget_ bisa berupa checkbox, slider, form, textfield, radio button, dll. 
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
Widget yang dipakai dimulai dari `ListTile` yang digunakan untuk menyimpan widget di dalamnya dalam bentuk _row_ dengan tinggi yang _fixed_ dimana isi dari barisan tersebut terdapat widget `Navigator` yang digunakan untuk mengubah rute layar dari aplikasi. Kemudian di halaman form terdapat widget `SingleChildScrollView` yang digunakan untuk menyimpan widget-widget di dalamnya dengan fitur _scroll_ dalam satu kontainer dimana di dalamnya terdapat widget `Form` yang digunakan untuk mengambil input data dari pengguna dengan menggunakan widget `TextFormField` untuk mengambil data berupa text dan `DropdownMenuItem` untuk mengambil data berdasarkan _item_ yang dipilih. Kemudian terdapat juga widget `TextButton` yang memiliki _behaviour_ untuk menyimpan data dari form tersebut. Layar penampilan data memiliki widget `ListView` yang menyimpan widget di dalamnya berupa barisan yang menggunakan _scrolling_ untuk menyimpan widget lainnya dimana di dalamnya terdapat widget `Container` yang berbentuk _box_ untuk menyimpan data dari form.
<br>
<br>

### Jenis-Jenis Event yang ada pada Flutter
- _onFocusChange_
    Event yang dipanggil ketika terdapat pergantian fokus terhadap widget.
- _onHover_
    Event yang dipanggil ketika pointer mouse sedang berada di widget (masuk dan keluar dari widget).
- _onLongPress_
    Event ini dipanggil ketika widget tersebut dipecet dengan waktu yang lama untuk memunculkan _behaviour_-nya.
- _onPressed_
    Event ini dipanggil ketika widget tersebut dipencet sekali untuk menampilkan _behaviour_ yang dikeluarkan dari widget tersebut.
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
1. Penambahan drawer/hamburger menu dilakukan dengan menambahkan class `Drawer` yang berisi widget `Navigator`yang memiliki _behaviour_ saat dipencet berupa `pushReplacement` yang akan mengganti layar saat ini dengan `MaterialPageRoute`(rute) layar baru sesuai dengan `StatefullWidget` tujuan. Ketiga navigator tersebut kemudian dibungkus dalam `ListTile` yang merupakan bagian dari widget `Column` untuk dipasang ketiga rute tersebut.
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

# Tugas 9

### Pengambilan Data JSON Tanpa Membuat Model
Secara teknik yang terdapat di dokumentasi `dart:convert`, pengambilan data dari JSON bisa dilakukan setidaknya dengan dua cara yaitu serialisasi data JSON secara inline dan serialisasi dengan membuat _class_ model untuk data JSON. Serialisasi data JSON secara inline dilakukan dengan memanfaatkan _function_ `jsonDecode()` yang akan memakai `Map` untuk memetakan data seperti contoh `Map<String, dynamic> mywatchlist = jsonDecode(jsonString);`. Hal tersebut kemudian dipanggil secara inline di dart file (misal di widget Text) dengan `${mywatchlist['title_film']}`. Dikarenakan hal ini dilakukan secara spontan dengan kode inline, maka metode ini akan menyebabkan tipe dari value data tersebut tidak diketahui sampai runtime yang mengakibatkan kemungkinan eror semakin besar terhadap _type safety_. Sehingga metode ini masih dikatakan kurang baik dibandingkan dengan membuat _class_ model yang bisa memanggil kode dengan _type safety_.
<br>
<br>

### Widget yang Dipakai dalam Tugas 9
Halaman list mywatchlist :
- `FutureBuilder` digunakan untuk mendapatkan _snapshot_ data terbaru yang terhubung dengan _class_ `Future` dan _function_ `async` untuk mendapatkan data secara asinkronus yang kemudian akan dibangun dengan _builder_ untuk memaparkan data - data yang diambil.
- `ListView` digunakan untuk membangun data-data mywatchlist yang telah diambil dari JSON yang kemudian menggunakan _function_ `builder()` untuk iterasi setiap data yang didapat. Iterasi tersebut akan memunculkan data berdasarkan widget berikutnya yang dikembalikan secara linear yang berbentuk list yang dapat di-_scroll_.
- `InkWell` digunakan sebagai tempat atau area yang _material_ widget di dalamnya dapat melakukan respon _behaviour_ ketika disentuh. Di dalam widget tersebut terdapat juga widget `Container` yang digunakan untuk menyimpan widget Text berupa data judul film yang terdapat di mywatchlist. Pemakaian `InkWell` digunakan karena kebutuhan akan sebuah widget yang dapat melakukan _behaviour_ `onTap` yang akan memunculkan halaman baru. <br>
    (Referensi: https://stackoverflow.com/questions/44317188/flutter-ontap-method-for-containers)
- `Navigator` digunakan untuk memunculkan halaman baru setelah widget `InkWell` dipencet yang akan menggunakan metode `push()` untuk mengembalikan rute halaman baru dengan data-data yang sesuai.

Halaman detail mywatchlist :
- `SingleChildScrollView` digunakan untuk menyimpan widget-widget di dalamnya yang bisa di-_scroll_ secara linear.
- `Align` digunakan untuk menyimpan string text di tengah halaman secara horizontal 
- `RichText` digunakan untuk menyimpan string text dengan style yang berbeda. Style yang berbeda tersebut diaplikasikan dengan menggunakan widget `TextSpan` untuk memisahkan text satu dengan yang lainnya seperti _title_ yang menggunakan _fontWeight_ `TextStyle` bold dan _subtitle_ dengan _fontWeight_ normal. <br>
    (Referensi: https://stackoverflow.com/questions/41557139/how-do-i-bold-or-format-a-piece-of-text-within-a-paragraph)
- `TextButton` digunakan sebagai tombol berbasis text yang memiliki _behaviour_ ketika dipencet berupa widget `Navigator` yang akan mengembalikan rute ke halaman list mywatchlist.
<br>
<br>

### Mekanisme Pengambilan Data dari JSON
Pengambilan data pertama dilakukan dengan membuat sebuah _class_ model yang berisikan parameter-parameter dengan tipe data yang sesuai yang terdapat di JSON. Kemudian untuk mengambil data dari JSON yang kemudian menggunakan _request_ dari web dengan _GET_, maka dilakukan pembuatan `Factory `_method_ yang digunakan untuk menyediakan _interface_ untuk membuat objek dengan _method_ `fromJson()`. _Method_ tersebut dilakukan dengan memetakan parameter model dengan data di JSON dengan contoh `json["title_film"]`. Lalu untuk mengirim respon data ke web maka akan menggunakan _POST_ yang dilakukan dengan _method_ `toJson()`. _Method_ tersebut dilakukan dengan memetakan data yang terdapat di JSON dengan parameter variabel yang terdapat di _class_ model. Untuk mengambil kumpulan data dari JSON yang akan digunakan di projek maka dilakukan konversi data dari JSON dengan `json.decode` untuk mengkonversikan data dari JSON ke model berupa `List`. Hal sebaliknya jika ingin mengirim data ke kumpulan data JSON maka hal yang dilakukan adalah konversi data dari model dengan `json.encode` untuk mengkonversikan data dari model ke JSON berupa `List`. Kemudian di _class method_ `Future` dilakukan pengambilan dengan `fetch` yang bersifat `async` dengan URL yang dihubungkan dengan link data _endpoint_ JSON yang kemudian mengambil respon dari HTTP berupa _GET_. Lalu data dari respon tersebut akan dikonversikan dengan _jsonDecode_ menjadi bentuk JSON. 
<br>
<br>

### Pengimplementasian _Checklist_ Tugas 9
1. Penambahan tombol navigasi untuk ke halaman mywatchlist dilakukan dengan menambahkan widget `ListTile` yang berisi `Navigator` untuk mengubah rute halaman menjadi _stateful_ widget class `MyWatchlistPage()` di dalam file `navigator_drawer.dart`.
<br>

2. Pembuatan file dart yang berisi model mywatchlist dilakukan dengan menambahkan file `mywatchlist_model.dart` di dalam folder model dengan data json yang berasal dari https://aplikasi-tugas-danen.herokuapp.com/mywatchlist/json/ untuk kemudian dimasukkan ke dalam web https://app.quicktype.io/ yang akan mengkonversikan data JSON tersebut ke kode yang berbentuk model class untuk mywatchlist. Model tersebut berisikan variabel-variabel yang terdapat di parameter data JSON yang kemudian dikonversikan untuk mengirim data ke aplikasi berupa decode dan encode JSON dengan parameter data-data yang sesuai.
<br>

3. Penambahan halaman mywatchlist yang berisi semua watch list dilakukan dengan menambahkan class StatefulWidget yaitu `MyWatchlistPage` yang berisikan widget-widget untuk menampilkan data. Pengambilan data dari JSON dilakukan dengan menambahkan method fetch dari class `Future` dengan method `async` yang memiliki variabel url berupa link endpoint JSON dan response yang berisikan HTTP method berupa _GET_ untuk mengambil data yang kemudian akan dimasukkan ke dalam list dengan `fromJson()`. Kemudian untuk mengambil data secara asinkronus menggunakan widget `FutureBuilder()` yang mengambil parameter future berupa method fetch tersebut yang terhubung dengan `AsyncSnapshot`. Lalu menampilkan semua judul mywatchlist dengan menggunakan `ListView.builder` yang berisikan widget `InkWell` dengan `Container` yang berisi box berupa judul mywatchlist. Pemunculan data asinkronis dari snapshot tersebut dilakukan dengan widget `Text()` yang berisi string `"${snapshot.data![index].fields.titleFilm}"`.
<br>

4. Pembuatan navigasi dari setiap judul watchlist ke halaman detail dilakukan dengan menambahkan _behaviour_ `onTap` pada widget `InkWell()` berupa `Navigator.push` yang berisikan `MaterialPageRoute` yang akan mengatur rute halaman menjadi halaman detail mywatchlist (`DetailMywatchlistPage()`) dengan parameter-parameter yang sesuai.
<br>

5. Penambahan halaman detail untuk setiap mywatchlist dilakukan dengan menambahkan class StatefulWidget yaitu `DetailMywatchlistPage` yang berisikan widget-widget untuk isi data dari mywatchlist. Hal tersebut dilakukan dengan menambahkan widget `SingleChildScrollView` yang digunakan untuk menampilkan widget-widget di dalamnya secara linear vertikal. Memunculkan judul dari film dilakukan dengan widget `Align` yang berisikan `Text()` dengan posisi di tengah (horizontal) halaman. Pemunculan data-data lainnya (tanggal rilis, rating, status, dan review) dilakukan dengan widget `RichText` yang berisi `TextSpan` untuk menampilan text dengan style yang berbeda.
<br>

6. Penambahan tombol untuk kembali ke daftar mywatchlist dilakukan dengan menambhakna widget `TextButton` yang berada di bagian `bottomSheet` dengan _behaviour_ `onPressed` berupa navigator dengan metode `pop` yang mengembalikan rute halaman ke `MyWatchlistPage()` setelah rute tersebut di `push` saat menampilkan halaman detail.
<br>

7. Pengimplementasian bonus _refactor_ fetch data dari web service ke sebuah file terpisah dari `mywatchlist_page.dart` dilakukan dengan memindahkan kode _function_ fetch tersebut ke file lain (seperti `mywatchlist_model.dart`) yang kemudian akan diimpor package direktori file tersebut di `mywatchlist_page.dart` dan memanggil function tersebut pada bagian _future_ dengan `fetchMyWatchlist()`. Bonus selanjutnya yaitu penambahan warna outline untuk watch list berdasarkan status ditonton dilakukan dengan menambahkan _if else condition_ pada bagian penentuan warna pada boxshadow dengan `snapshot.data![index].fields.statusWatchedFilm ? Colors.green : Colors.red` yang akan melakukan pengecekan jika status nya true (sudah ditonton) maka akan berwarna hijau dan sebaliknya akan berwarna merah.

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
