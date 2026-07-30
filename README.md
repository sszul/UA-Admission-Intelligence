# UA Admission Intelligence 1.0

Ukrayna üniversite aday listelerinde aday sırası, öncelik yapısı ve bütçe/kontrat olasılığı analizi yapan yerel web uygulaması.

## Temel özellikler

- XLSX ve CSV yükleme
- İlk satırlarda açıklama bulunan Excel dosyalarında otomatik başlık tespiti
- LPNU tablo URL'sinden veri alma
- Ukraynaca, Türkçe ve İngilizce sütun adlarını otomatik eşleme
- Aday adı, puan, öncelik, kontrat işareti ve başvuru durumu analizi
- 100–100.000 koşuluk Monte Carlo simülasyonu
- Bütçe, kontrat ve dışarıda kalma olasılıkları
- Kırmızı/sarı/yeşil rakip sınıflaması
- SQLite analiz geçmişi
- CSV, JSON ve biçimlendirilmiş XLSX raporları
- Windows tek tık başlatıcı, Docker ve GitHub Actions

> Uygulama resmî yerleştirme sonucu üretmez. Sonuçlar, mevcut listeye dayalı istatistiksel senaryo tahminidir.

## Windows kurulumu

1. Python 3.11 veya daha yenisini kurun. Kurulumda **Add Python to PATH** seçeneğini işaretleyin.
2. ZIP dosyasını tamamen çıkarın.
3. `run_windows.bat` dosyasına çift tıklayın.
4. İlk çalıştırmada internet bağlantısı gerekir; gerekli Python paketleri otomatik kurulur.
5. Tarayıcı otomatik açılmazsa `http://127.0.0.1:5000` adresini açın.

## Manuel çalıştırma

```powershell
py -3 -m venv .venv
.venv\Scripts\python -m pip install -r requirements.txt
.venv\Scripts\python -m waitress --listen=127.0.0.1:5000 wsgi:app
```

Linux/macOS:

```bash
bash run_mac_linux.sh
```

## Docker

```bash
docker compose up --build
```

## Test

```bash
python -m pip install -r requirements-dev.txt
python -m pytest -q
```

## Kullanım

1. `.xlsx`, `.csv` veya izin verilen LPNU URL'sini seçin.
2. Aday adını listedeki yazılışıyla girin.
3. Bütçe ve kontrat kontenjanlarını girin.
4. Simülasyon sayısını seçin ve analizi başlatın.
5. Sonuç ekranından CSV, JSON veya XLSX raporu indirin.

Anonim örnek veri `data/example.csv` dosyasındadır.

## Güvenlik

URL içe aktarma yalnızca `config.py` içindeki izin verilen alan adlarında çalışır. Yükleme sınırı varsayılan olarak 30 MB'dir. Üretim ortamında `SECRET_KEY` çevre değişkenini değiştirin.
