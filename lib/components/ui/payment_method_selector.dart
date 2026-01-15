import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PaymentMethod {
  final String id;
  final Widget icon;
  final String label;
  final String description;

  PaymentMethod({
    required this.id,
    required this.icon,
    required this.label,
    required this.description,
  });
}

class PaymentMethodSelector extends StatefulWidget {
  final String title;
  final String actionText;
  final List<PaymentMethod> methods;
  final String? defaultSelectedId;
  final VoidCallback? onActionClick;
  final ValueChanged<String>? onSelectionChange;
  final EdgeInsetsGeometry? padding;

  const PaymentMethodSelector({
    super.key,
    required this.title,
    required this.actionText,
    required this.methods,
    this.defaultSelectedId,
    this.onActionClick,
    this.onSelectionChange,
    this.padding,
  });

  @override
  State<PaymentMethodSelector> createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  late String _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedId = widget.defaultSelectedId ??
        (widget.methods.isNotEmpty ? widget.methods.first.id : '');
  }

  void _handleSelect(String id) {
    setState(() {
      _selectedId = id;
    });
    widget.onSelectionChange?.call(id);
  }

  @override
  Widget build(BuildContext context) {
    // Shadcn card aesthetics
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)), // muted border
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),
      padding: widget.padding ?? const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF0F172A), // slate-900
                ),
              ),
              InkWell(
                onTap: widget.onActionClick,
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    children: [
                      const Icon(LucideIcons.plus,
                          size: 16, color: Color(0xFF0F172A)),
                      const SizedBox(width: 4),
                      Text(
                        widget.actionText,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF0F172A),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // List
          Column(
            children: widget.methods
                .map((method) {
                  final isSelected = _selectedId == method.id;
                  return _buildMethodItem(method, isSelected);
                })
                .toList()
                .animate(interval: 50.ms)
                .fadeIn(duration: 300.ms, curve: Curves.easeOut)
                .slideY(begin: 0.1, end: 0, duration: 300.ms),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodItem(PaymentMethod method, bool isSelected) {
    final primaryColor = const Color(0xFF0F172A); // using clean black/slate
    final borderColor =
        isSelected ? primaryColor : const Color(0xFFE2E8F0); // slate-200

    return GestureDetector(
      onTap: () => _handleSelect(method.id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: isSelected ? 2 : 1),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.1),
                    blurRadius: 0,
                    spreadRadius: 0,
                    offset: const Offset(0, 0),
                  )
                ]
              : [],
        ),
        child: Row(
          children: [
            // Icon
            SizedBox(
              width: 40,
              height: 28, // constrained for card icons
              child: Center(child: method.icon),
            ),
            const SizedBox(width: 16),
            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    method.label,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    method.description,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF64748B), // slate-500
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Checkbox/Radio circle
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? primaryColor : const Color(0xFFE2E8F0),
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                        ),
                      )
                          .animate()
                          .scale(duration: 200.ms, curve: Curves.easeOutBack),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
