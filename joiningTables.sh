#!/bin/bash
#Manvir Grewal : 10193283
#Aidan Polese : 10197342
#Kathleen Abols : 10179548
#Lianne Orlowski : 10204124


#assuming that student.txt, course.txt and student_course.txt are already in the current directory

# changes all the studentIDs to student names in the first column of student_course.txt and appends
# it to a new file
awk '{print $1}' student_course.txt | sed s/studentID/studentName/ | sed s/100123/Jack/ | sed s/323471/Mary/ | sed s/111234/Jim/ | sed s/124345/Eric/ | sed s/245722/Lori/ > output1.txt

# appends 2nd column to separate file
awk '{print $2}' student_course.txt | sed s/courseID/courseName/ > output2.txt

courseArray=()
# takes the contents of output2.txt (course IDs) and puts it into an array
while IFS= read -r line; do
	courseArray+=("$line")
done <output2.txt

# iterates through the array and assigns the courseID to the course name
for (( i=1; i<=${#courseArray[*]}; i++ )); do
	if ((courseArray[i]==1)); then
		courseArray[i]="Cisc220";
	elif ((courseArray[i]==2)); then
		courseArray[i]="Cisc124";
	elif ((courseArray[i]==3)); then
		courseArray[i]="Cisc222";
	elif ((courseArray[i]==4)); then
		courseArray[i]="Cisc129";
	elif ((courseArray[i]==5)); then
		courseArray[i]="Cisc432";
	fi
done

# prints the elements of the array back into the file separated by lines
printf "%s\n" "${courseArray[@]}" > output2.txt

# merges the two files into the outputFile.txt
paste output1.txt output2.txt > outputFile.txt

cat outputFile.txt

printf "\nSorted by the student name:\n"
# keeps the header of the file unsorted by printing it to a new file
head -n 1 outputFile.txt > nameSortedOutput.txt
# then from the 2nd line to the end of the file, sort and append to now sorted file
tail -n +2 outputFile.txt | sort -k1 >> nameSortedOutput.txt
cat nameSortedOutput.txt

printf "\nSorted by course name:\n"
head -n 1 outputFile.txt > courseSortedOutput.txt
tail -n +2 outputFile.txt | sort -k2 >> courseSortedOutput.txt
cat courseSortedOutput.txt

