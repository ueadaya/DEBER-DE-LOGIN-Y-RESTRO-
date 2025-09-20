from flask_login import UserMixin

class User(UserMixin):
    def __init__(self, id, nombre, email, password_hash):
        self.id = str(id)
        self.nombre = nombre
        self.email = email
        self.password_hash = password_hash

    @staticmethod
    def from_row(row):
        if not row:
            return None
        return User(
            id=row["id_usuario"],
            nombre=row["nombre"],
            email=row["email"],
            password_hash=row["password"],
        )
