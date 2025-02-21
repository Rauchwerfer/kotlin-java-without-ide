set -e

# Load paths
source paths_config.env

echo "Using JAVA_HOME: $LOCAL_JAVA_HOME"

"$LOCAL_JAVA_HOME/bin/java" -jar "$LOCAL_JAR_OUTPUT_PATH/MyApp.jar"