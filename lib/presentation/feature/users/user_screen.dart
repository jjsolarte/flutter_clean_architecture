import 'package:flutter/material.dart';
import 'package:fluttertest/presentation/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<UserProvider>(context, listen: false);
      provider.loadUsers().then((_) {
        if (provider.error == null && provider.users.isNotEmpty) {
          showTotalUsersDialog(provider.users.length);
        }
      });
    });
  }

  void showTotalUsersDialog(int count) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Usuarios cargados'),
            content: Text('Total de usuarios obtenidos: $count'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (provider.error != null) {
          return Center(child: Text('Error: ${provider.error}'));
        }

        return ListView.builder(
          itemCount: provider.users.length,
          itemBuilder: (context, index) {
            final user = provider.users[index];
            return Card(
              margin: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.name.firstname} ${user.name.lastname}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Username: ${user.username}'),
                    SizedBox(height: 8),
                    Text('Email: ${user.email}'),
                    SizedBox(height: 8),
                    Text(
                      'Dirección: ${user.address.street}, ${user.address.city}',
                    ),
                    SizedBox(height: 8),
                    Text('Teléfono: ${user.phone}'),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
