#!/bin/bash


USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

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

dnf list installed mysql
if [ $? -ne 0 ]; then
   dnf install mysql -y 
   VALIDATE $? "mysql"
else
   echo -e "mysql already exists ... $Y skipping $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "nginx already exists ... $Y skipping $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python"
else
    echo -e "python already exists ... $Y skipping $N"
fi