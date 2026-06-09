#!/bin/bash

# OneNAS 本地预览启动脚本
# 支持 Python 3 / Python 2 / Node.js 自动检测

cd "$(dirname "$0")"

PORT=${1:-8080}

echo "======================================"
echo "  OneNAS 本地预览服务器"
echo "======================================"

# 优先尝试 Python 3
if command -v python3 &> /dev/null; then
    echo "使用 Python 3 启动服务器..."
    echo "请在浏览器打开: http://localhost:$PORT"
    echo "按 Ctrl+C 停止服务器"
    echo "======================================"
    python3 -m http.server "$PORT"
    exit 0
fi

# 尝试 Python 2
if command -v python &> /dev/null; then
    echo "使用 Python 启动服务器..."
    echo "请在浏览器打开: http://localhost:$PORT"
    echo "按 Ctrl+C 停止服务器"
    echo "======================================"
    python -m SimpleHTTPServer "$PORT"
    exit 0
fi

# 尝试 Node.js (npx serve)
if command -v npx &> /dev/null; then
    echo "使用 Node.js (npx serve) 启动服务器..."
    echo "请在浏览器打开: http://localhost:$PORT"
    echo "按 Ctrl+C 停止服务器"
    echo "======================================"
    npx serve -l "$PORT"
    exit 0
fi

# 尝试 Node.js (http-server)
if command -v http-server &> /dev/null; then
    echo "使用 Node.js (http-server) 启动服务器..."
    echo "请在浏览器打开: http://localhost:$PORT"
    echo "按 Ctrl+C 停止服务器"
    echo "======================================"
    http-server -p "$PORT"
    exit 0
fi

echo "错误: 未找到可用的本地服务器工具。"
echo "请安装以下任意一种:"
echo "  - Python 3 (推荐)"
echo "  - Node.js + npx serve"
echo ""
echo "或者直接双击 index.html 用浏览器打开。"
exit 1
