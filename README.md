# UA Admission Intelligence

[![CI](https://github.com/sszul/UA-Admission-Intelligence/actions/workflows/tests.yml/badge.svg)](https://github.com/sszul/UA-Admission-Intelligence/actions/workflows/tests.yml)
[![CodeQL](https://github.com/sszul/UA-Admission-Intelligence/actions/workflows/codeql.yml/badge.svg)](https://github.com/sszul/UA-Admission-Intelligence/actions/workflows/codeql.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Python 3.11+](https://img.shields.io/badge/Python-3.11%2B-blue.svg)](https://www.python.org/)

Ukrayna üniversite aday listelerinde aday sırası, öncelik yapısı ve bütçe/kontrat olasılığı analizi yapan yerel Flask uygulaması.

> **Önemli:** Uygulama resmî yerleştirme sonucu üretmez. Sonuçlar mevcut liste ve açıkça belgelenmiş varsayımlar üzerinden hesaplanan istatistiksel senaryolardır.

## Özellikler

- XLSX ve CSV yükleme
- İlk satırlarda açıklama bulunan Excel dosyalarında otomatik başlık tespiti
- Ukraynaca, Türkçe ve İngilizce sütun adlarını eşleme
- İzin verilen LPNU tablo URL'lerinden veri alma
- Aday sırası, puanı, önceliği, kontrat işareti ve durum analizi
- 100–100.000 koşuluk Monte Carlo simülasyonu
- Bütçe, kontrat ve dışarıda kalma olasılıkları
- Kırmızı/sarı/yeşil rakip sınıflaması
- SQLite analiz geçmişi
- CSV, JSON ve biçimlendirilmiş XLSX raporları
- Windows başlatma günlüğü, Docker, CI, CodeQL ve Dependabot

## Hızlı başlangıç — Windows

1. [Python 3.11 veya daha yenisini](https://www.python.org/downloads/windows/) kurun. Kurulumda **Add Python to PATH** seçeneğini işaretleyin.
2. Depoyu ZIP olarak indirip tamamen çıkarın.
3. `run_windows.bat` dosyasına çift tıklayın.
4. İlk çalıştırmada paketler kurulur ve `http://127.0.0.1:5000` açılır.

Başlatma başarısız olursa proje klasöründeki `ua_admission_startup.log` dosyasının son bölümünü inceleyin. Bozuk sanal ortam algılanırsa başlatıcı `.venv` klasörünü otomatik yeniden oluşturur.

## Manuel kurulum

```powershell
py -3 -m venv .venv
.venv\Scripts\python -m pip install -r requirements.txt
.venv\Scripts\python -m waitress --listen=127.0.0.1:5000 --call ua_admission:create_app
```

Linux/macOS:

```bash
bash run_mac_linux.sh
```

Docker:

```bash
docker compose up --build
```

## Ekran görüntüleri

Uygulama yerel olarak çalıştırıldıktan sonra ana sayfa ve analiz sonucu ekran görüntülerini `docs/screenshots/` klasörüne ekleyin. Önerilen adlar `home.png` ve `result.png` şeklindedir.

## Kullanım

1. `.xlsx`, `.csv` veya izin verilen bir LPNU URL'si seçin.
2. Aday adını listedeki yazılışıyla girin.
3. Bütçe ve kontrat kontenjanlarını girin.
4. Simülasyon sayısını seçip analizi başlatın.
5. Sonuç ekranından CSV, JSON veya XLSX raporu indirin.

Anonim örnek veri `data/example.csv` dosyasındadır.

## Test ve kalite

```bash
python -m pip install -r requirements-dev.txt
python -m ruff check .
python -m pytest -q
```

CI, Python 3.11–3.13 matrisi üzerinde çalışır. Pull request'lerde bağımlılık incelemesi, ana dalda ve haftalık olarak CodeQL analizi yürütülür.

## Proje belgeleri

- [Katkıda bulunma](CONTRIBUTING.md)
- [Güvenlik politikası](SECURITY.md)
- [Destek](SUPPORT.md)
- [Yol haritası](ROADMAP.md)
- [Mimari](docs/ARCHITECTURE.md)
- [Sürüm kontrol listesi](docs/RELEASE_CHECKLIST.md)
- [GitHub depo ayarları](docs/GITHUB_SETUP.md)
- [Değişiklik günlüğü](CHANGELOG.md)

## Gizlilik

Gerçek aday verilerini issue, pull request veya test verisi olarak depoya göndermeyin. Yerel çalışma verileri `instance/` ve `uploads/` altında tutulur ve Git tarafından yok sayılır.

## Lisans

[MIT License](LICENSE)
