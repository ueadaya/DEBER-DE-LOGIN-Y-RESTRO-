# Proyecto: Flask + Flask-Login + MySQL

Este proyecto implementa un **sistema de login funcional** con **Flask-Login** y **MySQL**. Incluye:
- Registro, inicio y cierre de sesión.
- Ruta protegida que requiere autenticación.
- Conexión a MySQL mediante **PyMySQL**.
- Script `db.sql` para crear la base de datos y sembrar usuarios de ejemplo.
- Plantillas HTML y estilos básicos.
- Archivo `.env.example` para configuración.

## Requisitos
- Python 3.10+
- MySQL 8+ (o compatible)
- Git (opcional)

## Instalación rápida (Windows/macOS/Linux)

```bash
# 1) Crear y activar entorno (opcional)
python -m venv .venv
# Windows:
.venv\Scripts\activate
# macOS/Linux:
source .venv/bin/activate

# 2) Instalar dependencias
pip install -r requirements.txt

# 3) Configurar variables
cp .env.example .env
# Edita .env y coloca tu contraseña de MySQL

# 4) Crear BD y datos de ejemplo
# En la consola de MySQL:
# mysql -u root -p < db.sql

# 5) Ejecutar
python app.py
# Visita http://127.0.0.1:5000
```

## Usuarios de ejemplo
- ana@example.com / **Ana12345**
- luis@example.com / **Luis12345**
- maria@example.com / **Maria12345**
- carlos@example.com / **Carlos12345**
- sofia@example.com / **Sofia12345**

> Las contraseñas están almacenadas en la base de datos con hash seguro (`werkzeug.security`).

## Estructura
```
app.py
models.py
conexion/
  └─ conexion.py
templates/
  base.html, home.html, login.html, register.html, protected.html
static/css/style.css
db.sql
.env.example
requirements.txt
README.md
```

## Notas
- Cambia `SECRET_KEY` en `.env` antes de producción.
- Para usar un usuario distinto de `root`, ajusta `MYSQL_USER` y otorga permisos.
- Si usas XAMPP/MAMP/WAMP, asegúrate de que el servidor MySQL esté iniciado.
