from mysql_connector import MySQLConnector

class PetShop:
    def __init__(self):
        # Теперь не нужно передавать host/user/pass сюда, 
        # MySQLConnector сам их найдет
        self.db = MySQLConnector()

    def add_item(self, name, price):
        # Валидация: если имя пустое, даем имя по умолчанию
        name = name if name else "New Pet"
        try:
            price = int(price) if price else 0
        except ValueError:
            price = 0

        # Используем безопасный запрос с плейсхолдерами %s
        sql = "INSERT INTO pets (name, price) VALUES (%s, %s)"
        self.db.query(sql, (name, price))

    def get_all_items(self):
        return self.db.query("SELECT id, name, price FROM pets")