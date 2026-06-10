#!/bin/bash
set -e

REMOTE_HOST="154.17.21.121"
REMOTE_DIR="/home/onenas/"

echo "正在同步文件到 ${REMOTE_HOST}:${REMOTE_DIR} ..."
echo "排除规则: *.py, *.sh, docs/mkdocs.yml, docs/docs"

rsync -avz \
  --exclude='.git' \
  --exclude='*.py' \
  --exclude='*.sh' \
  --exclude='docs/mkdocs.yml' \
  --exclude='docs/docs' \
  --exclude='docs/.venv' \
  ./ \
  "${REMOTE_HOST}:${REMOTE_DIR}"

echo "上传完成"
