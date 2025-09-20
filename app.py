import os
from flask import Flask, render_template, request, redirect, url_for, flash
from flask_login import LoginManager, login_user, logout_user, login_required, current_user
from werkzeug.security import generate_password_hash, check_password_hash

from conexion.conexion import get_connection
from models import User

from dotenv import load_dotenv
load_dotenv()

app = Flask(__name__)
app.secret_key = os.getenv("SECRET_KEY", "dev-change-me")

login_manager = LoginManager(app)
login_manager.login_view = "login"

@login_manager.user_loader
def load_user(user_id):
    # Recuperar usuario por ID desde MySQL
    conn = get_connection()
    with conn.cursor() as cur:
        cur.execute("SELECT * FROM usuarios WHERE id_usuario=%s", (user_id,))
        row = cur.fetchone()
    return User.from_row(row)

@app.route("/")
def home():
    return render_template("home.html")

@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":
        nombre = request.form.get("nombre","").strip()
        email = request.form.get("email","").strip().lower()
        password = request.form.get("password","")

        if not (nombre and email and password):
            flash("Completa todos los campos.", "error")
            return redirect(url_for("register"))

        password_hash = generate_password_hash(password)

        conn = get_connection()
        try:
            with conn.cursor() as cur:
                cur.execute(
                    "INSERT INTO usuarios (nombre, email, password) VALUES (%s, %s, %s)",
                    (nombre, email, password_hash),
                )
            flash("Usuario registrado. Ahora puedes iniciar sesión.", "success")
            return redirect(url_for("login"))
        except Exception as e:
            flash(f"Error al registrar: {e}", "error")
            return redirect(url_for("register"))

    return render_template("register.html")

@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        email = request.form.get("email","").strip().lower()
        password = request.form.get("password","")
        conn = get_connection()
        with conn.cursor() as cur:
            cur.execute("SELECT * FROM usuarios WHERE email=%s", (email,))
            row = cur.fetchone()
        user = User.from_row(row)
        if user and check_password_hash(user.password_hash, password):
            login_user(user)
            flash("Bienvenido/a, " + user.nombre, "success")
            return redirect(url_for("protected"))
        else:
            flash("Credenciales inválidas", "error")
    return render_template("login.html")

@app.route("/logout")
@login_required
def logout():
    logout_user()
    flash("Sesión cerrada.", "info")
    return redirect(url_for("home"))

@app.route("/protected")
@login_required
def protected():
    return render_template("protected.html", user=current_user)

if __name__ == "__main__":
    app.run(debug=True)
@app.route("/ventana")
def ventana():
    return "<h1>Hola soy estudiante</h1>"
