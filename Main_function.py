from sql_connection import get_sql_connection
from product_function import get_all_products
import time

class CashierApp:
    def __init__(self):
        self.connection = get_sql_connection()
        self.all_products = get_all_products(self.connection)
        self.cart = []

    def add_product_to_cart(self, product_id, quantity):
        selected_product = next((product for product in self.all_products if product['id'] == product_id), None)


        if selected_product:
            total_price = selected_product['price_per_unit'] * quantity
            self.cart.append({
                'id': selected_product['id'],
                'name': selected_product['name'],
                'quantity': quantity,
                'total_price': total_price
            })
            print("==================================================")
            print("Product added to cart      Quantity      Sub-price")
            print("--------------------------------------------------")
            print(f"{selected_product['name']}                    {quantity}            ₱{total_price}")
            print("--------------------------------------------------")
            print("==================================================")
        else:
            print(f"Product with ID {product_id} not found. Please try again.")

    def display_cart(self):
        if not self.cart:
            print("Cart is empty.")
        else:
            print("Cart:")
            print("==================================================")
            print("Product in the cart      Quantity      Sub-price")
            print("--------------------------------------------------")
            for item in self.cart:
                print(f"{item['name']}                    {item['quantity']}            ₱{item['total_price']}")
            print("--------------------------------------------------")
            print("==================================================")

    def checkout(self):
        self.display_cart()
        total_price = sum(item['total_price'] for item in self.cart)
        print(f"Total Price: ₱{total_price}")
        while True:
            try:
                payment = float(input("Please Enter your Payment: ₱"))

                if payment >= total_price:
                    change = payment - total_price
                    print("                   ALDP MEGA MALL                ")
                    time.sleep(0.5)
                    print("              Welcome to ADLP MEGA MALL            ")
                    time.sleep(0.5)
                    print("---------------------------------------------------")
                    time.sleep(0.5)
                    print("                   Your Receipt                    ")
                    time.sleep(0.5)
                    print("---------------------------------------------------")
                    time.sleep(0.5)
                    print("Item                  Quantity(pcs/kg)    Sub Price")
                    print("---------------------------------------------------")
                    time.sleep(0.5)
                    for item in self.cart:
                        print(f"{item['name']}                  {item['quantity']}               ₱{item['total_price']}")
                    time.sleep(0.5)
                    print("---------------------------------------------------")
                    time.sleep(0.5)
                    print(f"Total Amount:                               ₱{total_price}")
                    print(f"Payment:                                    ₱{payment}")
                    time.sleep(0.5)
                    print(f"Your change is:                             ₱{change}")
                    time.sleep(0.5)
                    print("===================================================")
                    time.sleep(0.5)
                    print("    We appreciate your Shopping to our Store. ")
                    print("Thank you for shopping with us!, Please Come Again. ")
                    print("")
                    self.insert_transaction(total_price, payment, change)
                    self.cart = []  # Reset the cart after checkout
                    break  # Exit the checkout loop
                else:
                    print("Insufficient payment. Please enter a higher amount.")
            except ValueError:
                print("Invalid input. Please enter a valid number.")

    def insert_transaction(self, total_price, payment, change):
        try:
            cursor = self.connection.cursor()

            # Construct SQL INSERT statement
            sql = "INSERT INTO transactions (item_name, total_price, payment, change_amount) VALUES (%s,%s, %s, %s)"
            values = (", ".join([item['name'] for item in self.cart]), total_price, payment, change)

            # Execute INSERT statement
            cursor.execute(sql, values)

            # Commit changes
            self.connection.commit()

            cursor.close()
        except sql.connector.Error as e:
            print("An error occurred while inserting transaction:", e)
    def add(self):
        try:
                product_id = int(input("Enter product Number: "))
                quantity = int(input("Enter quantity: "))
        except ValueError:
                 print("Invalid input. Please enter a valid number.")
        self.add_product_to_cart(product_id, quantity)
        self.display_cart()
    def run(self):
        while True:
            print("Products")
            products = get_all_products(self.connection)
            for index, i in enumerate(products):
                print(f"{i['id']}- {i['name']} ₱{i['price_per_unit']} {i['uom_name']}")

            self.add()
            while True:
                choice = int(input("1.Add 2.Check out 3. Exit:  "))
                if choice == 1:
                    self.add()
                elif choice == 2:
                    self.checkout()
                elif choice == 3:
                    break
                else:
                    print("invalid choice")





