import sqlite3

class DatabaseHandler:
    PATH = "test.db"

    def __init__(self):
        pass

    def get_data(self, server, start_date, end_date, customer_item_number):
        # Sanitize server input to avoid SQL injection if needed
        with sqlite3.connect(self.PATH) as conn:
            cursor = conn.cursor()
            query = f"""SELECT customer_item_number, start_date, action_date, qty, actions, exception_type, exception_message  FROM "{server}" WHERE start_date BETWEEN ? AND ? AND customer_item_number = ?;"""
            print("Executing query:", query)  # Debugging print statement
            print("With parameters:", start_date, end_date, customer_item_number)  # Debugging print statement
            cursor.execute(query, (start_date, end_date, customer_item_number))
            data = cursor.fetchall()
            return data

#see below for example usage of encription
# from pysqlcipher3 import dbapi2 as sqlite3

# class DatabaseHandler:
#     PATH = "test.db"
#     KEY = "your-password-here"

#     def __init__(self):
#         pass

#     def get_data(self, server, start_date, end_date, customer_item_number):
#         # Sanitize server input to avoid SQL injection if needed
#         with sqlite3.connect(self.PATH) as conn:
#             conn.execute(f"PRAGMA key='{self.KEY}';")
#             cursor = conn.cursor()
#             query = f"""SELECT customer_item_number, start_date, action_date, qty, actions, exception_type, exception_message FROM "{server}" WHERE start_date BETWEEN ? AND ? AND customer_item_number = ?;"""
#             print("Executing query:", query)  # Debugging print statement
#             print("With parameters:", start_date, end_date, customer_item_number)  # Debugging print statement
#             cursor.execute(query, (start_date, end_date, customer_item_number))
#             data = cursor.fetchall()
#             return data
