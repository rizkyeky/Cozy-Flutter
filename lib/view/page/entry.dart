part of 'page.dart';

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/img/logo.png',
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(height: 24,),
                  Text('Find Cozy House\nto Stay and Happy', 
                    style: headline,
                  ),
                  const SizedBox(height: 12,),
                  Text('Stop membuang banyak waktu\npada tempat yang tidak habitable', 
                    style: subheadline,
                  ),
                  const SizedBox(height: 36,),
                  FlatButton(
                    color: palettes['primary'],
                    onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(
                      builder: (_) => HomePage()
                    )),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12), 
                    child: const Text('Explore Now', style: mainbutton,)
                  ),
                  const SizedBox(height: 24,),
                ],
              ),
            ),
            Expanded(
              child: CustomPaint(
                size: MediaQuery.of(context).size,
                painter: EntryBackgroundPainter(),
                child: Image.asset('assets/img/splash_image.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.centerRight,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EntryBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = palettes['accent'] ?? Colors.amber
      ..style = PaintingStyle.fill;

    final rect = Rect.fromLTWH(0, 100, size.width, size.height*0.8);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}