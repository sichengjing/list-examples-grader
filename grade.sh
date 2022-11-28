# Create your grading script here

set -e

rm -rf student-submission
git clone $1 student-submission
if [ -f "./student-submission/ListExamples.java" ]
then 
     echo "Found!"
else
     echo "Wrong file!"
     exit 1
fi

cd ..
cp  *.java grade.sh  ./student-submission/
cp -r lib ./student-submission/
cd student-submission

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples
