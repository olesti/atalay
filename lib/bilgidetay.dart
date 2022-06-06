import 'package:flutter/material.dart';
class Detailpage2 extends StatelessWidget {
   String icerik =   "Yerleşim bölgeleri titizlikle belirlenmelidir. Kaygan ve ovalık bölgeler iskana açılmamalıdır. Konutlar gevşek toprağa sahip meyilli arazilere yapılmamalıdır."
"\nYapılar deprem etkilerine karşı dayanıklı inşa edilmelidir. \n"
"İmar planında konuta ayrılmış yerler dışındaki yerlere ev ve bina yapılmamalıdır.\n"
"Dik yarların yakınına, dik boğaz ve vadilerin içine bina yapılmamalıdır."
"Çok kar yağan ve çığ gelen yamaçlarda bina yapılmamalıdır.\n"
"Mevcut binaların dayanıklılıkları artırılmalıdır.\n"
"Konutlara deprem sigortası yaptırılmalıdır.\n"
"Bu önlemlerin yanı sıra, yapısal olamayan, yani binadan değil de eşyalardan kaynaklanacak hasarlardan korunmak için günlük kullandığımız eşyalarımızın ev içerisine yerleştirilmesinde aşağıda sayılan önlemleri almalıyız:\n"
"Dolap üzerine konulan eşya ve büro malzemeleri kayarak düşmelerini önlemek için plastik tutucu malzeme veya yapıştırıcılarla sabitlenmelidir.\n"
"Soba ve diğer ısıtıcılar sağlam malzemelerle duvara veya yere sabitlenmelidir.\n"
"Dolaplar ve devrilebilecek benzeri eşyalar birbirine ve duvara sabitlenmelidir. Eğer sabitlenen eşya ve duvar arasında boşluk kalıyorsa, çarpma etkisini düşürmek için araya bir dolgu malzemesi konulmalıdır.\n"
"Tavan ve duvara asılan avize, klima vb. cihazlar bulundukları yere ağırlıklarını taşıyacak şekilde, duvar ve pencerelerden yeterince uzağa ve kanca ile asılmalıdır.\n"
"İçinde ağır eşyalar bulunan dolap kapakları mekanik kilitler takılarak sıkıca kapalı kalmaları sağlanmalı.\n"
"Tezgah üzerindeki kayabilecek beyaz eşyaların altına metal profil koyarak bunların kayması önlenmelidir.\n"
"Zehirli, patlayıcı, yanıcı maddeler düşmeyecek bir konumda sabitlenmeli ve kırılmayacak bir şekilde depolanmalıdır. Bu maddelerin üzerlerine fosforlu, belirleyici etiketler konulmalıdır."
"Rafların önüne elastik bant ya da tel eklenebilir. Küçük nesneler ve şişeler, birbirlerine çarpmayacak ve devrilmeyecek şekilde, kutuların içine yerleştirilmelidir.\n"
"Gaz kaçağı ve yangına karşı, gaz vanası ve elektrik sigortaları otomatik hale getirilmelidir.\n"
"Binadan acilen çıkmak için kullanılacak yollardaki tehlikeler ortadan kaldırılmalı, bu yollar işaretlenmeli, çıkışı engelleyebilecek eşyalar çıkış yolu üzerinden kaldırılmalıdır.\n"
"Geniş çıkış yolları oluşturulmalıdır. Dışa doğru açılan kapılar kullanılmalı, acil çıkış kapıları kilitli olmamalıdır. Acil çıkışlar aydınlatılmalıdır.\n"
"Karyolalar pencerenin ve üzerine devrilebilecek ağır dolapların yanına konulmamalı, karyolanın üzerinde ağır eşya olan raf bulundurulmamalıdır.\n"
"Tüm bireylerin katılımı ile (evde, iş yerinde, apartmanda, okulda) “Afete hazırlık planları” yapılmalı, her altı ayda bir bu plan gözden geçirilmelidir. Zaman zaman bu plana göre nasıl davranılması gerektiğinin tatbikatları yapılmalıdır.\n"
"Bir afet ve acil durumda eve ulaşılamayacak durumlar için aile bireyleri ile iletişimin nasıl sağlanacağı, alternatif buluşma yerleri ve bireylerin ulaşabileceği bölge dışı bağlantı kişisi (ev, işyeri, okul içinde, dışında ve ya mahalle dışında) belirlenmelidir.\n"
"Önemli evraklar (kimlik kartları, tapu, sigorta belgeleri, sağlık karnesi, diplomalar, pasaport, banka cüzdanı vb.) kopyaları hazırlanarak su geçirmeyecek bir şekilde saklanmalı, ayrıca bu evrakların bir örneği de bölge dışı bağlantı kişisinde bulunmalıdır.\n"
"Bina yönetimince önceden belirlenen, mesken veya iş yerinin özelliği ve büyüklüğüne göre uygun yangın söndürme cihazı mutlaka bulundurulmalı ve periyodik bakımları da yaptırılmalıdır. Bu cihazlar;"
"Kolayca ulaşılabilecek bir yerde tutulmalıdır.\n"
"Yeri herkes tarafından bilinmelidir.\n"
"Duvara sıkıca sabitlenmelidir.\nHer yıl ilgili firma tarafından bakımı yapılmalıdır.\nBir kez kullanıldıktan sonra mutlaka tekrar doldurulmalıdır.\nBinalarda asansörlerin kapı yanlarına Deprem Sırasında Kullanılmaz levhası asılmalıdır.\n";
  List<int> top = <int>[];

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deprem Öncesi Yapılması Gerekenler",),
      ),
      body: CustomScrollView(
        center: key,  
        slivers: [SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(icerik, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                );
              },
              childCount: 1,
            ),
          ),
          ],
      ),
      /*
      */
    );
  }
}