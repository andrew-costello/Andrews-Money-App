#!/bin/bash
#--------------------------
#[Author] Andrew Costello
#[Description] Script for salary conversion.
#--------------------------
#!/bin/bash

salary_converter() {
    type=$1
    amount=$2

    case "$type" in
        hourly)
            hourly=$amount
            weekly=$(perl -e "printf '%.2f', $amount * 40")
            yearly=$(perl -e "printf '%.2f', $weekly * 52")
            monthly=$(perl -e "printf '%.2f', $yearly / 12")
            ;;
        weekly)
            weekly=$amount
            hourly=$(perl -e "printf '%.2f', $amount / 40")
            yearly=$(perl -e "printf '%.2f', $amount * 52")
            monthly=$(perl -e "printf '%.2f', $yearly / 12")
            ;;
        monthly)
            monthly=$amount
            yearly=$(perl -e "printf '%.2f', $amount * 12")
            weekly=$(perl -e "printf '%.2f', $yearly / 52")
            hourly=$(perl -e "printf '%.2f', $weekly / 40")
            ;;
        yearly)
            yearly=$amount
            weekly=$(perl -e "printf '%.2f', $amount / 52")
            hourly=$(perl -e "printf '%.2f', $weekly / 40")
            monthly=$(perl -e "printf '%.2f', $yearly / 12")
            ;;
    esac

    echo "Hourly: €$hourly"
    echo "Weekly: €$weekly"
    echo "Monthly: €$monthly"
    echo "Yearly: €$yearly"
}

read -p "What do you want to convert (hourly, weekly, monthly, yearly)? " type
read -p "Enter the amount: €" amount

salary_converter $type $amount
