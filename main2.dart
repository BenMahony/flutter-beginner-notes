import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

//@author halilCan;
/* *****diğer bilgiler
-------------
kodlara resim ekliyceksek pupspec dosyasına aşağıdaki satirlar düzenlenmeli. doğru yazımı önemli.
      assets:
        - assets/images/
----veya----
      final string url1 = "https://www.resim.com"   url atarken final türü olmasına özen gösterelim pliz


-------------
aşağıda resimleri assets dosyası ve url şeklinde eklenmeleri gözüküyor.
      child: Image.asset("assets/images/anubis.jpg"),
      child: Image.asset("assets/images/face.jpg",fit: BoxFit.cover,),
      child: Image.network(url4,fit: BoxFit.cover),
      child: circleAvatar(backgroundImage: AssetImage("assest/images/fac.jpg"), radius: 64,)
      child: Placeholder(color: Colors.orange)


-------------
//listelerde veya butonlarda kullanılacak veriler map listesi içinde saklanır
      Map<String, int> sehirlerMap = {
          "ankara": 06,
          "bursa": 16};  

// bu itemler aşağıdaki şekilde kullanılabilir. anlamayan için= text içine e'nin keyi(şehirler); değer kısmına e'nin int(plaka) atanıyor. 
//e(yukarıdaki map list)
        items : sehirlerMap.entries.map((e)=> Dropdownmenuitem(
          child: Text(e.key), value: e.value)).tolist();

------------
//aşağıdaki kod buton içine yazılır ve yeni sayfa açma işini sırtına yükler.
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {return main2Sayfa();}));

-------------
//aşağıdaki kod buton izine yazılır ve ekrana mesaj göstermeye yarar.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("metin",style: TextStyle(fontSize: 20),),));

-------------
nesneleri kodlarken darttan hatırlayacağınız:) this parametresi ile atama yapılıp işler kolayına iniyor.
      ogrenci.parametreli(this.id, this.adi, this.soyadi, this.not, this.foto);

*/

//stateless ile statefull farkı
//stfulda "state kelimesi vardır" state ile stful hareketli(eşzamanlı,dinamik özelliğini alır).
//stles ise dinamik değildir ve içerisine setState((){}) gibi otu boku alamaz.
//setState((){}) çok kullanımı çok önemlidir. eğer kullanılmazsa o an derlenen uygulama da yapılan hiçbir değişiklik ekrana yansımaz
class stfOrnek extends StatefulWidget {
  const stfOrnek({Key? key}) : super(key: key);

  @override
  State<stfOrnek> createState() => _stfOrnekState();
}

class _stfOrnekState extends State<stfOrnek> {
  TextEditingController?
      a_ctrl; //field lere controller atayarak o texti hafıza da tutabiliriz. form dosyasında adınızı girdiğinizde bu cntrllr içinde saklanır
  TextEditingController? b_ctrl;
  var formKey = GlobalKey<
      FormState>(); //form uygulamalrında o formun bilgilerini global şekilde tutup save etmek veya aktarmak için bu şekilde tanımlanır
  String foto = "https//www.google.com";

  @override
  void initState() {
    a_ctrl = TextEditingController(text: "Text Editing Contr");
    b_ctrl = TextEditingController(text: "num ctrl");
    super.initState();
  }

//bazı değişken isim ve değerlerini ram de tutmak zorunda kalabiliyoruz
//initState de kullanılan herşey ram de kendine yer eyırır.
//eğer bunları kullandıktan sonra dispose etmezsek programı yavaşlatır.
  @override
  void dispose() {
    super.dispose();
    a_ctrl!.dispose();
    b_ctrl!.dispose();
  } // ! işareti bu değerin boş olabileceğini hesaba kattığımızı belirtiyor.

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //aşağıdaki controlleri atıyoruz ve ardından textınputType ile bunun number fieldi olması gerektiği belirtildi
          TextField(controller: a_ctrl, keyboardType: TextInputType.number),
          const TextField(
            //textfield, inputDecoration ile
            //theme, inputdecorationtheme ile
            //container, decorationBox ile
            //text, style: textStyle ile
            //özelleştirilir. (widget kodluyoruz)
            decoration: InputDecoration(
                label: Text("ilk gözüken"),
                hintText: "üzerine tıklandığında gözüken"),
            //prefixIcon ve suffixIcon ile icon eklenebilir
            //focusNode: adSoyadFcs tıklandığında yazılan alan genişler
          ),
          TextButton(onPressed: () {}, child: Text("text")),
          //butonların onpressed ve child atanması mutlaktır
          ElevatedButton(onPressed: () {}, child: Text("elevated")),
          OutlinedButton(onPressed: () {}, child: Text("outlined")),
          TextButton.icon(
              //iconlu buton istersen bu şekilde .icon yazarak aşağıda icon: ile tanımlıyoruz
              onPressed: () {},
              icon: Icon(Icons.abc),
              label: Text("icon")),
          ListTile(
            //listtile 4 ana başlık alır önemli
            title: Text("başlık"),
            subtitle: Text("alt başlık"),
            leading: CircleAvatar(
                backgroundImage: NetworkImage(foto)), //iconunu belirtiyoruz
            trailing: Text(
                "değişik"), //karşısında ki değişik bi değer var onu belirler
          )
        ],
      ),
    );
  }
}
