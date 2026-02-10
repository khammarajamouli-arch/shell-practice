#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER

echo "Script started at : $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privilage"
    exit 1
fi


VALIDATE(){
    if [ $1 -ne 0 ]; then
         echo -e "Installing $2 ... $R is failure $N"
        exit 1
    else
        echo  -e "Installing $2 .... $G is success $N"
    fi

}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then
   dnf install mysql -y &>>$LOG_FILE
   VALIDATE $? "mysql"
else
   echo -e "mysql already exists ... $Y skipping $N"
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "nginx already exists ... $Y skipping $N"
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python"
else
    echo -e "python already exists ... $Y skipping $N"
fi
