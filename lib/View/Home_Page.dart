import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/Controller/database_controller.dart';
import 'package:flutter_exam/Services/Auth_Services.dart';
import 'package:flutter_exam/Services/Cloud_FireStore_Services.dart';
import 'package:flutter_exam/View/SignUp_Page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/attendance_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(AttendanceController());
    var dataController=Get.put(DatabaseController());
    String? date;
    String? selectDate;
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [
          IconButton(onPressed: () async {
            await AuthServices.authServices.signOutAcc();
            Get.to(SignupPage());
          }, icon: Icon(Icons.logout)),
          IconButton(onPressed: () async {
            await FireStoreServices.firebaseStoreServices.deleteDataFromFireStore();
            for(int i=0;i<dataController.dataList.length;i++)
              {
                String name=dataController.dataList[i]['name'];
                String date=dataController.dataList[i]['date'];
                String present=dataController.dataList[i]['present'];
                int id=dataController.dataList[i]['id'];
                await FireStoreServices.firebaseStoreServices.addDataInFireStore(name, date, present, id);
              }
          }, icon: Icon(Icons.sync)),
          IconButton(onPressed: () async {
            for(int i=0;i<dataController.dataList.length;i++)
              {
                int id=dataController.dataList[i]['id'];
                dataController.deleteData(id);
              }
            dataController.getData();
            await FireStoreServices.firebaseStoreServices.readDataFromFireStore();
          }, icon: Icon(Icons.backup)),
        ],
      ),
      body: Obx(
        () =>  Column(
          children: [
            Row(
              children: [
                Text('Search Record:',style: TextStyle(fontSize: 17),),
                IconButton(onPressed: () async {
                  DateTime?pickDate=await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime.now());
                  date=pickDate!.day.toString()+"-"+pickDate.month.toString()+"-"+pickDate.year.toString();
                  dataController.getDateData(date!);
                }, icon: Icon(Icons.calendar_month)),
                date!=null?Text(date!.toString()):SizedBox(),
                date!=null?IconButton(onPressed: () {
                  date=null;
                  dataController.getData();
                }, icon: Icon(Icons.cancel)):SizedBox(),
              ],
            ),
            Expanded(
              child: ListView.builder(itemCount:dataController.dataList.length,itemBuilder:(context, index) =>
                  Card(
                    child: ListTile(
                      title: Text(dataController.dataList[index]['name']),
                      subtitle: Text(dataController.dataList[index]['date']),
                      leading: Switch(value: dataController.dataList[index]['present']=="Yes"?true:false, onChanged: (value) {},),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: () {
                            controller.txtName.text=dataController.dataList[index]['name'];
                            controller.txtDate.text=dataController.dataList[index]['date'];
                            selectDate=dataController.dataList[index]['date'];
                            controller.type.value=dataController.dataList[index]['present']=='Yes'?true:false;
                            showDialog(context: context, builder: (context) => AlertDialog(
                              title: Text('Update Data'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: controller.txtName,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(),
                                        labelText: 'Enter Name'
                                    ),
                                  ).marginSymmetric(horizontal: 15,vertical: 10),
                                  TextField(
                                    controller: controller.txtDate,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(),
                                        labelText: 'Enter Date',
                                      suffixIcon:  IconButton(onPressed: () async {
                                        DateTime?pickDate=await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime.now());
                                        selectDate=pickDate!.day.toString()+"-"+pickDate.month.toString()+"-"+pickDate.year.toString();
                                        controller.txtDate.text=selectDate!;
                                      }, icon: Icon(Icons.calendar_month)),
                                    ),
                                  ).marginSymmetric(horizontal: 15,vertical: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('    Select Date:'),

                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('Present(Yes/No):'),
                                      Obx(
                                            () =>  Switch(value: controller.type.value, onChanged: (value) {
                                          controller.type.value=value;
                                        },),
                                      ),
                                    ],
                                  ),
                                ],),
                              actions: [
                                TextButton(onPressed: () {
                                  String name=controller.txtName.text;
                                  String present=controller.type.value==true?"Yes":"No";
                                  int id=dataController.dataList[index]['id'];
                                  dataController.updateData(name, selectDate!, present,id);
                    
                                  controller.txtName.clear();
                                  controller.txtDate.clear();
                                  controller.type.value=true;
                                  Get.back();
                                }, child: Text('Update')),
                    
                                TextButton(onPressed: () {
                                  controller.txtName.clear();
                                  controller.txtDate.clear();
                                  controller.type.value=true;
                                  Get.back();
                                }, child: Text('Cancle')),
                              ],
                            ),);
                          }, icon: Icon(Icons.edit)),
                          IconButton(onPressed: () {
                            int id=dataController.dataList[index]['id'];
                            dataController.deleteData(id);
                            dataController.getData();
                          }, icon: Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  ), ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text('Add Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            TextField(
              controller: controller.txtName,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  labelText: 'Enter Name'
              ),
            ).marginSymmetric(horizontal: 15,vertical: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('    Select Date:'),
                  IconButton(onPressed: () async {
                    DateTime?pickDate=await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime.now());
                    selectDate=pickDate!.day.toString()+"-"+pickDate.month.toString()+"-"+pickDate.year.toString();
                  }, icon: Icon(Icons.calendar_month)),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Present(Yes/No):'),
                Obx(
                  () =>  Switch(value: controller.type.value, onChanged: (value) {
                    controller.type.value=value;
                  },),
                ),
              ],
            ),
          ],),
          actions: [
            TextButton(onPressed: () {
              String name=controller.txtName.text;
              String present=controller.type.value==true?"Yes":"No";

              dataController.insertData(name, selectDate!, present);

              controller.txtName.clear();
              controller.txtDate.clear();
              controller.type.value=true;
              Get.back();
            }, child: Text('Add')),

            TextButton(onPressed: () {
              controller.txtName.clear();
              controller.txtDate.clear();
              controller.type.value=true;
              Get.back();
            }, child: Text('Cancle')),
          ],
        ),);
      },child: Icon(Icons.add),),
    );
  }
}
