def getLimit(): 
    name = 'Veronica Scheifer'
    print('Welcome to the store of', name)
    print('Lets do a credit analysis for you!')
    title = str(input('Please enter your title: '))
    print('Your title is', title)
    salary = float(input('Please enter your salary: '))
    print('Your salary is', salary)
    yearBirth = int(input('Please enter your year of birth: '))
    print('Your year of birth is', yearBirth)

    from datetime import datetime
    currentYear = datetime.today().year
    approximateAge =  currentYear - yearBirth 
    print('Your approximate age is', approximateAge)
    limit = salary * (approximateAge/1000) + 100
    print('Your limit is', limit)
    return limit 

def verifyProduct(limit): 
    product = str(input('Please enter your product name: '))
    productPrice = float(input('Please now enter the price of the product: '))
    fullName = str(input('Please enter your full name to calculate the discount: ')).strip()
    firstName = fullName.split()[0]
    fullNameSize = len(fullName)
    fullNameSize = len(fullName)

    print('Your first name is:', firstName)
    print('Your full name has the total of', fullNameSize, 'characters')

    yearBirth = int(input('Please re-enter your year of birth: '))
    print('Your year of birth is', yearBirth)
    from datetime import datetime
    currentYear = datetime.today().year
    approximateAge =  currentYear - yearBirth 

    blocked = 0

    if productPrice <= (0.6*limit):
        print('Released!')
    elif productPrice >= (0.6*limit) and productPrice <= (0.9*limit):
        print('Released when paid in up to 2 installments')
    elif productPrice >= (0.9*limit) and productPrice <= (0.10*limit):
        print('Released when paid in 3 or more installments')
    else:
        print('Blocked!')
        blocked = 1

    if (not blocked):
        if (productPrice >= fullNameSize and productPrice <= approximateAge):
            discount = firstNameSize
            print ('Your discount is: %d ' %discount)
            finalPrice = productPrice - discount
            print ('The final value with the discount is: %.2f ' %finalPrice)
        else:
            print('There is no discount.')

limit = getLimit()

productsQuantity = int(input("How many products do you want to register?"))
while (productsQuantity > 0):
    verifyProduct(limit)
    productsQuantity -= 1
