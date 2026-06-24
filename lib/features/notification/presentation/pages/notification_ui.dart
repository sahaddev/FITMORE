import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/notification/notification_bloc.dart';

int notificationCount = 1;

class ListOfNotification extends StatefulWidget {
  const ListOfNotification({super.key});

  @override
  State<ListOfNotification> createState() => _ListOfNotificationState();
}

class _ListOfNotificationState extends State<ListOfNotification> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationBloc>().add(const GetAllNotifications());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7), // Light grey background
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F5F7),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => NavigationService.pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (_) => const SizedBox.shrink(),
            failure: (message) => Center(
              child: Text(
                'Error: $message',
                style: const TextStyle(color: Colors.red),
              ),
            ),
            loaded: (notifications) {
              if (notifications.isEmpty) {
                return const Center(child: Text('No notifications'));
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionHeader('All Notifications'),
                      SizedBox(height: 1.5.h),
                      ...notifications.map((notif) {
                        return NotificationCard(
                          title: notif.title,
                          message: notif.message,
                          orderDetails: notif.subText ?? '',
                          time: notif.timeString ?? '',
                          isUnread: !notif.isRead,
                        );
                      }),
                      SizedBox(height: 4.h),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Missing notifications?',
                              style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 0.5.h),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Go to historical notifications.',
                                style: GoogleFonts.poppins(
                                  fontSize: 13.sp,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4.h),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Colors.grey[600],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String orderDetails;
  final String time;
  final bool isUnread;
  final bool hideStatusDot;

  const NotificationCard({
    super.key,
    required this.title,
    required this.message,
    required this.orderDetails,
    required this.time,
    this.isUnread = false,
    this.hideStatusDot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.5.h),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          Container(
            height: 12.w,
            width: 12.w,
            decoration: const BoxDecoration(
              color: Color(0xFFFFF4E5), // Light orange
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              'FM',
              style: GoogleFonts.poppins(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
          SizedBox(width: 3.w),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          time,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                        ),
                        if (!hideStatusDot && isUnread) ...[
                          SizedBox(width: 1.w),
                          Container(
                            width: 2.w,
                            height: 2.w,
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ]
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 0.5.h),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                    children: [
                      TextSpan(text: message),
                    ],
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  orderDetails,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
