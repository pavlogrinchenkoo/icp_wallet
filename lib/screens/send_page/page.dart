import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:isp_wallet/generated/assets.gen.dart';
import 'package:isp_wallet/style.dart';
import 'package:isp_wallet/utils/custom_stream_builder.dart';
import 'package:isp_wallet/utils/spaces.dart';
import 'package:isp_wallet/widgets/custom_buttom.dart';
import 'package:isp_wallet/widgets/custom_scaffold.dart';
import 'package:isp_wallet/widgets/custom_textfield.dart';

import 'bloc.dart';

@RoutePage()
class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  TextEditingController amountController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final SendBloc bloc = SendBloc();

  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder(
        bloc: bloc,
        builder: (BuildContext context, ScreenState state) {
          return CustomScaffold(
              appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => context.router.pop(),
                      child: Row(
                        children: [
                          Space.w22,
                          Icon(Icons.arrow_back_ios_new_sharp,
                              color: BC.white, size: 20),
                          Space.w4,
                          Text('Back', style: BS.med18),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ]),
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Space.h32,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 22),
                      decoration: BoxDecoration(
                          borderRadius: BRadius.r21,
                          image: DecorationImage(
                              image: Assets.images.bagraund.image().image,
                              fit: BoxFit.fill)),
                      child: Column(
                        children: [
                          Text(
                            'SEND',
                            style: BS.bold24,
                          ),
                          Space.h16,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '00.00',
                                style: BS.bold40,
                              ),
                              Text(
                                'ICP',
                                style: BS.reg24,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Enter amount',
                                style: BS.light14,
                              ),
                              Space.h4,
                              CustomTextFieldSend(
                                maxLength: 12,
                                keyboardType: TextInputType.number,
                                  labelText: '00.00',
                                  suffixIcon: Text(
                                    'ICP',
                                    style: BS.reg18.apply(
                                        color: BC.white.withOpacity(0.7)),
                                  ),
                                  controller: amountController,
                                  onChanged: (value) {
                                    bloc.changeDisabled(addressController.text,
                                        amountController.text);
                                  })
                            ],
                          ),
                          Space.h16,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Enter receiver address',
                                style: BS.light14,
                              ),
                              Space.h4,
                              CustomTextFieldSend(
                                  labelText: 'Enter address',
                                  controller: addressController,
                                  onChanged: (value) {
                                    bloc.changeDisabled(addressController.text,
                                        amountController.text);
                                  })
                            ],
                          ),
                          Space.h16,
                        ],
                      ),
                    ),
                    Space.h32,
                    CustomButtonBlue(
                      text: 'Send'.toUpperCase(),
                      onTap: () => bloc.send(context),
                      disabled: state.isDisabled,
                    )
                  ],
                ),
              ));
        });
  }
}
