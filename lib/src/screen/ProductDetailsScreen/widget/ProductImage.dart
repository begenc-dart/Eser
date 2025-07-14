import 'package:eser/src/screen/FavourityScreen/controller/favourity_controller.dart';
import 'package:eser/src/utils/screen_export.dart';

class Productimage extends StatelessWidget {
  int product_id;
  Productimage({required this.product_id});
  var controller = GetIt.instance<DetailsController>();
  var favourity = GetIt.instance<FavourityController>();
  var verification = GetIt.instance<VerificationController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: controller.image.length,
            itemBuilder: (context, index, realIndex) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: double.infinity,
                  child: Networkimagewidget(
                    url: controller.image[index],
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              viewportFraction: 1,
              height: 350,
              onPageChanged: (index, value) {
                controller.change_index(index);
                // dashboard_controller.carusel_index(index);
              },
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Observer(
              builder: (_) {
                return IconButton(
                  onPressed:verification.hasData? () {
                    controller.changeFavourity();
                    favourity.favourityData(
                      context,
                      () {},
                      FavourityData(productId: product_id),
                    );
                  }:(){
                    Navigator.pushNamed(context, RouteContstants.welcomeScreenRoute);
                  },
                  icon: Icon(
                    controller.isLike
                        ? Icons.favorite
                        : Icons.favorite_border_rounded,
                    color:
                        controller.isLike
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary,
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,

            child: IntrinsicWidth(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(5),
                  height: 60,
                  // width: double.minPositive,
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < controller.image.length; i++)
                          Observer(
                            builder: (_) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Container(
                                  decoration:
                                      controller.index == i
                                          ? BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                            border: Border.all(
                                              color:
                                                  Theme.of(
                                                    context,
                                                  ).colorScheme.secondary,
                                            ),
                                          )
                                          : null,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Networkimagewidget(
                                      url: controller.image[i],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
