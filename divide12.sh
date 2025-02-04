#!/bin/bash
#--------------------------
#[Author] Andrew Costello
#[Description] Script to Calculate Monthly Income
#--------------------------

read -p "Enter Yearly Salary to be converted to Monthly: €" salary
read -p "Enter Monthly Expenses: €" expenses
monthly=$((salary / 12))
echo "Monthly Income Before Expenses = €$monthly"
monthly=$((monthly - expenses))
echo "Monthly Income After Expenses = €$monthly"
