class BudgetModel{
  String? judul;
  int? nominal;
  String? jenis;

  BudgetModel(String inputJudul, int inputNominal, String? inputJenis) {
    judul= inputJudul;
    nominal = inputNominal;
    jenis = inputJenis;
  }
}

// Membuat list dari model
List<BudgetModel> listOfBudgets = [];