import os
import re

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
old_dir = os.path.join("lib", "core", "widgets")

for w, dest in moves.items():
    filepath = os.path.join(root_dir, dest)
    if not os.path.exists(filepath):
        continue
        
    with open(filepath, 'r', encoding='utf-8') as file:
        content = file.read()
        
    new_content = content
    modified = False
    
    # Regex to find all relative imports like import '../...' or import '../../...'
    pattern = r"import\s+'([^']+?\.dart)';"
    
    def repl(match):
        import_path = match.group(1)
        if not import_path.startswith('.'):
            return match.group(0) # Not a relative import
            
        # Absolute path of the imported file from the old perspective
        abs_imported = os.path.normpath(os.path.join(root_dir, old_dir, import_path))
        
        # New perspective is dirname of dest
        new_dir = os.path.dirname(os.path.join(root_dir, dest))
        
        # New relative path
        new_rel = os.path.relpath(abs_imported, new_dir)
        new_rel = new_rel.replace(os.sep, '/')
        
        # Ensure it starts with '.' or '..'
        if not new_rel.startswith('.'):
            new_rel = './' + new_rel
            
        return f"import '{new_rel}';"

    new_content = re.sub(pattern, repl, new_content)
    if new_content != content:
        with open(filepath, 'w', encoding='utf-8') as file:
            file.write(new_content)
        print(f"Fixed imports in {dest}")

