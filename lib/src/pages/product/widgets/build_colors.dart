part of '../product_page.dart';


class _BuildColors extends StatefulWidget {
  @override
  __BuildColorsState createState() => __BuildColorsState();
}

class __BuildColorsState extends State<_BuildColors> {
  int? _colorIndex;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Available Color',
            style: theme.textTheme.headline3,
          ),
          SizedBox(height: Const.space12),
          Wrap(
            children: FilterList.colorList.asMap().entries.map((e) {
              int _index = e.key;
              Color _val = e.value;
              return Padding(
                padding: EdgeInsets.only(
                    right: Const.space12, bottom: Const.space12),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        _colorIndex = _index;
                      });
                    },
                    borderRadius: BorderRadius.circular(Const.GLOBAL_RADIUS),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: _val,
                      child: (_colorIndex == _index)
                          ? CircleAvatar(
                              radius: 12.0,
                              backgroundColor: Colors.white,
                            )
                          : SizedBox(),
                    )),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
