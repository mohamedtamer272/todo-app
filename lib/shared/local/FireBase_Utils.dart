import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/model/tasks.dart';

CollectionReference<Task> getTaskCollection() {
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

Stream<QuerySnapshot<Task>> getTaskFromFireStore(DateTime dateTime) {
  return getTaskCollection()
      .where('date',
          isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
      .snapshots();
}

Future<void> DeleteTaskFromFireStore(String id) {
  return getTaskCollection().doc(id).delete();
}

Future<void> EditTaskFromFireStore(Task task) {

  return getTaskCollection().doc(task.id).update(task.tojson());
}

Future<void> EditDateFromFireStore(Task task) {

  return getTaskCollection().doc(task.id).update(task.tojson());
}

Future<void> DoneTaskFromFireStore(Task task) {

  return getTaskCollection().doc(task.id).update(task.tojson());
}
