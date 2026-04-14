# OpenClaw Termux - Panduan Bahasa Indonesia

[![Download APK](https://img.shields.io/badge/Download-APK-green?style=for-the-badge&logo=android)](https://github.com/openclaw/openclaw/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> **v2.0.0** - Jalankan OpenClaw AI Gateway di Android dengan performa optimal!

---

## 🚀 Apa itu OpenClaw?

OpenClaw adalah AI gateway yang bisa dijalankan di Android melalui Termux atau aplikasi standalone. Dengan OpenClaw, kamu bisa:

- Menjalankan AI lokal di Android (Claude, Gemini, GPT-4, dll)
- Mengontrol device capabilities (kamera, lokasi, sensor, dll)
- Akses web dashboard dari browser
- Setup SSH untuk remote access
- **Tanpa root!**

---

## 📱 Cara Install

### Metode 1: Download APK (Paling Mudah)

1. Download APK terbaru dari [Releases](https://github.com/openclaw/openclaw/releases)
2. Install APK di Android kamu
3. Buka app dan tap **Begin Setup**
4. Tunggu setup selesai (~500MB download)
5. Konfigurasi API keys di menu Onboarding
6. Tap **Start Gateway**

### Metode 2: Build Sendiri

```bash
# Clone repository
git clone https://github.com/openclaw/openclaw.git
cd openclaw/termux

# Build APK
cd flutter_app
flutter build apk --release

# APK akan ada di: build/app/outputs/flutter-apk/app-release.apk
```

### Metode 3: Termux CLI

```bash
# Install via npm
npm install -g openclaw-termux

# Setup
openclawx setup

# Start gateway
openclawx start
```

---

## ⚡ Fitur Utama v2.0.0

### Performance Optimization
- ⚡ **Caching System** - Operasi berat di-cache untuk akses lebih cepat
- 📊 **Performance Monitoring** - Tracking real-time untuk timing operasi
- 🗑️ **Memory Management** - Buffer limit untuk hemat RAM
- 🔋 **AMOLED Dark Mode** - Hemat baterai di layar OLED

### Enhanced Logging
- 📝 **Real-time Logs** - Lihat log gateway secara langsung
- 🔍 **Search & Filter** - Cari log spesifik dengan mudah
- 📤 **Export Logs** - Export log untuk debugging

### Better Error Handling
- 🛡️ **Safe Async** - Error handling otomatis
- 🔔 **Better Notifications** - Notifikasi progress yang jelas
- 🔄 **Auto Recovery** - Automatic retry saat error

---

## 🎯 Device Capabilities

OpenClaw bisa akses hardware Android kamu:

| Capability | Commands | Permission |
|------------|----------|------------|
| 📷 **Camera** | `camera.snap`, `camera.clip` | Camera |
| 🔦 **Flash** | `flash.on`, `flash.off` | Camera |
| 📍 **Location** | `location.get` | Location |
| 📳 **Haptic** | `haptic.vibrate` | None |
| 📊 **Sensor** | `sensor.read`, `sensor.list` | Body Sensors |

---

## 🔧 Konfigurasi

### AI Providers

OpenClaw support 7 AI providers:

1. **Anthropic** (Claude)
2. **OpenAI** (GPT-4, GPT-3.5)
3. **Google Gemini**
4. **OpenRouter**
5. **NVIDIA NIM**
6. **DeepSeek**
7. **xAI** (Grok)

### Binding Mode

Untuk device tanpa root, gunakan **Loopback (127.0.0.1)**:

```
Settings → Binding → Loopback (127.0.0.1)
```

---

## ⚠️ Peringatan Penting

### 🔋 Battery Optimization

**WAJIB** disable battery optimization agar gateway tidak killed di background!

**Cara disable:**
```
Settings → Apps → OpenClaw → Battery → Unrestricted
```

### 📁 Storage Permission

**JANGAN** kasih permission storage kecuali benar-benar perlu!

App ini **TIDAK** butuh akses storage untuk berfungsi normal. Permission storage hanya diperlukan jika kamu ingin proot akses `/sdcard`.

### 🌐 Internet

Setup awal butuh download ~500MB (Ubuntu + Node.js). Pastikan koneksi stabil!

---

## 🐛 Troubleshooting

### Gateway tidak mau start

```bash
# Check status
openclawx status

# Re-run setup
openclawx setup

# Check logs
openclawx logs
```

### Error "os.networkInterfaces"

Ini masalah Bionic Bypass. Jalankan ulang setup:

```bash
openclawx setup
```

### Process killed di background

1. Disable battery optimization (lihat di atas)
2. Pastikan foreground service aktif
3. Check log untuk error spesifik

### APK crash saat dibuka

```bash
# Clear app data
Settings → Apps → OpenClaw → Storage → Clear Data

# Reinstall APK
```

---

## 📚 Commands CLI

```bash
# Setup pertama kali
openclawx setup

# Check status
openclawx status

# Start gateway
openclawx start

# Stop gateway
openclawx stop

# View logs
openclawx logs

# Onboarding (setup API keys)
openclawx onboarding

# Enter Ubuntu shell
openclawx shell

# Run OpenClaw commands
openclawx doctor
openclawx gateway --verbose
```

---

## 🤝 Kontribusi

Kami terbuka untuk kontribusi! Cara berkontribusi:

1. Fork repository
2. Buat branch fitur (`git checkout -b fitur/fitur-baru`)
3. Commit perubahan (`git commit -m 'Tambah fitur baru'`)
4. Push ke branch (`git push origin fitur/fitur-baru`)
5. Open Pull Request

Baca [CONTRIBUTING.md](CONTRIBUTING.md) untuk detail lengkap.

---

## 📞 Support

- 💬 **Discord**: https://discord.gg/clawd
- 📖 **Docs**: https://docs.openclaw.ai
- 🐛 **Issues**: https://github.com/openclaw/openclaw/issues
- 📧 **Email**: contact@openclaw.ai

---

## 📄 License

MIT License - lihat file [LICENSE](LICENSE) untuk detail.

---

## 👨‍💻 Author

Dibuat dengan ❤️ oleh **OpenClaw Contributors**

- GitHub: https://github.com/openclaw
- Website: https://openclaw.ai
- Discord: https://discord.gg/clawd

---

<p align="center">
  Made with ❤️ for the Android community
</p>
