-- Crear BD y tabla para el proyecto Flask + Flask-Login + MySQL
CREATE DATABASE IF NOT EXISTS desarrollo_web CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE desarrollo_web;

CREATE TABLE IF NOT EXISTS usuarios (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Usuarios de ejemplo (contraseñas en hash; entre paréntesis se muestra la contraseña de texto plano)
-- dayanara@gmail.com (Ana12345)

INSERT INTO usuarios (nombre, email, password) VALUES ('Ana Pérez', 'ana@example.com', 'scrypt:32768:8:1$vUJU8BPkY1W5mhMM$6bc59fcff369cc74f447be47e786688eae738395719ff7d2f84dd0d580d07a81ea58035a70b3f58bbee765a640f3efe0e67ba61bea72d98ec9e16006175bb5d2');
INSERT INTO usuarios (nombre, email, password) VALUES ('Luis García', 'luis@example.com', 'scrypt:32768:8:1$Se6o2U0d7dGLcd3W$d0264f9d43a337cb8b704751fec8a34bf81675a65ba54c71c3e0b28eb1bc68643ec951b61f7f201719c105fbc070434d8854d7790e18b00400fdccbeb79eb62f');
INSERT INTO usuarios (nombre, email, password) VALUES ('María López', 'maria@example.com', 'scrypt:32768:8:1$pbJDPrpJeabLFOah$28e499e3894fdaffe596143dfe919faa3097335be6bcc79766f62b05b837197255596625e5fe8d28e0d4b87dc8c591158231259975fa229ade5856595b317530');
INSERT INTO usuarios (nombre, email, password) VALUES ('Carlos Díaz', 'carlos@example.com', 'scrypt:32768:8:1$cWyoXOGXqWRgqYPC$5df110e46eb1cbc0b881a23da4878d94ec244666ca3cd430ee6008523b005ad8fc1d7e3373f088808469ece846676006589ef06ff0e27d625b089fa580b4976c');
INSERT INTO usuarios (nombre, email, password) VALUES ('Sofía Torres', 'sofia@example.com', 'scrypt:32768:8:1$n0MDxESvPebgQ3tK$833cb05707a378d2228c19d5df5bffb59898a41b5d5aa6c07e1f081ce469277e95bc92c7a2be4054bb8d2e7cc46be45951df787e9c29673f7746a0b3ff1f35ae');
