import mysql.connector
import os

class MySQLConnector:
    def __init__(self):
        # Берем настройки из переменных окружения (app.yaml)
        self.connection = mysql.connector.connect(
            host=os.getenv('DB_HOST', 'mysql-service'),
            user=os.getenv('DB_USER', 'root'),
            password=os.getenv('DB_PASSWORD', 'hard_passw0rd'),
            database=os.getenv('DB_NAME', 'shop')
        )
        self.cursor = self.connection.cursor(dictionary=True)

    def query(self, sql, params=None):
        # params=None позволяет выполнять и SELECT, и INSERT с данными
        self.cursor.execute(sql, params or ())
        if sql.strip().upper().startswith("SELECT"):
            return self.cursor.fetchall()
        self.connection.commit()
        return self.cursor.lastrowid