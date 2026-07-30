# UA Admission Intelligence v2

Ukrayna üniversite aday listelerini yerel bilgisayarda analiz eden Flask uygulaması.

## Özellikler
- XLSX yükleme ve otomatik sütun algılama
- LPNU HTML tablosunu URL ile içe aktarma
- Aday sırası, önündeki adaylar ve öncelik dağılımı
- 100–100.000 koşuluk Monte Carlo simülasyonu
- Bütçe, kontrat ve dışarıda kalma olasılıkları
- Kırmızı–sarı–yeşil rakip sınıflaması
- SQLite analiz geçmişi
- Filtrelenebilir rakip tablosu
- CSV, JSON ve biçimlendirilmiş XLSX raporu
- Windows tek tık çalıştırma, Docker ve GitHub Actions testleri

## Windows
1. Python 3.11 veya üstünü kurun. Kurulumda **Add Python to PATH** seçeneğini işaretleyin.
2. `run_windows.bat` dosyasına çift tıklayın.
3. İlk çalıştırmada paketlerin kurulması birkaç dakika sürebilir.
4. Uygulama `http://127.0.0.1:5000` adresinde açılır.

## Test
```bash
python -m venv .venv
.venv\Scripts\python -m pip install -r requirements-dev.txt
.venv\Scripts\python -m pytest -q
```

## Docker
```bash
docker compose up --build
```

## Model sınırı
Bu araç resmî EDBO yerleştirme sonucu üretmez. Çekilme olasılıkları listedeki öncelik, kontrat göstergesi ve puan farkından türetilen sezgisel bir modeldir. Adayların diğer programlardaki başvuruları doğrulanmadığında sonuç yalnızca senaryo tahminidir.
