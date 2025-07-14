import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:eser/src/core/network/states/status.dart';
import 'package:eser/src/screen/CardScreen/repository/api/CardApi.dart';
import 'package:eser/src/screen/CardScreen/repository/data/CardAddData.dart';
import 'package:eser/src/screen/CardScreen/repository/data/card_get_data.dart';
import 'package:eser/src/utils/ToastWidget.dart';
import 'package:eser/src/utils/screen_export.dart';
part 'card_controller.g.dart';

class CardController = _CardControllerBase with _$CardController;

abstract class _CardControllerBase with Store {
  CardApi api = CardApi();

  @action
  Future<void> addCardProduct(
    BuildContext context,
    VoidCallback completeCallback,
    CardDataPost data,
  ) async {
    try {
      log(data.toString());
      await api.card(data).then((e) {
        Toastwidget().toast(context, AppLocalizations.of(context)!.cardadd);
        completeCallback();
      });
    } catch (e) {
      log('Error submitting product: $e');
    }
  }
  @action
cleanList(){
  card.clear();
}
  @observable
  bool loading = false;
  @observable
  ObservableList<CardGetData> card = ObservableList.of([]);
  @observable
  Status status = Status.none;
  @observable
  int sum = 0;
  @action
  Future<void> fetchCard() async {
    loading = true;
    card.clear();
    sum = 0;
    try {
      status = Status.loading;

      final newItems = await api.getCard();
      for (var i = 0; i < newItems.length; i++) {
        for (var j = 0; j < newItems[i].products.length; j++) {
          newItems[i].sum +=
              newItems[i].products[j].sizePrice! *
              newItems[i].products[j].count!;
        }
      }
      card = ObservableList.of(newItems);
      status = Status.completed;
      loading = false;
    } catch (e) {
      log(e.toString());
      status = Status.error;
      loading = false;
    } finally {
      loading = false;
    }
  }

  @action
  Future deleteProductCart(int index, int indexShop) async {
    try {
      card[indexShop].sum -=
          card[indexShop].products[index].sizePrice!.toDouble() *
          card[indexShop].products[index].count!;
             card[indexShop].products.removeAt(index);
      if (card[indexShop].products.length == 0) {
        await CardApi().deleteCard(card[indexShop].cartId.toString());
        card.removeAt(indexShop);
      }
     else{
       await CardApi().deleteCardProduct(
        card[indexShop].products[index].sizeId.toString(),
      );
     }

   
    } catch (e) {
      throw Exception(e);
    }
  }
}
