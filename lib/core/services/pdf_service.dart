import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfService {
  Future<void> generateMonthlyReport() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
              child: pw.Column(children: [
            pw.Text('Antigravity Finance',
                style: const pw.TextStyle(fontSize: 40)),
            pw.SizedBox(height: 20),
            pw.Text('Monthly Expense Report',
                style: const pw.TextStyle(fontSize: 24)),
            pw.SizedBox(height: 20),
            pw.Text('Total Spent: \$1,240.00'),
            pw.Text('Top Category: Food & Dining'),
          ]));
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
