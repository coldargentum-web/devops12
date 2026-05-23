from http.server import BaseHTTPRequestHandler, HTTPServer
import socket
import os

class SimpleServer(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.send_response(200)
            self.send_header('Content-type', 'text/plain')
            self.end_headers()
            
            # Получаем IP адрес пода
            pod_ip = socket.gethostbyname(socket.gethostname())
            message = f"Status: 200 OK\nPod IP: {pod_ip}\n"
            
            self.wfile.write(message.encode())
        else:
            self.send_response(404)
            self.end_headers()

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8000))
    server = HTTPServer(('', port), SimpleServer)
    print(f"Starting server on port {port}...")
    server.serve_forever()