import os

def fix_imports_and_structure():
    base_path = "workspace/hermes-sovereign-unified-v13.6"
    agent_path = os.path.join(base_path, "hermes-agent")
    core_path = os.path.join(agent_path, "yousef_shtiwe_cli_core")

    # 1. إصلاح الاستيرادات في ملفات النواة
    # سنقوم بإزالة 'from yousef_shtiwe_cli_core' واستبدالها باستيرادات مباشرة أو إضافة __init__.py
    for root, dirs, files in os.walk(agent_path):
        for file in files:
            if file.endswith(".py"):
                file_path = os.path.join(root, file)
                with open(file_path, 'r') as f:
                    content = f.read()
                
                # تصحيح الاستيرادات لتكون متوافقة مع PYTHONPATH
                new_content = content.replace("from yousef_shtiwe_cli_core.", "from ")
                new_content = new_content.replace("import yousef_shtiwe_cli_core.", "import ")
                
                if new_content != content:
                    with open(file_path, 'w') as f:
                        f.write(new_content)
                    print(f"[✓] Fixed imports in: {file_path}")

    # 2. إنشاء ملف __init__.py في كل مكان لضمان التعرف على المجلدات كحزم
    for root, dirs, files in os.walk(agent_path):
        if "__init__.py" not in files:
            with open(os.path.join(root, "__init__.py"), 'w') as f:
                f.write("# Sovereign Init")
            print(f"[✓] Created __init__.py in: {root}")

if __name__ == "__main__":
    fix_imports_and_structure()
