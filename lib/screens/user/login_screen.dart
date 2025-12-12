import 'package:e_commerce/Widgets/bottom_navigator.dart';
import 'package:e_commerce/screens/user/registrationscreen.dart';
import 'package:e_commerce/service/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:e_commerce/data_base/function/user_functions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    // Assuming userr is a global instance from user_functions.dart as seen in original code
    // If not, might need to check where it comes from. Original code had: userr.getAlluser(); in build.
    // Ideally side effects belong in initState or similar.
    userr.getAlluser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                GestureDetector(
                  onTap: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade100,
                    ),
                    child: Icon(Icons.arrow_back_ios_new,
                        size: 16.sp, color: Colors.black),
                  ),
                ),
                SizedBox(height: 1.h),

                // Title
                Text(
                  'Login Now To Your\nAccount.',
                  style: GoogleFonts.manrope(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 1.h),

                // Subtitle
                Text(
                  'Access your account to manage settings,\nexplore features',
                  style: GoogleFonts.manrope(
                    fontSize: 13.sp,
                    color: Colors.grey.shade500,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 2.h),

                // Email Label
                Text(
                  'Email',
                  style: GoogleFonts.manrope(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 0.5.h),

                // Email Field
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field is empty';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.manrope(fontSize: 14.sp),
                  decoration: InputDecoration(
                    hintText:
                        'jamesschleifer@gmail.com', // Placeholder from design
                    hintStyle: GoogleFonts.manrope(
                        color: Colors.grey.shade400, fontSize: 13.sp),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade200),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade200),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.orange), // Accent color
                    ),
                  ),
                ),
                SizedBox(height: 1.5.h),

                // Password Label
                Text(
                  'Password',
                  style: GoogleFonts.manrope(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 0.5.h),

                // Password Field
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isObscure,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field is empty';
                    }
                    return null;
                  },
                  style: GoogleFonts.manrope(fontSize: 14.sp),
                  decoration: InputDecoration(
                    hintText: '••••••••',
                    hintStyle: GoogleFonts.manrope(
                        color: Colors.grey.shade400,
                        fontSize: 13.sp,
                        letterSpacing: 2),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade200),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade200),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.orange),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey,
                        size: 16.sp,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 1.5.h),

                // Remember me // Update: The image logic for login button is next in visual flow,
                // but usually "Remember me" is above button? Wait, looking at description:
                // Button is below fields. Then checkbox. Wait, image description I wrote:
                // Fields -> Button -> Checkbox/Forgot -> OR -> Social.
                // Let's re-verify typical flow for this specific layout.
                // Actually in the description: "Email... Password... Login Button... Checkbox... OR".
                // Yes.

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 5.5.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final Map<String, dynamic> value =
                            await UserApiService().login(_emailController.text,
                                _passwordController.text);
                        if (value['login'] == false) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.red,
                            content: Text(value['message']),
                          ));
                        } else {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: ((ctx) => const BottomNavigator())),
                              (Route<dynamic> route) => false);
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                          0xFFFFC107), // Amber/Orange color from image
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.manrope(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.5.h),

                // Remember Me & Forgot Password
                Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: _rememberMe,
                        activeColor: const Color(0xFFFFC107),
                        onChanged: (val) {
                          setState(() {
                            _rememberMe = val!;
                          });
                        },
                        side:
                            BorderSide(color: Colors.grey.shade400, width: 1.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                4)), // Slightly rounded checkbox
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      'Remember me',
                      style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        // Forgot Password Logic placeholder
                      },
                      child: Text(
                        'Forgot password?',
                        style: GoogleFonts.manrope(
                          fontSize: 12.sp,
                          color: const Color(0xFFE65100), // Darker orange
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),

                // OR Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        'OR',
                        style: GoogleFonts.manrope(
                          fontSize: 12.sp,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                  ],
                ),
                SizedBox(height: 2.h),

                // Social Buttons
                _buildSocialButton(
                  icon: Icons.g_mobiledata, // Placeholder
                  text: 'Sign in with Google',
                  // Using a generic way to show Google icon since assets might be missing
                  isGoogle: true,
                ),
                SizedBox(height: 1.5.h),
                _buildSocialButton(
                  icon: Icons.apple,
                  text: 'Continue with Apple',
                  isGoogle: false,
                ),
                SizedBox(height: 3.h),

                // Sign Up Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.manrope(
                        color: Colors.grey.shade600,
                        fontSize: 13.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const RegScreen(),
                        ));
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.manrope(
                          color: const Color(0xFFE65100),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
      {required IconData icon, required String text, required bool isGoogle}) {
    return Container(
      width: double.infinity,
      height: 5.5.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            // Social Login Logic
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Using a trick to display Google colors if it's google, else black
              isGoogle
                  ? ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                            colors: [
                              Colors.blue,
                              Colors.red,
                              Colors.yellow,
                              Colors.green
                            ],
                            stops: [0.25, 0.5, 0.75, 1.0],
                            tileMode: TileMode.mirror,
                          ).createShader(bounds),
                      child: Icon(Icons.circle,
                          size: 24) // Placeholder for Google Logo
                      )
                  : Icon(icon, color: Colors.black, size: 24),
              SizedBox(width: 3.w),
              Text(
                text,
                style: GoogleFonts.manrope(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
