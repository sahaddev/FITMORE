import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

int notificationCount = 1;

class ListOfNotification extends StatelessWidget {
  const ListOfNotification({super.key});

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
          onPressed: () => Navigator.pop(context),
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('Today'),
              SizedBox(height: 1.5.h),
              const NotificationCard(
                title: 'FitMore Store',
                messagePrefix: 'Hi Caitlyn Margusity, your pickup order is ',
                highlightedMessage: 'now ready!',
                orderDetails: 'Order #48291 • Ready for pickup',
                time: '10m ago',
                isUnread: true,
              ),
              const NotificationCard(
                title: 'FitMore Store',
                messagePrefix: 'Hi sahad Mp, your pickup order is ',
                highlightedMessage: 'now ready!',
                orderDetails: 'Order #48290 • Ready for pickup',
                time: '10m ago',
                isUnread: true,
              ),
              const NotificationCard(
                title: 'FitMore Store',
                messagePrefix: 'Hi jhon Mathew, your pickup order is ',
                highlightedMessage: 'now ready!',
                orderDetails: 'Order #48289 • Ready for pickup',
                time: '10m ago',
                isUnread: true,
              ),
              SizedBox(height: 3.h),
              _buildSectionHeader('Previously'),
              SizedBox(height: 1.5.h),
              const NotificationCard(
                title: 'FitMore Store',
                messagePrefix: 'Hi Spider Man, your pickup order is ',
                highlightedMessage: 'now ready!',
                orderDetails:
                    'Order #48100 • Pickup completed', // Inferred or dummy
                time: 'Yesterday',
                isUnread: false,
                hideStatusDot: true,
              ),
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
                      onTap: () {
                        // Navigate to historical
                      },
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
  final String messagePrefix;
  final String highlightedMessage;
  final String orderDetails;
  final String time;
  final bool isUnread;
  final bool hideStatusDot;

  const NotificationCard({
    super.key,
    required this.title,
    required this.messagePrefix,
    required this.highlightedMessage,
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
                      TextSpan(text: messagePrefix),
                      TextSpan(
                        text: highlightedMessage,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
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
