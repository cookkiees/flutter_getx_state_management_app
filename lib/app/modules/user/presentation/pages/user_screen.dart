import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/user_base_entity.dart';
import '../controllers/user_controller.dart';

class UserScreen extends GetView<UserController> {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "U S E R",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: buildUserWithObx(),
    );
  }

  FutureBuilder<List<UserBaseEntity>> buildUserWithFutureBuilder() {
    return FutureBuilder<List<UserBaseEntity>>(
      future: controller.handleUserFuture(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No users found.');
        } else {
          final users = snapshot.data;
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              await controller.handleUserFuture();
            },
            child: ListView.builder(
              itemCount: users?.length,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, index) {
                final user = users?[index];
                return Card(
                  child: ListTile(
                    title: Text(user?.name ?? ''),
                    subtitle: Text(user?.email ?? ''),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }

  Obx buildUserWithObx() {
    return Obx(
      () => controller.isLoadingUser.value
          ? const Center(child: CupertinoActivityIndicator())
          : RefreshIndicator.adaptive(
              onRefresh: () async {
                await controller.refreshUser();
              },
              child: ListView.builder(
                itemCount: controller.userList.length,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  final user = controller.userList[index];
                  return Card(
                    child: ListTile(
                      title: Text(user.name ?? ''),
                      subtitle: Text(user.email ?? ''),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
