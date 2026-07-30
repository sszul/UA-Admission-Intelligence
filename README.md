# UA Admission Intelligence

Ukrayna üniversite aday listelerini yerel olarak analiz eden Flask uygulaması.

## Özellikler
- XLSX aday listesi yükleme
- LPNU liste URL’sinden HTML tablo alma
- Adayın gerçek sırası ve önündeki başvuru sayısı
- Öncelik / `(к)` dağılımı ve kırmızı–sarı–yeşil rakip sınıflaması
- 100–50.000 koşuluk Monte Carlo bütçe/kontrat simülasyonu
- Kötü, normal, iyi ve çok iyi senaryolar
- SQLite analiz geçmişi
- Analiz JSON API’si ve rakip CSV dışa aktarma
- Windows çalıştırıcı, Docker ve GitHub Actions testleri

## Windows kurulumu
1. Python 3.11 veya üzerini kurun; kurulumda **Add Python to PATH** seçeneğini işaretleyin.
2. `run_windows.bat` dosyasına çift tıklayın.
3. Tarayıcıda `http://127.0.0.1:5000` açılır.

Örnek dosya: `data/Kitap1.xlsx`  
Örnek aday: `Збаращук Віталій Віталійович`  
Örnek kontenjan: 60 bütçe + 30 kontrat.

## Komut satırı
```bash
python -m venv .venv
# Windows
.venv\Scripts\activate
# Linux/macOS
source .venv/bin/activate
pip install -r requirements.txt
python app.py
```

## Test
```bash
pip install -r requirements-dev.txt
pytest -q
```

## Docker
```bash
docker compose up --build
```

## API
- `GET /health`
- `GET /api/history`
- `GET /analysis/<id>/json`
- `GET /analysis/<id>/rivals.csv`

## Güvenilirlik notu
Bu uygulama resmî EDBO yerleştirme sonucu üretmez. Başka programlardaki başvurular bilinmediğinde çekilme olasılığı öncelik ve kontrat işaretinden türetilen bir modeldir. Sonuçlar karar desteği amacıyla kullanılmalıdır.
