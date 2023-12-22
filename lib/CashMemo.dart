import 'dart:js';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';








class CashMemoPDFView extends StatefulWidget {




 
  const CashMemoPDFView({Key? key, }) : super(key: key);

  @override
  State<CashMemoPDFView> createState() => _CashMemoPDFViewState();
}

class _CashMemoPDFViewState extends State<CashMemoPDFView> {











  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      
      appBar: AppBar(
      
      
      systemOverlayStyle: SystemUiOverlayStyle(
            // Navigation bar
            statusBarColor: Colors.blueAccent, // Status bar
          ),
       
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Marks Sheet", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: PdfPreview(
        build: (context) => makePdf(),
      ),
    );
  }
}



// makePdf(widget.StudentName,widget.StudentIDNo, widget.StudentPhoneNumber,widget.StudentCashIn,widget.StudentEmail,widget.CashInDate)








Future<Uint8List> makePdf() async {

final netImage = await networkImage('https://i.ibb.co/SR6tHQt/bajaj-logo.jpg');

// final backImage = await networkImage('https://i.ibb.co/yfvj470/pngwing-com.png');












final pdf = pw.Document();

final garland = await rootBundle.loadString('assets/border_image.svg');
final swirls3 = await rootBundle.loadString('assets/swirls3.svg');
final swirls = await rootBundle.loadString('assets/swirls.svg');
final swirls1 = await rootBundle.loadString('assets/swirls1.svg');
final swirls2 = await rootBundle.loadString('assets/swirls2.svg');

final ByteData image = await rootBundle.load('assets/pngwing.png');

Uint8List imageData = (image).buffer.asUint8List();


final font = await rootBundle.load("lib/fonts/JosefinSans-BoldItalic.ttf");
final ttf = pw.Font.ttf(font);

final Banglafont = await rootBundle.load("lib/fonts/Siyam-Rupali-ANSI.ttf");
final Banglattf = pw.Font.ttf(Banglafont);


pdf.addPage(pw.Page(
  
  pageTheme: pw.PageTheme(
    pageFormat: PdfPageFormat.a4,
    theme: pw.ThemeData.withFont(base: pw.Font.ttf(await rootBundle.load("lib/fonts/Caladea-BoldItalic.ttf")),),
    buildBackground: (context)=>pw.FullPage(ignoreMargins: true,child: pw.Container(

       margin: const pw.EdgeInsets.all(10),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(
                  color: const PdfColor.fromInt(0xcc7722), width: 1),
            ),

      child:  pw.Container(

         margin: const pw.EdgeInsets.all(5),
              decoration: pw.BoxDecoration(
                
                border: pw.Border.all(
                    color: const PdfColor.fromInt(0xcc7722), width: 5),
              ),
              width: double.infinity,
              height: double.infinity,
              child: pw.Stack(
                alignment: pw.Alignment.center,
                children: [

           pw.Positioned(
                    bottom: 5,
                    left: 5,
                    child: pw.Transform(
                      transform: Matrix4.diagonal3Values(1, -1, 1),
                      adjustLayout: true,
                      child: pw.SvgImage(
                        svg: swirls3,
                        height: 160,
                      ),
                    ),
                  ),


                    pw.Positioned(
                    top: 5,
                    left: 5,
                    child: pw.SvgImage(
                      svg: swirls3,
                      height: 160,
                    ),
                  ),
                  pw.Positioned(
                    top: 5,
                    right: 5,
                    child: pw.Transform(
                      transform: Matrix4.diagonal3Values(-1, 1, 1),
                      adjustLayout: true,
                      child: pw.SvgImage(
                        svg: swirls3,
                        height: 160,
                      ),
                    ),
                  ),

                  pw.Positioned(
                    bottom: 5,
                    right: 5,
                    child: pw.Transform(
                      transform: Matrix4.diagonal3Values(-1, -1, 1),
                      adjustLayout: true,
                      child: pw.SvgImage(
                        svg: swirls3,
                        height: 160,
                      ),
                    ),
                  ),


                    //  pw.Image(netImage, height: 850, width: 550,dpi: 111.5 ),

                  
                  // pw.Container(
                  //       width: 1380.0,
                  //       height: 890.0,
                  //       child: pw.Image(pw.MemoryImage(imageData))
                  //   )


                ]
              )
      )
    ))
  ),
  
  // theme: pw.ThemeData.withFont(base: pw.Font.ttf(await rootBundle.load("lib/fonts/JosefinSans-BoldItalic.ttf")),),
  //     pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [

            pw.Row(
              
              mainAxisAlignment: pw.MainAxisAlignment.start,

              children: [

                pw.Padding(
                   padding: pw.EdgeInsets.only(left: 30,top: 30),
                  child: pw.Center(child:  pw.Image(netImage, height: 70, width: 70, ),),),

                pw.Padding(
                  padding: pw.EdgeInsets.only(left: 20, top: 20),
                  
                  child: pw.Column(children: [


                  pw.Text("M/S. ORTHEE BAJAJ MART", style:pw.TextStyle(fontSize: 21, fontWeight: pw.FontWeight.bold, font: ttf)),
                  pw.Text("‡gmvm© A_©x evRvR gvU©", style:pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold, font: Banglattf)),
                  pw.Center(child: pw.Text("Dealer: Uttara Motors Ltd.", style:pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, font: ttf)),),

                  pw.Center(child: pw.Text("Kalai, Joypurhat", style:pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold, font: ttf)),),

                   pw.SizedBox(height: 6),

                  pw.Center(child: pw.Text("Mobile: 01711414664, 01721608030, Phone: 0571-51139", style:pw.TextStyle(fontSize: 9,  font: ttf)),),

                  pw.SizedBox(height: 6),
                  // pw.Center(child: pw.Text("EIIN: 122026", style:pw.TextStyle(fontSize: 11,  font: ttf)),),



                ]))




            ]),

            


             pw.SizedBox(
                      height: 10,
                      
                
              ),


              pw.Container(
                width: 650,
                 decoration: const pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.only(
                            topRight: pw.Radius.circular(10.0),
                            topLeft: pw.Radius.circular(10.0),
                            bottomLeft: pw.Radius.circular(10.0),
                            bottomRight: pw.Radius.circular(10.0)),
                        color: PdfColors.blue500,
                      ),
                
                
                
                child: pw.Center(child: pw.Padding(padding: pw.EdgeInsets.all(3), child: pw.Text("mKj c«Kvi g‡W‡ji evRvR ‡gvUi mvB‡Kj weµ‡qi wek¦¯— c«wZôvb", style: pw.TextStyle(fontSize: 7, color: PdfColors.white, font: Banglattf))))),


              // pw.Center(child:  pw.Image(netImage, height: 150, width: 250, ),),

              //    pw.SizedBox(
              //         height: 20,
                      
                
              // ),



              pw.SizedBox(
                      height: 30,
                      
                
              ),



              pw.Center(child: pw.Container(

                 decoration: const pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.only(
                            topRight: pw.Radius.circular(10.0),
                            topLeft: pw.Radius.circular(10.0),
                            bottomLeft: pw.Radius.circular(10.0),
                            bottomRight: pw.Radius.circular(10.0)),
                        color: PdfColors.blue500,
                      ),
                
                
                
                child: pw.Padding(padding: pw.EdgeInsets.all(10), child: pw.Text("MONEY RECEIPT", style: pw.TextStyle(fontSize: 14, color: PdfColors.white, font: ttf))))),


           




            pw.SizedBox(height: 20),





            
              pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Received with thanks from Mr/Messrs", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 300,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("Mahadi Hasan", style: pw.TextStyle(fontSize: 14,))))

              ]),




              pw.SizedBox(height: 10),



              pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("S/O", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 470,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("Mahadi Hasan", style: pw.TextStyle(fontSize: 14,))))

              ]),




               pw.SizedBox(height: 10),



              pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Address", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 440,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("Joypurhat Sadar, Joypurhat", style: pw.TextStyle(fontSize: 14,))))

              ]),





              pw.SizedBox(height: 10),



              pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("a sum of taka", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 410,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("One hundred tweenty", style: pw.TextStyle(fontSize: 14,))))

              ]),





              pw.SizedBox(height: 10),



              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [


                pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("in Cash", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 200,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("320000", style: pw.TextStyle(fontSize: 14,))))

              ]),





               pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Due", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 220,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("320000", style: pw.TextStyle(fontSize: 14,))))

              ]),


              ]),







                pw.SizedBox(height: 10),



              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [


                pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("File No", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 200,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("B-213", style: pw.TextStyle(fontSize: 14,))))

              ]),





               pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Phone No", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 200,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("320000", style: pw.TextStyle(fontSize: 14,))))

              ]),


              ]),






              pw.SizedBox(height: 10),



              pw.Row(
                
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text("Date", style: pw.TextStyle(fontSize: 11,)),

                  pw.SizedBox(width: 4),

                  pw.Container(
                
                width: 465,
                decoration:  pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed))),
                    child: pw.Padding(padding: pw.EdgeInsets.only(bottom: 5, left: 30),child: pw.Text("31-12-2034", style: pw.TextStyle(fontSize: 14,))))

              ]),











              pw.SizedBox(
                      height: 20,    
                
              ),





             pw.Row(
              
              children: [


              
              pw.Container(

                 decoration: const pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.only(
                            topRight: pw.Radius.circular(10.0),
                            topLeft: pw.Radius.circular(10.0),
                            bottomLeft: pw.Radius.circular(10.0),
                            bottomRight: pw.Radius.circular(10.0)),
                        color: PdfColors.blue500,
                      ),
                
                
                
                child: pw.Padding(padding: pw.EdgeInsets.all(10), child: pw.Text("TK.", style: pw.TextStyle(fontSize: 14, color: PdfColors.white, font: ttf)))),

              

              pw.SizedBox(width: 5,),


               pw.Container(

                 decoration: const pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.only(
                            topRight: pw.Radius.circular(10.0),
                            topLeft: pw.Radius.circular(10.0),
                            bottomLeft: pw.Radius.circular(10.0),
                            bottomRight: pw.Radius.circular(10.0)),
                        color: PdfColors.blue500,
                      ),
                
                
                
                child: pw.Padding(padding: pw.EdgeInsets.all(10), child: pw.Text("12000", style: pw.TextStyle(fontSize: 14, color: PdfColors.white, font: ttf)))),




             ]),
        
         







                 pw.SizedBox(
                      height: 70,
                      
                
              ),





            pw.Row(

              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              
              
              
              children: [

                  pw.Padding(padding: pw.EdgeInsets.only(left: 10,top: 30, right: 10),child: pw.Column(children: [

                    pw.Text("___________________________"),

                    pw.Text("DEPOSITED BY",style:pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, font: ttf)),


                  ]),),



             







                  pw.Padding(padding: pw.EdgeInsets.only(right: 10,top: 30),child: pw.Column(children: [

                    pw.Text("_____________________________"),

                    pw.Text("AUTHORISED SIGNATURE",style:pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, font: ttf)),


                  ]),),



              ]),







        ])); // Center
      }));



return pdf.save();
}