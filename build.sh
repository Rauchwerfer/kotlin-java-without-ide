echo "Building..."

set -e  # Exit if any command fails

# Load paths
source paths_config.env

echo ""
echo "Configured Paths"
echo "JAVA_HOME: $LOCAL_JAVA_HOME"
echo "KOTLIN_HOME: $LOCAL_KOTLIN_HOME"
echo ""
echo "LOCAL_CLASS_PATH: $LOCAL_CLASS_PATH"
echo "LOCAL_JAR_OUTPUT_PATH: $LOCAL_JAR_OUTPUT_PATH"
echo ""

echo "Versions"
"$LOCAL_JAVA_HOME/bin/java" -version
echo ""
"$LOCAL_KOTLIN_HOME/bin/kotlinc" -version
echo ""

echo "Compiling *.java files..."
"$LOCAL_JAVA_HOME/bin/javac" -d "$LOCAL_CLASS_PATH" "com/example/Helper.java" --release 11

echo "Compiling *.kt files..."
"$LOCAL_KOTLIN_HOME/bin/kotlinc" -jdk-home "$LOCAL_JAVA_HOME" -cp "$LOCAL_CLASS_PATH" -d "$LOCAL_CLASS_PATH" "com/example/Main.kt"

echo "Creating *.jar file..."
"$LOCAL_JAVA_HOME/bin/jar" cfm ""$LOCAL_JAR_OUTPUT_PATH"/MyApp.jar" Manifest.txt -C "$LOCAL_CLASS_PATH" .


echo "Done."