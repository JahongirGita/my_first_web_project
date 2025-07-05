import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_web_project/utils/Navbar.dart';
import 'dart:html' as html;
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final String assetPath = 'assets/files/sample1.pdf';

  bool _isDownloading = false;

  Future<void> downloadPdf() async {
    setState(() {
      _isDownloading = true;
    });

    try {
      // Assets papkasidan PDF faylni o'qish
      final ByteData data = await rootBundle.load('assets/files/dgu.pdf');
      final Uint8List bytes = data.buffer.asUint8List();

      // Blob yaratish
      final blob = html.Blob([bytes], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Download link yaratish
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "sample.pdf")
        ..click();

      // Memory tozalash
      html.Url.revokeObjectUrl(url);

      // Success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('PDF muvaffaqiyatli yuklandi!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Error handling
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Xatolik: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isDownloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          bool isDesktop = constraints.maxWidth > 800;
          return Scaffold(
            backgroundColor: Color(0xFFF3F4F6),
            // appBar: AppBar(
            //   backgroundColor: Colors.white,
            //   leading: !isDesktop ? IconButton(onPressed: (){}, icon: Icon(Icons.menu)) : null,
            // ),
            body: Row(
              children: [
                if(isDesktop)...[
                  Navbar(onTapLanguage: (){}, onTapProfile: (){}),
                ],
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    child: ListView.separated(itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/pdf_img.png',width: 36,height: 36,),
                            SizedBox(width: 16,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text("DGU",style: TextStyle(fontSize: 16,fontFamily: "Merriweather"),),
                              TextButton(onPressed: (){
                                    setState(() {
                                      downloadPdf();
                                    });
                              }, child: Text("Download",style: TextStyle(fontSize: 12,fontFamily: "Merriweather",color: Colors.blue),))

                            ],)
                          ],
                        ),
                      );
                    }, separatorBuilder: (context,index){
                      return SizedBox(height: 8,);
                    }, itemCount: 16),
                  ),
                )
              ],
            ),
          );
        },
    );
  }
}
