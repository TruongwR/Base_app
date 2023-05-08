part of 'login_screen.dart';

Widget _contentContainer({Widget? icon, required String titel,Function()? acction}) {
  return InkWell(
    onTap: acction,
    child: Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: Palette.grayF6),
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? Container(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                titel,
                style: AppFont.t.s(16).black,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
