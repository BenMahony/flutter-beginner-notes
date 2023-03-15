//import kullanımı
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*önemli bilgilendirme
//@author halilCan;

    adb connect 127.0.0.1:5555 //bu kod ile bluestack bağlanıyor. ez

    flutterde herşey widgettir.
    widget: kütüphane bileşenidir. hazır wigdetler buttonlar, formlardır.
    mesela theme: kullandığımızda hazır widgetlerini otomatik yükler ama biz
    themeData: ile onun için widget yazarız ve bunları kullanır. yani özelleştirdiğimiz
    her yerde aslında kendimiz widget yazmış(kodlamış) oluyoruz. notta sürekli widgetlar
    işlem yapacağız. yeri geldiğinde widget ile diğer değişkeni nasıl ayıracağınızı gösterdim
    widgetler her daim parantez içinde yazılır. yani kod parçacıklarını bütünleştirince ortaya widget çıkar

    const niteleyicisin bir önemi yok sadece kodların altında çizgiler oluşmaması ve rahat okunabilmesi için yazdım.
    const kelimesini silerseniz çizgi oluştuğunu görürsünüz:)
    ez = easy = kolay

*/

//void main
void main(List<String> args) {
  //void main ilk çalışan kısımdır ve diğer tüm kısımların çalışmasını sağlar. olmazsa olmaz.
  var appuyg = uygulamam();
  runApp(appuyg); //material app veya türetilmiş nesne çalıştırır
}

//stateless widget(st)
class uygulamam extends StatelessWidget {
  const uygulamam({Key? key}) : super(key: key);

  //st-widgetin aldığı build widgeti
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //her zaman material app dönderir. herzaman theme ve home vazgeçilmezdir.

