import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package
import 'bottomnavigationbar.dart'; // Import the BottomNavigationBarWidget

class QRScannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QRScannerPage(),
    );
  }
}

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage>
    with SingleTickerProviderStateMixin {
  late QRViewController controller;
  late AnimationController _animationController;
  bool _isDialogShowing = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust animation speed
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('QR Scanner'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color:
                Colors.black.withOpacity(0.5), // Semi-transparent black color
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          QRView(
            key: GlobalKey(debugLabel: 'QR'),
            onQRViewCreated: (controller) {
              this.controller = controller;
              _onQRViewCreated(controller);
            },
          ),
          Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return CustomPaint(
                  size: Size(250, 250),
                  painter: QRFramePainter(
                    animation: _animationController,
                    cornerSize: 20,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 2, // Assuming QR Scanner is the selected index
        onItemTapped: (index) {
          // Handle item tap here if needed
        },
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      String scannedUrl = scanData.code ?? ""; // Get the scanned URL
      // Check if the scanned data is a valid URL
      if (scannedUrl.isNotEmpty &&
          Uri.tryParse(scannedUrl)?.isAbsolute == true) {
        if (!_isDialogShowing) {
          _showEmailPhoneDialog(
              scannedUrl); // Show the dialog box to collect email and phone number
        }
      } else {
        // Show an error message if the scanned data is not a valid URL
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("QR Code Scanned"),
            content: Text("Scanned data is not a valid URL"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  void _showEmailPhoneDialog(String url) {
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    _isDialogShowing = true;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          title: Text("Enter Details"),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        final validEmailRegex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@(gmail\.com|hotmail\.com|yahoo\.com)$');
                        if (!validEmailRegex.hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: phoneController,
                      maxLength: 10, // Restrict input to 10 characters
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: "Enter your phone number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your number';
                        }
                        if (value.length != 10 ||
                            !RegExp(r'^\d{10}$').hasMatch(value)) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // Set the text color
              ),
              onPressed: () {
                _isDialogShowing = false;
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.green, // Set the text color
              ),
              onPressed: () {
                if (_formKey.currentState?.validate() == true) {
                  _isDialogShowing = false;
                  Navigator.pop(context);
                  launch(url);
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    ).then((_) {
      _isDialogShowing = false;
    });
  }
}

class QRFramePainter extends CustomPainter {
  final Animation<double> animation;
  final double cornerSize;

  QRFramePainter({required this.animation, required this.cornerSize});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final Path path = Path()
      ..moveTo(0, cornerSize)
      ..lineTo(0, 0)
      ..lineTo(cornerSize, 0)
      ..moveTo(size.width - cornerSize, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, cornerSize)
      ..moveTo(size.width, size.height - cornerSize)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - cornerSize, size.height)
      ..moveTo(cornerSize, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, size.height - cornerSize);

    canvas.drawPath(path, paint);

    final double lineHeight = size.width * 0.2; // Adjust as needed
    final double gapHeight = size.width * 0.1; // Adjust as needed
    final double totalHeight = size.height - (2 * cornerSize);
    final double animationValue = animation.value;
    final double progress = totalHeight * animationValue;

    final Path scanLinePath = Path()
      ..moveTo(cornerSize, cornerSize + progress)
      ..lineTo(size.width - cornerSize, cornerSize + progress);

    final Paint scanLinePaint = Paint()
      ..color = Colors.red // Adjust scan line color as needed
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawPath(scanLinePath, scanLinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
