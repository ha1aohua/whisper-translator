#!/bin/bash
set -e

echo "🚀 开始部署 Whisper Translator..."

cd /root
git clone https://github.com/ha1aohua/whisper-translator.git || true
cd whisper-translator/backend

python3.10 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

echo "✅ 安装依赖完成"

cp ../systemd/whisper.service /etc/systemd/system/whisper.service
systemctl daemon-reexec
systemctl daemon-reload
systemctl enable whisper
systemctl start whisper

echo "✅ Whisper 服务已启动"

cp ../nginx/whisper.conf /etc/nginx/sites-available/whisper
ln -s /etc/nginx/sites-available/whisper /etc/nginx/sites-enabled/
nginx -t && systemctl restart nginx

echo "✅ Nginx 配置完成"
echo "🎉 部署完成"
