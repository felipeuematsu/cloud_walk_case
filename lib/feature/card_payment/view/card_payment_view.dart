import 'package:cloud_walk_case/design_system/widgets/final_value_widget.dart';
import 'package:cloud_walk_case/entity/general/transaction_details.dart';
import 'package:cloud_walk_case/feature/card_payment/viewmodel/card_payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';

class CardPaymentView extends StatefulWidget {
  const CardPaymentView({super.key});

  @override
  State<CardPaymentView> createState() => _CardPaymentViewState();
}

class _CardPaymentViewState extends State<CardPaymentView> {
  final CardPaymentViewModel viewModel = CardPaymentViewModel();

  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.7),
      width: 2.0,
    ),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manual Card'),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24),
        child: ChangeNotifierProvider.value(
          value: viewModel,
          builder: (context, child) {
            final viewModel = context.watch<CardPaymentViewModel>();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FinalValueWidget(
                  valueCents: context.read<TransactionDetails>().valueCents,
                ),
                SizedBox(height: 36),
                CreditCardWidget(
                  padding: 0,
                  enableFloatingCard: true,
                  cardNumber: viewModel.cardNumber,
                  expiryDate: viewModel.expiryDate,
                  cardHolderName: viewModel.cardHolderName,
                  cvvCode: viewModel.cvvCode,
                  bankName: 'Axis Bank',
                  showBackView: viewModel.isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                  isSwipeGestureEnabled: true,
                  onCreditCardWidgetChange:
                      (CreditCardBrand creditCardBrand) {},
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CreditCardForm(
                          formKey: formKey,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumber: viewModel.cardNumber,
                          cvvCode: viewModel.cvvCode,
                          isHolderNameVisible: true,
                          isCardNumberVisible: true,
                          isExpiryDateVisible: true,
                          cardHolderName: viewModel.cardHolderName,
                          expiryDate: viewModel.expiryDate,
                          inputConfiguration: const InputConfiguration(
                            cardNumberDecoration: InputDecoration(
                              labelText: 'Number',
                              hintText: 'XXXX XXXX XXXX XXXX',
                            ),
                            expiryDateDecoration: InputDecoration(
                              labelText: 'Expired Date',
                              hintText: 'XX/XX',
                            ),
                            cvvCodeDecoration: InputDecoration(
                              labelText: 'CVV',
                              hintText: 'XXX',
                            ),
                            cardHolderDecoration: InputDecoration(
                              labelText: 'Card Holder',
                            ),
                          ),
                          onCreditCardModelChange:
                              viewModel.onCreditCardModelChange,
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _onValidate,
                  child: const Text('Validate'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onValidate() {
    if (formKey.currentState?.validate() ?? false) {
      print('valid!');
    } else {
      print('invalid!');
    }
  }
}
