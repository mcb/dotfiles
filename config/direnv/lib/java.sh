# Java
#
# See: https://gist.github.com/rnorth/0fd5048da85957da39c17bd49c4ca922
#
# Usage:
#   Add to .envrc file:
#     use java adopt@1.11.0-6
#
use_java() {
   
    # Install the required version of Java if not already installed
    if [[ "$(jabba link $1)" == "" ]]; then
        echo "Java $1 is not installed; attempting to install"
        jabba install $1
    fi

    # Set JAVA_HOME, and load the required version of Java onto the path
    export JAVA_HOME=$(jabba link $1)/Contents/Home
    echo "JAVA_HOME=$JAVA_HOME"
    load_prefix "$JAVA_HOME"
}
