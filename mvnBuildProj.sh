#! /bin/bash
# command usage example
#
source /etc/profile.d/maven.sh

# ./mvnBuildProj.sh UCF h3
#
# $1 is the "company" name in the example above it is UCF
# $2 is the program name in the example above it is h3
#    MAVEN WILL CREATE ALL THE FILES IN THE DIRECTORY NAMED IN $2
#    THIS INCLUDES A SIMPLE JAVA "Hello, World!" PROGRAM! 
#
# Derived from the "Maven in 5 minutes tutorial" available at:
# https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html
#
# This shell script will create a "Hello, World!" app in Java
# using maven's configure & build tools.
#
# IT IS HIGHLY RECOMMENDED TO USE THIS SCRIPT IN AN EMPTY DIRECTORY
# CREATED JUST FOR THIS EXAMPLE AND ITS TESTING.
#
# NOTE:
#   There will be an extensive directory set built for the app 
#   & testApp, roughly equivalent to all the directories created in Eclipse,
#   NetBeans and IntelliJ
#
mvn archetype:generate\
    -DgroupId=com.$1.app\
    -DartifactId=$2\
    -DarchetypeArtifactId=maven-archetype-quickstart\
    -DarchetypeVersion=1.4\
    -DinteractiveMode=false

cd $2

# Compile and build the Java app in $2
mvn package

java -cp target/$2-1.0-SNAPSHOT.jar com.$1.app.App
#
# See mvnExecute.sh for compiling and running the code 
