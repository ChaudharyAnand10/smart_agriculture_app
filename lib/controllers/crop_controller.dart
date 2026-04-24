import 'package:agro_app/dummyData/dummy_data.dart';
import 'package:agro_app/models/crop_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CropController extends GetxController {
  var crops = <CropModel>[].obs;
  var filteredCrops = <CropModel>[].obs;
 
  

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
      debugFetch();     // 👈 add this

    listenToCrops();
    
    // uploadCropsOnce();
  }

  Future<void> uploadCropsOnce() async {
     print("chal rha hai hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh ");
    final FirebaseFirestore db = FirebaseFirestore.instance;

    for (var crop in DummyData.cropData) {
      await db.collection('crops').add(crop);
    }

    print("Crops uploaded successfully");
  }


void listenToCrops() {
  
  _db.collection('crops').snapshots().listen((snapshot) {
    final data = snapshot.docs
        .map((doc) => CropModel.fromMap(doc.data()))
        .toList();

     print("🔥 Docs count hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii: ${snapshot.docs.length}");

    crops.value = data;
    filteredCrops.value = data;
  });
}

void debugFetch() async {
  try {
    final snapshot = await _db.collection('crops').get();
    print("🧪 Manual fetch count: ${snapshot.docs.length}");
  } catch (e) {
    print("❌ Error: $e");
  }
}

  void searchCrop(String query) {
    if (query.isEmpty) {
      filteredCrops.value = crops;
    } else {
      filteredCrops.value = crops.where((crop) {
        return crop.searchKeywords.any(
          (keyword) => keyword.toLowerCase().contains(query.toLowerCase()),
        );
      }).toList();
    }
  }
}
