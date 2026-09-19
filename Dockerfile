FROM python:3.11-alpine

WORKDIR /app

# 安装底层系统依赖（如果不需要 curl 可移除）
RUN apk add --no-cache curl

# 复制依赖文件并安装 Python 包
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目所有源代码及静态资源（包含 main.py, index.html 等）
COPY . .

# 暴露端口（需与 PandaStack 中的 PORT 配置保持一致，默认设置为 7860）
EXPOSE 8080

# 启动服务
CMD ["python", "main.py"]
