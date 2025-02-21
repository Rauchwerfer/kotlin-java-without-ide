echo "CLean up..."

set -e

# Load paths
source paths_config.env

echo "Removing $LOCAL_CLASS_PATH"
rm -rf "$LOCAL_CLASS_PATH"

echo "Removing $LOCAL_JAR_OUTPUT_PATH"
rm -rf "$LOCAL_JAR_OUTPUT_PATH"