import 'package:get/get.dart';
import 'package:inventory_test/model/barang_model.dart';
import 'package:inventory_test/model/kategori_model.dart';
import 'package:inventory_test/service/api_service.dart';

class GlobalController extends GetxController {
  var barang = <BarangModel>[].obs;
  var kategori = <KategoriModel>[].obs;
  var isLoading = false.obs;

  final ApiService api = ApiService();

  @override
  void onInit() {
    fetchBarang();
    fetchKategori();
    super.onInit();
  }

  Future<void> fetchKategori() async {
    try {
      isLoading(true);
      var fetchedKategori = await api.getKategori();
      if (fetchedKategori.isNotEmpty) {
        kategori.assignAll(fetchedKategori);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchBarang() async {
    try {
      isLoading(true);
      var fetchedBarang = await api.getBarang();
      if (fetchedBarang.isNotEmpty) {
        barang.assignAll(fetchedBarang);
      }
    } finally {
      isLoading(false);
    }
  }

  void addProduct(BarangModel barang) async {
    try {
      isLoading(true);
      await ApiService().createProduct(barang);
      fetchBarang();
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteBarang(int id) async {
    try {
      isLoading(true);
      await ApiService().deleteProduct(id);
      fetchBarang();
    } finally {
      isLoading(false);
    }
  }

  void updateProduct(BarangModel updateBarang) async {
    try {
      isLoading(true);
      await ApiService.updateProduct(updateBarang);
      fetchBarang();
    } finally {
      isLoading(false);
    }
  }
}
