
import 'package:flutter/cupertino.dart';
class CupertinoListTile extends StatefulWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;

  const CupertinoListTile({Key key, this.leading, this.title, this.subtitle, this.trailing}): super(key: key);

  @override
  _StatefulStateCupertino createState() => _StatefulStateCupertino();
}

class _StatefulStateCupertino extends State<CupertinoListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 20),
              widget.leading != null  ? widget.leading : SizedBox(),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  widget.title != null  ? widget.title : SizedBox(),
                  widget.subtitle != null  ? widget.subtitle : SizedBox(),
//                  Text(
//                      widget.title,
//                      style: TextStyle(
//                        color: CupertinoColors.white,
//                        fontSize: 25,
//                      )
//                  ),
//                  Text(
//                      widget.subtitle,
//                      style: TextStyle(
//                        color: CupertinoColors.systemGrey,
//                        fontSize: 20,
//                      )
//                  ),
                ],
              ),
            ],
          ),
          widget.trailing != null  ? widget.trailing : SizedBox(),
        ],
      ),
    );
  }
}

