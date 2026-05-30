import os
import glob
import re
from collections import defaultdict

widgets_dir = "lib/core/widgets"
lib_dir = "lib"

widget_files = [os.path.basename(f) for f in glob.glob(os.path.join(widgets_dir, "*.dart"))]
usage_map = {w: set() for w in widget_files}

for root, _, files in os.walk(lib_dir):
    for f in files:
        if not f.endswith(".dart"):
            continue
        filepath = os.path.join(root, f)
        try:
            with open(filepath, 'r', encoding='utf-8') as file:
                content = file.read()
                for w in widget_files:
                    # check if the file imports this widget (or mentions it)
                    if f"core/widgets/{w}" in content or f"/{w}" in content:
                        # Extract feature name if it's in lib/features/X
                        if filepath.startswith("lib/features/"):
                            feature = filepath.split("/")[2]
                            usage_map[w].add(feature)
                        else:
                            usage_map[w].add("core_or_other")
        except Exception as e:
            print(f"Error reading {filepath}: {e}")

for w in sorted(usage_map.keys()):
    print(f"{w}: {', '.join(usage_map[w]) if usage_map[w] else 'NOT USED'}")
