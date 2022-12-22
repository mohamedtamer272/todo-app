import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_application/model/tasks.dart';

CollectionReference getTaskCollection() {
  return FirebaseFirestore.instance.collection('tasks').withConverter<Task>(
        fromFirestore: (snapshot, options) => Task.fromjson(snapshot.data()!),
        toFirestore: (value, options) => value.tojson(),
      );
}

Future<void> addTaskToFireStore(Task task) {
  var collection = getTaskCollection();
  var docRef = collection.doc();
  task.id = docRef.id;
  return docRef.set(task);
}
