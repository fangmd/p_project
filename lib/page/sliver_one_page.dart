import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/app_state_container.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/common_utils.dart';
import 'package:p_project/page/mine_page.dart';
import 'package:p_project/router/router.dart';
import 'package:p_project/style/my_styles.dart';

class SliverOnePage extends StatelessWidget {
  static var routeName = '/sliverOne';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Hahah'),
            centerTitle: true,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
              Text(
                '1111',
                style: MyStyleUtils.bigText,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
