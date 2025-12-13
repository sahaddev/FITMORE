# Implementation Plan - Notification UI Update

Refactor `lib/application/features/notification/ui/notification_ui.dart` to match the provided design.

## 1. UI Structure
- **Scaffold**: Light grey background (`Colors.grey[50]` or similar).
- **AppBar**:
  - Leading: Back Icon (`Icons.arrow_back`).
  - Title: "Notifications" (Centred, Bold).
  - Actions: Settings Icon (`Icons.settings`).
- **Body**:
  - `SingleChildScrollView` containing:
    - "Today" Section Header.
    - List of Notification Cards for today.
    - "Previously" Section Header.
    - List of Notification Cards for previously.
    - Footer Text: "Missing notifications? Go to historical notifications." (Link style).

## 2. Components
- **`NotificationSectionHeader`**: Simple text widget for "Today" / "Previously".
- **`NotificationCard`**:
  - Container with `BoxDecoration` (White, Rounded Corners, Shadow/Border if needed).
  - Layout:
    - **Avatar**: CircleAvatar with light orange background, "FM" text in orange.
    - **Content**:
      - Title: "FitMore Store" (Bold).
      - Message: RichText for "your pickup order is **now ready!**".
      - Details: "Order #48291 • Ready for pickup" (Grey, smaller).
    - **Trailing**:
      - Time: "10m ago" (Top right).
      - Indicator: Yellow dot (if unread).

## 3. Data Mocking
- Mock the list items as seen in the screenshot to populate the sections.

## 4. Dependencies
- `google_fonts`: For typography (Poppins/Roboto).
- `sizer`: For responsive sizing (`.sp`, `.w`, `.h`).
