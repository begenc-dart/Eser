import 'package:eser/src/screen/DashboardScreen/controller/banner_controller.dart';
import 'package:eser/src/utils/screen_export.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Caruselimage extends StatelessWidget {
  Caruselimage({super.key});
  var dashboard_controller = GetIt.instance<DashboardController>();
  var banner_controller = GetIt.instance<BannerController>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (banner_controller.banner.length == 0) {
          return Container();
        }
        return Skeletonizer(
          enableSwitchAnimation: true,
          enabled: banner_controller.loading,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CarouselSlider.builder(
                  itemCount: banner_controller.banner.length,
                  itemBuilder: (context, index, realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Networkimagewidget(
                        url:
                            Configs.imageUrl +
                            banner_controller.banner[index].thumbnailUrl!,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, value) {
                      dashboard_controller.carusel_index(index);
                    },
                  ),
                ),
              ),
              SizedBox(height: 7),
              Observer(
                builder: (_) {
                  return AnimatedSmoothIndicator(
                    count: banner_controller.banner.length,
                    axisDirection: Axis.horizontal,
                    effect: ExpandingDotsEffect(
                      dotWidth: 8,
                      dotHeight: 8,
                      activeDotColor: Theme.of(context).colorScheme.secondary,
                      // spacing:  8.0,
                      // radius:  4.0,
                      // dotWidth:  24.0,
                      // dotHeight:  16.0,
                      // paintStyle:  PaintingStyle.stroke,
                      // strokeWidth:  1.5,
                      // dotColor:  Colors.grey,
                      // activeDotColor:  Colors.indigo
                    ),
                    activeIndex: dashboard_controller.index,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
