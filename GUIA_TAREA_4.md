# Guía Tarea 4 – MiniCore (Flask + MVC + SQL Server)

## 1. Qué hace el ejercicio
Calcula la **comisión de cada vendedor** según el total vendido en junio 2025:

| Total ventas | Comisión |
|---|---|
| >= 1000 | 15% |
| >= 800 | 10% |
| >= 600 | 8% |
| >= 500 | 6% |
| < 500 | 0 |

## 2. MVC en este proyecto
- **Modelo:** clases `Usuario` y `Venta` en `app.py` (SQLAlchemy) + función `calcular_comision`.
- **Vista:** HTML en `template/` (`formulario_busqueda.html`, `comision.html`).
- **Controlador:** rutas `/` y `/comisiones` en `app.py`.

## 3. Correr en local
1. En SSMS 2022 abre y ejecuta `minicore.sql`.
2. Habilita TCP/IP en SQL Server Configuration Manager y autenticación mixta; usa un login SQL (ej. `sa`).
3. Edita la URL en `app.py` (o define `DATABASE_URL`):
   `mssql+pymssql://USUARIO:PASSWORD@localhost:1433/minicore`
4. En la terminal:
   ```
   pip install -r requirements.txt
   python app.py
   ```
   Abre http://localhost:5000

## 4. Deploy en Render
Render NO puede ver tu SQL Server local. Necesitas una BD en la nube:
- Opción A: **Azure SQL Database** (free offer) y pegas su cadena en `DATABASE_URL`.
- Opción B (rápida): no definir `DATABASE_URL` y cambiar a SQLite/Postgres de Render (pregunta al profe si exige SQL Server en nube).

Pasos:
1. Sube la carpeta a tu GitHub (`git init`, `git add .`, `git commit`, `git push`).
2. render.com > New > **Web Service** > conecta tu repo.
3. Runtime: Python 3. Build: `pip install -r requirements.txt`. Start: `gunicorn app:app`.
4. En **Environment** agrega `DATABASE_URL` con tu cadena `mssql+pymssql://...`.
5. Deploy. Te da una URL `https://tuapp.onrender.com`.

Nota: con gunicorn no corre el bloque `__main__`, por eso las tablas deben existir (el script `minicore.sql` las crea).

## 5. Guion del video (3-5 min)
1. Presenta el ejercicio y la tabla de comisiones.
2. Muestra el modelo en SSMS (tablas y datos).
3. Explica MVC: modelos, vistas, controlador en `app.py`.
4. Demuestra la app local y luego la URL de Render.
5. Cierra con el link de GitHub.
