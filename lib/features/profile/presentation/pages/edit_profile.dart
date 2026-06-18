import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/user/db_model.dart';
import '../widgets/change_password.dart';
import '../../../../core/widgets/h1_headline.dart';
import '../../../../core/widgets/mainbutton.dart';
import '../../../../core/widgets/text_field_reg.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';
import '../blocs/edit_profile/edit_profile_bloc.dart';

class EditProfile extends StatefulWidget {
  final UserModel user;
  const EditProfile({super.key, required this.user});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> foemKey = GlobalKey<FormState>();
  late TextEditingController _nameEditcontroller;
  late TextEditingController _phonenumberEditcontroller;
  late TextEditingController _emailEditconstroller;
  late TextEditingController _dbPasswordcontroller;

  final _oldPasswordEditcontroller = TextEditingController();
  final _newPasswordEditcontroller = TextEditingController();
  final _conformPasswordEditconstroller = TextEditingController();

  @override
  void initState() {
    _nameEditcontroller = TextEditingController();
    _phonenumberEditcontroller = TextEditingController();
    _emailEditconstroller = TextEditingController();
    _dbPasswordcontroller = TextEditingController();

    final userlist = ValueNotifier<List<UserModel>>([]).value;

    if (userlist.isNotEmpty) {
      _nameEditcontroller.text = widget.user.name!;
      _phonenumberEditcontroller.text = widget.user.phoneNumber!;
      _emailEditconstroller.text = widget.user.email!;
      _dbPasswordcontroller.text = widget.user.password!;
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameEditcontroller.dispose();
    _phonenumberEditcontroller.dispose();
    _emailEditconstroller.dispose();
    _dbPasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 40),
          const H1headline(text: 'Edit Profile'),
          const SizedBox(height: 62),
          TextFieldInReg(
            icon: Icons.person,
            labelText: "Name",
            hintText: 'Enter your name',
            validatorText: 'Field is Empty',
            keyboardType: TextInputType.name,
            obscureText: false,
            maxLength: null,
            nameController: _nameEditcontroller,
          ),
          const SizedBox(height: 15),
          TextFieldInReg(
            icon: Icons.phone_android,
            labelText: "Phone Number",
            hintText: 'Enter your phone number',
            validatorText: 'Field is Empty',
            keyboardType: TextInputType.phone,
            obscureText: false,
            maxLength: null,
            nameController: _phonenumberEditcontroller,
          ),
          const SizedBox(height: 15),
          TextFieldInReg(
            icon: Icons.email_sharp,
            labelText: "Email",
            hintText: 'Enter your email',
            validatorText: 'Field is Empty',
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            maxLength: null,
            nameController: _emailEditconstroller,
          ),
          const SizedBox(height: 10),
          ChangePasswordWidget(
              foemKey: foemKey,
              oldPasswordEditcontroller: _oldPasswordEditcontroller,
              newPasswordEditcontroller: _newPasswordEditcontroller,
              conformPasswordEditconstroller: _conformPasswordEditconstroller,
              dbPasswordcontroller: _dbPasswordcontroller,
              userModel: widget.user),
          const SizedBox(height: 18),
          BlocConsumer<EditProfileBloc, EditProfileState>(
            listener: (context, state) {
              state.maybeWhen(
                success: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
                  NavigationService.pop();
                },
                failure: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const Center(child: CircularProgressIndicator()),
                orElse: () => Button(
                  text: 'Update',
                  onPressedCallback: () {
                    context.read<EditProfileBloc>().add(
                      EditProfileEvent.updateProfile(
                        widget.user,
                        _nameEditcontroller.text,
                        _phonenumberEditcontroller.text,
                        _emailEditconstroller.text,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
