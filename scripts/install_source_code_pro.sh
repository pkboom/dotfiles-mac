SOURCE_CODE_PRO_DIR=~/.local/share/fonts/source-code-pro

git clone \
   --branch release \
   --depth 1 \
   'https://github.com/adobe-fonts/source-code-pro.git' \
   "$SOURCE_CODE_PRO_DIR"

echo "Builds font cache"
fc-cache -f "$SOURCE_CODE_PRO_DIR"