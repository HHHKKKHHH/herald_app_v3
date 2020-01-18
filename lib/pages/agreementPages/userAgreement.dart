import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../app.dart';
import '../../models/base.dart';

class UserAgreementModel extends BaseModel {
  String _agreementText =
      "永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右，引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。\n是日也，天朗气清，惠风和畅。仰观宇宙之大，俯察品类之盛，所以游目骋怀，足以极视听之娱，信可乐也。夫人之相与，俯仰一世。或取诸怀抱，悟言一室之内；或因寄所托，放浪形骸之外。虽趣舍万殊，静躁不同，当其欣于所遇，暂得于己，快然自足，不知老之将至；及其所之既倦，情随事迁，感慨系之矣。向之所欣，俯仰之间，已为陈迹，犹不能不以之兴怀，况修短随化，终期于尽！古人云：“死生亦大矣。”岂不痛哉！每览昔人兴感之由，若合一契，未尝不临文嗟悼，不能喻之于怀。固知一死生为虚诞，齐彭殇为妄作。后之视今，亦犹今之视昔，悲夫！故列叙时人，录其所述，虽世殊事异，所以兴怀，其致一也。后之览者，亦将有感于斯文";
  String _agreementTitle = "兰亭集序";

  UserAgreementModel(BuildContext context) : super(context);

  get agreementText {
    return this._agreementText;
  }

  get agreementTitle {
    return this._agreementTitle;
  }
}

class UserAgreementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UserAgreementModel(context),
        child: UserAgreementView());
  }
}

class UserAgreementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("隐私政策"),
          //actionsForegroundColor: Color(0xFFFFFFFF),
        ),
        child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: ListView(
                  primary: true,
                  children: <Widget>[
                    Text(
                      Provider.of<UserAgreementModel>(context, listen: false)
                          ._agreementTitle,
                      style: TextStyle(
                          color: Color(0xFF13ACD9),
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      Provider.of<UserAgreementModel>(context, listen: false)
                          ._agreementText,
                      style: TextStyle(color: Color(0xFF000000), fontSize: 18),
                      textAlign: TextAlign.left,
                    )
                  ],
               )));
  }
}
