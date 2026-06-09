#!/usr/bin/env python3
"""
OneNAS 本地预览服务器
用法: python3 server.py [端口]
"""
import http.server
import socketserver
import sys
import os

PORT = int(sys.argv[1]) if len(sys.argv) > 1 else 8080
DIRECTORY = os.path.dirname(os.path.abspath(__file__))

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print(f"========================================")
    print(f"  OneNAS 本地服务器已启动")
    print(f"  访问地址: http://localhost:{PORT}")
    print(f"  按 Ctrl+C 停止")
    print(f"========================================")
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n服务器已停止")
