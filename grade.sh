# Create your grading script here

set -e

rm -rf student-submission
git clone $1 student-submission
if [-f "student-submission/ListExample.java"] 
then exit
else echo "Wrong file!"
fi

cp TestListExamples.java student-submission
cd student-submission
javac ListExample.java TestListExamples.java
java ListExample TestListExamples
