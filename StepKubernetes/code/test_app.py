import unittest
from app import app

class FlaskAppTests(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()

    def test_home_page(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)

    def test_list_pets(self):
        response = self.app.get('/list_pets')
        self.assertEqual(response.status_code, 200)