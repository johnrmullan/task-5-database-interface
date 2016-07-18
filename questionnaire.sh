#!/bin/bash

#This is  a questionnaire that allows for user input of answers. Then we will turn the answers into a .csv file. 
TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`

echo "What is your MySQL password?"
read PASSWORD

echo "What is your Github Username?"
read ans
echo $ans > answers.list

echo "Do you have a car?"
read ans1
echo $ans1 >> answers.list 

echo "Do you live on campus?"
read ans2
echo $ans2 >> answers.list

echo "Do you have a college scholarship?"
read ans3
echo $ans3 >> answers.list

echo "How many pets do you have?"
read ans4
echo $ans4 >> answers.list

echo "How many siblings do you have?"
read ans5
echo $ans5 >> answers.list

echo $TIMESTAMP >> answers.list

paste -d, -s answers.list >> temp.csv

mysql -u root --password=$PASSWORD questionnaire < answers.sql

mysql -u root --password=$PASSWORD questionnaire -e "LOAD DATA INFILE '/home/cabox/workspace/task-5-database-interface/temp.csv' INTO TABLE responses FIELDS TERMINATED BY ','"
 
mysqldump -u root --password=$PASSWORD questionnaire > answers.sql

rm temp.csv


