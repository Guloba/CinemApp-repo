import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({Key? key}) : super(key: key);
  static const routeName = '/Ticket-screen';

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  final String _txref = "My_unique_transaction_reference_123";
  final String _amount = "30000";
  final String _currency = FlutterwaveCurrency.UGX;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _bottomSheet(),
      appBar: AppBar(
        title: Text('Ticket Details'),
      ),
      body: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(color: Colors.black12),
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.network(
                'https://media.istockphoto.com/vectors/code-illustration-vector-id828088276?k=20&m=828088276&s=612x612&w=0&h=JnX2DFXVGyTe-wDXdXhTG9p7yPmbd-jO3qWRfCQnHgE='),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 300),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.save),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                'Togoo',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'UGX 30000',
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.purple,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'FR, FEB 18',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      _contentRow(
                        title: 'Time',
                        nameTitle: '6:30 PM',
                      ),
                      _contentRow(
                        title: 'Cinema Hall',
                        nameTitle: 'A',
                      ),
                      _contentRow(
                        title: 'Seat',
                        nameTitle: 'D1, D2, D3',
                      ),
                      _contentRow(
                        title: 'Popularity',
                        nameTitle: 'Popular',
                      ),
                      const SizedBox(height: 15),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                        height: 1,
                      ),
                      Container(
                        color: Colors.black54,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                'No reviews yet',
                                style: TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                'Be The First To Review!',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(height: 70),
                            const Divider(
                              thickness: 1,
                              color: Colors.grey,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _bottomSheet() => Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.pinkAccent,
              height: 50,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Fluttertoast.showToast(msg: "ahhhhh");
                    _beginPayment();
                  },
                  child: Text(
                    'BUY NOW',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  void _beginPayment() async {
    Flutterwave flutterwave = Flutterwave.forUIPayment(
      context: context,
      encryptionKey: "FLWSECK_TEST30e7fa550811",
      publicKey: "FLWPUBK_TEST-184128bc2930203ae678bb6396ccceb8-X",
      currency: _currency,
      amount: _amount,
      email: FirebaseAuth.instance.currentUser!.email!,
      fullName: FirebaseAuth.instance.currentUser!.displayName!,
      txRef: _txref,
      isDebugMode: true,
      phoneNumber: "0776844757",
      acceptCardPayment: true,
      acceptUSSDPayment: true,
      acceptUgandaPayment: true,
    );

    try {
      final ChargeResponse? response =
          await flutterwave.initializeForUiPayments();
      if (response == null) {
        // user didn't complete the transaction.
      } else {
        final isSuccessful = checkPaymentIsSuccessful(response);
        if (isSuccessful) {
          // provide value to customer
        } else {
          // check message
          print(response.message);

          // check status
          print(response.status);

          // check processor error
          print(response.data!.processorResponse);
        }
      }
    } catch (error, stacktrace) {
      // handleError(error);
    }
  }

  bool checkPaymentIsSuccessful(final ChargeResponse response) {
    return response.data!.status == FlutterwaveConstants.SUCCESSFUL &&
        response.data!.currency == _currency &&
        response.data!.amount == _amount &&
        response.data!.txRef == _txref;
  }
}

class _contentRow extends StatelessWidget {
  final String title;
  final String nameTitle;
  const _contentRow({
    required this.title,
    required this.nameTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: Row(
        children: [
          Text(
            '${title}: ',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            nameTitle,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
