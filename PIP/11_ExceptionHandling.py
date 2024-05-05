def divide_numbers():
    try:
        dividend = float(input("Enter the dividend: "))
        divisor = float(input("Enter the divisor: "))

        result = dividend / divisor
        print("Result of division:", result)

    except ValueError:
        print("Please enter valid numbers.")
    except ZeroDivisionError:
        print("Cannot divide by zero.")

divide_numbers()
