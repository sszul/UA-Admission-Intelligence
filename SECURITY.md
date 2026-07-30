# Güvenlik Politikası

## Desteklenen sürümler

Yalnızca en güncel kararlı sürüm için güvenlik düzeltmesi yayımlanır.

## Açık bildirme

Güvenlik açığını herkese açık issue olarak paylaşmayın. GitHub deposundaki **Security → Report a vulnerability** bölümünden özel güvenlik bildirimi oluşturun.

Bildirimde etkilenen sürümü, tekrar üretme adımlarını, olası etkiyi ve varsa önerilen düzeltmeyi belirtin. Adaylara ait kişisel verileri eklemeyin.

## Veri güvenliği

Uygulama varsayılan olarak yerel çalışır. Yüklenen dosyalar `uploads/`, analiz geçmişi `instance/` altında tutulur ve `.gitignore` ile depoya eklenmez. İnternete açık dağıtım yapılacaksa kimlik doğrulama, ters proxy, HTTPS, güçlü `SECRET_KEY`, erişim kaydı ve veri saklama politikası ayrıca yapılandırılmalıdır.
