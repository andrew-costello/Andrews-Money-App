#!/bin/bash
#--------------------------
#[Author] Andrew Costello
#[Description] Script to Calculate Savings Interest
#--------------------------

read -p "Enter your name: " name
read -p "Enter your initial savings: €" initialValue
read -p "Enter monthly saving amount: €" monthlyValue
read -p "Enter amount of months you are saving for: " months
read -p "Enter Interest rate in % [e.g enter '2']: " interestRate

totalSavings=$((initialValue))
totalDeposits=$((initialValue))
intCalc=$((interestRate * 1000))
intCalc1=$((intCalc / 12))
totInt=$((100000 + intCalc1))
for ((i = 1; i <= months; i++)); do
	totalSavings=$(((totalSavings + monthlyValue) * totInt/ 100000))
	totalDeposits=$((totalDeposits + monthlyValue))
done
totalInt=$((totalSavings - totalDeposits))
echo "----------------------------"
echo "savings for: $name"
echo "Total Savings Value = €$totalSavings"
echo "Total Deposits Value = €$totalDeposits"
echo "Total Accumulated Interest = €$totalInt"
