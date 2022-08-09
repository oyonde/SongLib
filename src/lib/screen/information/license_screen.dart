import 'package:songlib/navigator/mixin/back_navigator.dart';
import 'package:songlib/navigator/route_names.dart';
import 'package:songlib/styles/theme_dimens.dart';
import 'package:songlib/vm/information/license_vm.dart';
import 'package:songlib/widget/general/styled/songlib_back_button.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class LicenseScreen extends StatefulWidget {
  static const String routeName = RouteNames.licenseScreen;

  const LicenseScreen({
    Key? key,
  }) : super(key: key);

  @override
  LicenseScreenState createState() => LicenseScreenState();
}

@visibleForTesting
class LicenseScreenState extends State<LicenseScreen> with BackNavigatorMixin implements LicenseNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LicenseVm>(
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: SongLibBackButton.light(onClick: viewModel.onBackClicked),
          title: Text(
            'Licenses',
            style: theme.coreTextTheme.titleNormal,
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(ThemeDimens.padding16),
          itemCount: viewModel.licenses.length,
          itemBuilder: (context, index) {
            final item = viewModel.licenses[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(ThemeDimens.padding16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    Container(height: ThemeDimens.padding8),
                    Text(
                      item.license,
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      create: () => GetIt.I()..init(this),
    );
  }
}