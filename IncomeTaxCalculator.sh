#!/bin/bash
#--------------------------
#[Author] Andrew Costello
#[Description] Welcome page for tax calculator
#--------------------------
read -p "Enter your name: " name
read -p "Enter your salary before tax: €" salary
read -p "Are you married?: [y/n]" married
taxTotal=0
tax20Total=0
tax40Total=0
if [ "$married" = "n" ]; then
if [ "$salary" -lt 44000 ]; then
	tax20Total=$((salary * 20 / 100))
elif [ "$salary" -gt  44000 ]; then
	tax20Total=$((44000 * 20 / 100))
	tax40Total=$(((salary - 44000) * 40 / 100))
fi
elif [ "$married" = "y" ]; then
if [ "$salary" -lt 53000 ]; then
        tax20Total=$((salary * 20 / 100))
elif [ "$salary" -gt  53000 ]; then
        tax20Total=$((53000 * 20 / 100))
        tax40Total=$(((salary - 53000) * 40 / 100))
fi
fi
taxTotal=$((tax20Total+tax40Total))
totalSalary=$((salary-taxTotal))
echo "--------------------------"
echo "Tax Statement for: $name"
echo "Total salary after tax = €$totalSalary"
echo "Total tax paid = €$taxTotal"
echo "Tax paid at 20% = €$tax20Total"
echo "Tax paid at 40% = €$tax40Total"
