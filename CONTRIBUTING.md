# Katkıda Bulunma Rehberi

Katkılar issue veya pull request yoluyla yapılır. Büyük bir değişiklikten önce kapsamı netleştirmek için issue açın.

## Geliştirme ortamı

```bash
python -m venv .venv
# Windows: .venv\Scripts\activate
# Linux/macOS: source .venv/bin/activate
python -m pip install -r requirements-dev.txt
python -m pytest -q
python -m ruff check .
```

## Kurallar

- Kullanıcıların gerçek adlarını, puanlarını veya diğer kişisel verilerini test verisine eklemeyin.
- Analiz modelindeki olasılık değişikliklerini test ve açıklamayla destekleyin.
- Yeni veri biçimleri için anonim örnek ve parser testi ekleyin.
- Her pull request tek bir anlamlı değişiklik grubuna odaklansın.
- Kullanıcıya gösterilen metinlerde sonuçların resmî yerleştirme kararı olmadığı açıkça belirtilsin.

## Commit mesajları

Önerilen biçim: `type: kısa açıklama`

Örnekler: `feat: CSV sütun eşlemeyi geliştir`, `fix: Windows başlatıcı Python tespitini düzelt`, `docs: kurulum rehberini güncelle`.
