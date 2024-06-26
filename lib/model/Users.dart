class Users {
  final String email;
  final String uid;
  final String username;
  final String department;
  final bool supervisor;
  final bool? isActive;

  Users({
    required this.email,
    required this.uid,
    required this.username,
    required this.department,
    required this.supervisor,
    this.isActive,
  });
  factory Users.fromData(dynamic data) {
    return Users(
      email: data['email'],
      uid: data['uid'],
      username: data['username'],
      department: data['department'],
      supervisor: data['supervisor'],
      isActive: data['isActive'] ?? true,
    );
  }
}
