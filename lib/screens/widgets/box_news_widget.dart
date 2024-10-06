import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sigma/screens/widgets/show_custom_snackbar.dart';

class BoxNewsWidget extends StatefulWidget {
  final String? title;
  final String? description;
  final Image? imageUrl;
  final DateTime? date;
  final String? url;

  const BoxNewsWidget(
      {super.key,
      this.title,
      this.description,
      this.imageUrl,
      this.date,
      this.url});

  @override
  State<BoxNewsWidget> createState() => _BoxNewsWidgetState();
}

class _BoxNewsWidgetState extends State<BoxNewsWidget> {
  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd/MM/yy').format(widget.date!);
    return GestureDetector(
      onTap: _launchURL,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
                SizedBox(
                width: 150,
                height: 150,
                child: widget.imageUrl!,
                ),
              const SizedBox(width: 10),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      widget.title!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.description!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL() async {
    widget.url;
    //if (siteAddress != null && await canLaunch(siteAddress)) {
    //await url_launcher.launch(siteAddress);
    //} else {
    showCustomSnackBar(
      context: context,
      message: 'Não foi possível abrir o site, tente mais tarde',
      duration: const Duration(seconds: 5),
    );
  }
}
//}
