FROM python:3.11-alpine

WORKDIR /app

# Копируем скрипт в контейнер
COPY app.py .

# Указываем порт, который слушает приложение
EXPOSE 8000

# Команда для запуска сервера
CMD ["python", "app.py"]