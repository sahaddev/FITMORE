# Implementation Plan - Home UI Update

Refactor the `HomeUi` to match a modern E-commerce design standard, using `sizer` for responsiveness and `google_fonts` for typography.

## 1. `lib/application/features/home/ui/home_ui.dart`
- **Header Section**:
  - Replace `AppBar` with a custom `SafeArea` + `Row` header.
  - Left: Profile Avatar (Asset).
  - Center/Left: "Hello Alex" (Gray) / "Good Morning!" (Bold Black).
  - Right: Notification ButtonIcon & Bag/Cart ButtonIcon.
- **Search Section**:
  - Keep `CusSearchBar`.
- **Categories Section**:
  - Move "Categories" title and "See All" into `CategoriesSection` widget.
  - Remove independent "Brand" text and row if it conflicts or is redundant (will likely keep or adapt).
- **Banner Section**:
  - Keep Carousel but ensure `ClearanceBanner` looks good.
- **Popular Products**:
  - Add "Popular Product" title before `ProductsGrid`.

## 2. `lib/application/features/home/widgets/category_section.dart`
- Uncomment the list view.
- Implementation of `ListView` with chips: "All", "Men", "Women", "Girls".
- Logic for selection (local state or just UI mock).
- Add Title "Categories" and "See All".

## 3. `lib/application/features/home/widgets/search_bar.dart`
- Update design to match typical modern search bars (rounded corners, search icon left, filter icon right).

## 4. `lib/application/features/home/widgets/clearance_bar.dart`
- Update styling if necessary to match "Special Sale" look.

## 5. `lib/application/features/home/widgets/home_gride.dart`
- Ensure grid looks correct with new layout.
