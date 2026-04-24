import 'package:agro_app/dummyData/dummy_data.dart';
import 'package:agro_app/features/firtilizer/firtilizer_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FertilizerController extends GetxController {
  var fertilizers = <FertilizerModel>[].obs;
  

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();

    listenToFertilizers();   // realtime fetch
     uploadFertilizersOnce(); // 👈 ek baar chalao phir comment kar dena
  }

  // 🔥 REALTIME FETCH
  void listenToFertilizers() {
    _db.collection('fertilizers').snapshots().listen((snapshot) {
      final data = snapshot.docs
          .map((doc) => FertilizerModel.fromMap(doc.data()))
          .toList();

      fertilizers.value = data;
    });
  }

  // 🚀 ONE TIME UPLOAD (SAFE VERSION)
  Future<void> uploadFertilizersOnce() async {
    try {
      print("🚀 Upload started...");

      final collection = _db.collection('fertilizers');

      // ✅ check if already data exists
      final existing = await collection.get();

      if (existing.docs.isNotEmpty) {
        print("⚠️ Data already exists, skipping upload");
        return;
      }

      // ✅ batch write (fast + professional)
      WriteBatch batch = _db.batch();

      for (var fertilizer in DummyData.data) {
        final docRef = collection.doc();
        batch.set(docRef, fertilizer);
      }

      await batch.commit();

      print("✅ Fertilizers uploaded successfully");
    } catch (e) {
      print("❌ Upload error: $e");
    }
  }
}