import 'package:ecellapp/models/member.dart';

/// Contains a list of <Member > and String category
class MemberCategory {
  final String category;
  List<Member> members;

  MemberCategory(this.category, this.members);
}
