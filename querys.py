import sqlite3
class DatabaseHandler:
    PATH = "test.db"

    def __init__(self):
        pass

    def get_data(self, server, start_date, end_date, customer_item_number):
        # Sanitize server input to avoid SQL injection if needed
        with sqlite3.connect(self.PATH) as conn:
            cursor = conn.cursor()
            query = f"""SELECT * FROM {server} WHERE start_date BETWEEN ? AND ? AND customer_item_number = ?;"""
            print("Executing query:", query)  # Debugging print statement
            print("With parameters:", start_date, end_date, customer_item_number)  # Debugging print statement
            cursor.execute(query, (start_date, end_date, customer_item_number))
            data = cursor.fetchall()
            return data
