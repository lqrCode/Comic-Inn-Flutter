import 'package:ComicInn/common/common.dart';

class SwiperPaginationItem extends SwiperPlugin {
  const SwiperPaginationItem();

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    return Container(
      height: Lqr().width(6),
      margin: Lqr().edgeB(10),
      child: Center(
        child: ListView.builder(
          itemCount: config.itemCount,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int i) {
            return Container(
              width: Lqr().width(config.activeIndex == i ? 30 : 20),
              margin: Lqr().edgeR(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: config.activeIndex == i ? Colors.white : Color(0xFFB5B1B2),
              ),
            );
          },
        ),
      ),
    );
  }
}