      theme: ThemeData(
        //theme, themedata() widgeti alır.
        //
        primarySwatch: Colors.purple, //tema rengini primaryswatch değiştir
        inputDecorationTheme: InputDecorationTheme(
          //theme dekorasyonu bu şekilde ayarlanır. widget ile!!
          filled:
              true, //doldurmasına onay verdikten sonra altta rengi seçiyoruz
          fillColor: Colors
              .purple.shade50, //shade ile daha açık ve koyu renk elde edilir
          border: const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(5)), //border radius kullanımı
          ),
        ),
      ),
      debugShowCheckedModeBanner: false, //debug modunu kapatır
      home: //themeden sonra home ayarlanır
          Scaffold(
        //home scaffold almak zorunda. scaffold içine appbar ve body vazgeçilmezdir
        appBar: AppBar(title: Text("Başlık")), //appbar bu şekilde kullanılır
        body: container_2(),
        //body ise duruma göre, container, row, column, center yanı sıra SingleChildScrollView ve listview alır
        //burada bodyde kullanıdığımız isimde altta class oluşturduk.
        //dikkat edin! class ta return olan değer bizim için asıl önemli olandır.
        //hemen altta return container yazıyor yani bu body için container döndürdüğünü belirtir
        //eğer container_2 nerde diye soruyorsanız biraz aşağıda.
      ),
    );
  }

  Container Container_1() {
    return Container(
      //bu class geriye container dönderiyor bunu body, row gibi istediğimiz yere yazarız.
      //margin: ve padding: edgeInsets widgeti alır
      margin: EdgeInsets.fromLTRB(150, 0, 0, 0),
      color: Colors.grey.shade700, //color bu şekilde kullanılır
      child: Column(
        //container içine tek child aldı onun içine yazılan column veya row içine childeren yazarak sınırsız nesne türetebiliriz
        //column altalta nesneler eklemek için

        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        //kendi isimlerinde widget alıyor ne işe yaradıklarını kafanıza takmayın kullanım şekline bakın.
        //illa ne olduğunu merak ediyorsan itemleri max min boyutunu seçer, main ve cross ta yatay ve dikey hizalama yapar.
        //center merkez, start end; baş son demek. a0 seviye ingilizce.

        children: [
          //childeren içine birden fazla nesne eklenir
          //container içi child iken row, column içleri genelde childeren olur.(mantıken de)
          //childeren: Container[Text('nesneq'), Icon(Icons.simge), Container()];
          //childeren: Container[Container(child: text("dsfs")), row(child:...), column(child:...)...];
          Container(
            child: Text("data"), //child: içerisine tek nesne girer
            width: 60,
            height: 80,
            color: Colors.green,
          ),
          Container(
            //container önemlidir, içerisine şekil vermek için decoration: kullanılır,
            //decoration: ise  BoxDecoration() widgeti alır.
            decoration: BoxDecoration(
                color: Colors.red,
                //border: , borderradius: , boxshadow: , kendi isimleri ile aynı widgetleri alır
                border: Border.all(color: Colors.black, width: 4),
                //ne işe yaradığı önemli değil kullanımını aklınızda tutun
                borderRadius: BorderRadius.only(),
                boxShadow: const [
                  //widget ayarlıyoruz
                  BoxShadow(
                      color: Colors.brown,
                      //offset ile gölge boyutunu ve yönü ayarlanır
                      offset: Offset(5, 5)),
                ]),
            //padding: , margin: , edgeİnsets ile ayarlanır
            padding: EdgeInsets.all(30),
            //yukardaki tün kenara 10 verirken aşağıdakinde tek tek değer girebiliriz
            margin: EdgeInsets.fromLTRB(20, 20, 40, 20),
            width: 40, //genişlik
            height: 90, //yükseklik
          ),
          Container(
              child: Icon(Icons.assessment, size: 75), //icon widget kullanımı
              margin: EdgeInsets.fromLTRB(70, 0, 0, 40)),
          Center(
            child: Text(
              "style",
              //text'i, style'ın aldığı textstyle widgeti özelleştirmemizi sağlar
              style: TextStyle(fontSize: 30, color: Colors.blue.shade100),
            ),
          )
        ],
      ),
    );
  }

  Container container_2() {
    int sayi = 4; //basit bir atama işlemi
    //body için container döndürüyor
    return Container(
      child: Column(
        children: [
          //childeren ile konumun içine sınırsız sayıda nesne ekleycez.
          Row(
            children: [
              Container_1(), //yukarıdaki containeri buraya referans verdik ki konu karışmasın ve uzamasın
            ],
          ),
          Row(children: [
            Flexible(
              flex: 2,
              child: Container(width: 3530, height: 100, color: Colors.grey),
            ),
            Flexible(flex: 2, child: Icon(Icons.access_alarm, size: 100))
          ]),
          //expanded ve flexible ekrana sığmama durumunda kullanılır.
          //expanded ve flexible de "flex" değeri öenmlidir. nesneleri birbirine oranlar ve ekran dışına taşmamasını sağlar
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child:
                      Container(width: 3530, height: 100, color: Colors.grey)),
              //burada rastgele container yerleştirdik ki ekran da gördüğünüz gibi şekil alsın.
              Expanded(flex: 3, child: Icon(Icons.access_alarm, size: 100)),
            ],
          ),
          //sizedbox ile nesneler arası istenilen şekilde boşluk bırakılabilir. ez
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //bütün butonlar, buton tıklandığında ne olacağını belirleyen onPressed: (){} fonksiyonunu alır.
              ElevatedButton(
                child: Text("buton"),
                onPressed: () {
                  print("text buton çalıştı");
                  //fonksiyona "buton çalıştı" yazdırdık. parantazler arasına deger(ne olduğunu siktiret) ile ne yapılacağı {} parantez ile belirlenir
                },
              ),
              SizedBox(
                  width:
                      50), //sizedbox lar nesneler arasına boşuk koymak için widht veya heigh tek parametre alan nesnedir
              FloatingActionButton(
                child: Text("buton2"),
                onPressed: () {}, //boş fonksiyon örneği
              )
            ],
          )
        ],
      ),
    );
  }
}
//diğer sayfaya geçiniz pliz