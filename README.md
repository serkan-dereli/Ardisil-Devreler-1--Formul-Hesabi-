C = 2 * t – a – b    (a>b ise t=a, değilse t=b)
İşlemini 5-bit olarak gerçekleştiren kodlamayı toplayıcı ve çıkarıcılarla gerçekleştiriniz.
ÖNEMLİ DURUMLAR:
1. İşlem şu şekle dönüştürülebilir:
2. C = t + t – (a + b)
3. Önce i1=t+t işlemi yapılacak
4. Sonra i2=a+b işlemi yapılacak
5. En son i3=i1-i2 işlemi yapılacak

İşlem adımları:
1) Resetle ilk duruma geçilir.
2) a ve b girişleri içeri alınır.
3) a ve b girişleri karşılaştırılır
4) Koşula göre t=a veya t=b ataması yapılır
5) i1=t+t işlemi yapılır
6) i2=a+b işlemi yapılır
7) i3=i1-i2 işlemi yapılır
8) c=i3 ataması yapılır

