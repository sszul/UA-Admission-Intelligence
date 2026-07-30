# UA Admission Intelligence v3

Ukrayna üniversite aday listelerindeki bir adayın mevcut sırasını, önündeki adayların öncelik yapısını ve bütçe/kontrat kontenjanına girme olasılığını senaryo tabanlı Monte Carlo modeliyle analiz eden yerel Flask uygulaması.

## Özellikler

- XLSX ve CSV yükleme
- İlk satırlarda açıklama bulunan Excel dosyalarında otomatik başlık tespiti
- LPNU tablo URL'sinden veri alma
- Aday adı, puan, öncelik, kontrat işareti ve durum sütunlarını otomatik tanıma
- 100–100.000 koşuluk Monte Carlo simülasyonu
- Bütçe, kontrat ve dışarıda kalma olasılıkları
- Kırmızı/sarı/yeşil rakip sınıflaması
- SQLite analiz geçmişi
- CSV, JSON ve biçimlendirilmiş XLSX raporları
- Docker, Waitress, testler ve GitHub Actions

> Model resmî yerleştirme sonucu değildir. Diğer başvurular doğrulanmadığında sonuçlar istatistiksel senaryo tahminidir.

## Windows'ta çalıştırma

1. Python 3.11 veya daha yenisini kurun ve kurulumda **Add Python to PATH** seçeneğini işaretleyin.
2. ZIP'i tamamen çıkarın.
3. `run_windows.bat` dosyasına çift tıklayın.
4. Kurulum bitince tarayıcıda `http://127.0.0.1:5000` açılır.

İlk çalıştırmada sanal ortam oluşturulur ve paketler kurulur.

## Manuel çalıştırma

```bash
python -m venv .venv
.venv\Scripts\activate
python -m pip install -r requirements.txt
python app.py
```

Linux/macOS:

```bash
bash run_mac_linux.sh
```

## Test

```bash
python -m pip install -r requirements-dev.txt
python -m pytest -q
```

## Docker

```bash
docker compose up --build
```

## Kullanım

- Kaynak olarak `.xlsx`, `.csv` veya izin verilen LPNU URL'sini seçin.
- Aday adını listedeki yazılışıyla girin.
- Bütçe ve kontrat kontenjanlarını girin.
- Simülasyon sayısını seçip analizi çalıştırın.

`data/example.csv` anonim örnek veri içerir.
