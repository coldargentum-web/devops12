FROM python:3.9-slim

# Установка рабочей директории
WORKDIR /app

# Сначала копируем только зависимости для кэширования слоев
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь код и папки (static, templates, tests)
COPY . .

# Открываем порт Flask
EXPOSE 5000

# Запуск приложения
CMD ["python", "app.py"]