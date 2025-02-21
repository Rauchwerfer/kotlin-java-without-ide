echo "Build with custom paths"

set -e  # Exit if any command fails

# Load paths
source paths_config.env

echo ""
echo "Paths"
echo "Using JAVA_HOME: $LOCAL_JAVA_HOME"
echo "Using KOTLIN_HOME: $LOCAL_KOTLIN_HOME"
echo ""

echo "Versions"
"$LOCAL_JAVA_HOME/bin/java" -version
"$LOCAL_KOTLIN_HOME/bin/kotlinc" -version
echo ""

echo "Compiling *.java files..."
"$LOCAL_JAVA_HOME/bin/javac" -d bin "com/example/Helper.java" --release 11

echo "Compiling *.kt files..."
"$LOCAL_KOTLIN_HOME/bin/kotlinc" -jdk-home "$LOCAL_JAVA_HOME" -cp bin -d bin "com/example/Main.kt"

echo "Creating *.jar file..."
"$LOCAL_JAVA_HOME/bin/jar" cfm "out/MyApp.jar" Manifest.txt -C bin .


echo "Done."