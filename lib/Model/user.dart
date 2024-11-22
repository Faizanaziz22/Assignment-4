
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a favorite location
  Future<void> addFavorite(String userId, Map<String, dynamic> favorite) async {
    final userDoc = _firestore.collection('users').doc(userId);

    await userDoc.set({
      'favorites': FieldValue.arrayUnion([favorite]),
    }, SetOptions(merge: true));
  }

  // Remove a favorite location
  Future<void> removeFavorite(String userId, Map<String, dynamic> favorite) async {
    final userDoc = _firestore.collection('users').doc(userId);

    await userDoc.update({
      'favorites': FieldValue.arrayRemove([favorite]),
    });
  }

  // Get user data
  Future<List<Map<String, dynamic>>> getUserData(String userId) async {
    final userDoc = await _firestore.collection('users').doc(userId).get();

    if (userDoc.exists && userDoc.data() != null) {
      final data = userDoc.data() as Map<String, dynamic>;
      return List<Map<String, dynamic>>.from(data['favorites'] ?? []);
    }

    return [];
  }
}