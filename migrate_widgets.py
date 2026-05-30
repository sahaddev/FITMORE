import os
import re
import shutil

moves = {
    # Used in exact one feature
    "address_card.dart": "lib/features/address/presentation/widgets/address_card.dart",
    "calcuate_cart.dart": "lib/features/cart/presentation/widgets/calcuate_cart.dart",
    "cart_payment_bottom.dart": "lib/features/payment/presentation/widgets/cart_payment_bottom.dart",
    "category_card.dart": "lib/features/home/presentation/widgets/category_card.dart",
    "change_password.dart": "lib/features/profile/presentation/widgets/change_password.dart",
    "coupon_note.dart": "lib/features/admin/presentation/widgets/coupon_note.dart",
    "dash_bord_card.dart": "lib/features/admin/presentation/widgets/dash_bord_card.dart",
    "favorite_card.dart": "lib/features/favorite/presentation/widgets/favorite_card.dart",
    "pay_card_productdel.dart": "lib/features/payment/presentation/widgets/pay_card_productdel.dart",
    "paym_addr_card.dart": "lib/features/payment/presentation/widgets/paym_addr_card.dart",
    "paym_last_product_del.dart": "lib/features/payment/presentation/widgets/paym_last_product_del.dart",
    "payment_addres_card.dart": "lib/features/payment/presentation/widgets/payment_addres_card.dart",
    "payment_bottom_last.dart": "lib/features/payment/presentation/widgets/payment_bottom_last.dart",
    "payment_secon_top_banner.dart": "lib/features/payment/presentation/widgets/payment_secon_top_banner.dart",
    "payment_widgets_main.dart": "lib/features/payment/presentation/widgets/payment_widgets_main.dart",
    "search_list.dart": "lib/features/home/presentation/widgets/search_list.dart",
    "splash_content.dart": "lib/features/splash/presentation/widgets/splash_content.dart",
    "tob_design_order.dart": "lib/features/payment/presentation/widgets/tob_design_order.dart",
    "visa_card.dart": "lib/features/payment/presentation/widgets/visa_card.dart",

    # Unused widgets
    "bottom_navigation_admin.dart": "lib/features/admin/presentation/widgets/bottom_navigation_admin.dart",
    "my_order_card.dart": "lib/features/orders/presentation/widgets/my_order_card.dart",
    "nitification_card.dart": "lib/features/notification/presentation/widgets/nitification_card.dart",
    "product_card.dart": "lib/features/home/presentation/widgets/product_card.dart",
    "product_card_second.dart": "lib/features/home/presentation/widgets/product_card_second.dart",
    "product_deatiles_card.dart": "lib/features/product_details/presentation/widgets/product_deatiles_card.dart",
    "profile_card.dart": "lib/features/profile/presentation/widgets/profile_card.dart",
    "search_bar_home.dart": "lib/features/home/presentation/widgets/search_bar_home.dart",
    "scrolling_image.dart": "lib/features/home/presentation/widgets/scrolling_image.dart",
    "sponser_banner.dart": "lib/features/home/presentation/widgets/sponser_banner.dart",
}

root_dir = os.getcwd()

# Step 1: Update imports
for dirpath, dirnames, filenames in os.walk("lib"):
    for f in filenames:
        if not f.endswith(".dart"):
            continue
        filepath = os.path.join(dirpath, f)
        
        with open(filepath, 'r', encoding='utf-8') as file:
            content = file.read()
            
        new_content = content
        modified = False
        
        for w, new_dest in moves.items():
            # Regex to find any import pointing to w, e.g. import '../../core/widgets/w';
            # Pattern: import '[^']*w';
            pattern = r"import\s+'([^']+)" + re.escape(w) + r"';"
            
            def repl(match):
                import_path = match.group(1) + w
                if "core/widgets" in import_path or "FITMORE" in import_path:
                    # Calculate new relative path
                    abs_new_dest = os.path.join(root_dir, new_dest)
                    abs_cur_file_dir = os.path.join(root_dir, dirpath)
                    new_rel = os.path.relpath(abs_new_dest, abs_cur_file_dir)
                    # Use forward slashes
                    new_rel = new_rel.replace(os.sep, '/')
                    return f"import '{new_rel}';"
                return match.group(0) # Not modified
            
            before = new_content
            new_content = re.sub(pattern, repl, new_content)
            if before != new_content:
                modified = True
                
        if modified:
            with open(filepath, 'w', encoding='utf-8') as file:
                file.write(new_content)
            print(f"Updated imports in {filepath}")

# Step 2: Move the files
for w, new_dest in moves.items():
    src = os.path.join("lib", "core", "widgets", w)
    dest = os.path.join(root_dir, new_dest)
    
    if os.path.exists(src):
        os.makedirs(os.path.dirname(dest), exist_ok=True)
        shutil.move(src, dest)
        print(f"Moved {w} to {new_dest}")
    else:
        print(f"File {src} not found (already moved?).")

print("Migration complete.")
