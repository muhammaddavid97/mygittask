from flask import Flask

# Membuat instance aplikasi Flask
app = Flask(__name__)

# Mendefinisikan route (URL) utama
# Ketika pengguna mengunjungi root URL (misalnya, http://127.0.0.1:5000/)
@app.route('/')
def hello_world():
    # Fungsi ini akan dijalankan dan mengembalikan string ini
    return 'Hello, World!'

# Menjalankan aplikasi
if __name__ == '__main__':
    # app.run(debug=True) mengaktifkan mode debug untuk pengembangan
    app.run(debug=True)
