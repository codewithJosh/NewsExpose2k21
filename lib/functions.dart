import 'package:adobe_xd/adobe_xd.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_expose_2k21/login_screen.dart';
import 'package:news_expose_2k21/register_screen.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

const colorChineseBlack = Color(0xff151515);
const colorFulvous = Color(0xffE57608);
const colorPhilippineOrange = Color(0xffFF7000);
const colorPrincetonOrange = Color(0xffF2822A);
const colorWillpowerOrange = Color(0xffFC5700);
const colorChineseSilver = Color(0xffCCCCCC);
const colorKUCrimson = Color(0xffE50913);
const colorEerieBlack = Color(0xff1D1D1D);
const colorElectricGreen = Color(0xff00FF00);
const colorRaisinBlack = Color(0xff262626);

const linearButton = LinearGradient(
  begin: Alignment(0.0, -1.0),
  end: Alignment(0.0, 1.0),
  colors: [
    colorPhilippineOrange,
    colorPrincetonOrange,
  ],
  stops: [0.0, 1.0],
);

const linearAppBar = LinearGradient(
  begin: Alignment(0.0, -1.0),
  end: Alignment(0.0, 1.0),
  colors: [
    colorEerieBlack,
    colorRaisinBlack,
  ],
  stops: [0.0, 1.0],
);

const createChineseBlackDecoration =
    '<svg viewBox="44.0 -54.0 272.0 329.0" ><path transform="translate(-386.0, -54.0)" d="M 430.0415344238281 202.4214477539063 L 430.0002136230469 202.4214477539063 L 430.0002136230469 199.1912841796875 L 430.0002136230469 0 L 702 0 L 702 202.4214477539063 L 701.9586791992188 202.4214477539063 C 700.160888671875 272.6188659667969 639.9781494140625 328.9996948242188 566.0001220703125 328.9996948242188 C 492.0211791992188 328.9996948242188 431.8392944335938 272.6188659667969 430.0415344238281 202.4214477539063 Z" fill="#151515" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const createChineseBlackDecoration1 =
    '<svg viewBox="0.0 336.0 360.0 847.0" ><path transform="translate(-644.0, 313.0)" d="M 644.0004272460938 870.0000610351563 L 644.0004272460938 81.43687438964844 C 698.087646484375 44.09025573730469 759.4588012695313 23.00040245056152 824.4999389648438 23.00040245056152 C 889.14208984375 23.00040245056152 950.1563720703125 43.83037567138672 1004.000427246094 80.74948120117188 L 1004.000427246094 870.0000610351563 L 644.0004272460938 870.0000610351563 Z" fill="#3c3c3c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const createLine =
    '<svg viewBox="22.5 327.5 1.0 91.0" ><path transform="translate(22.5, 327.5)" d="M 0 0 L 0 91" fill="none" stroke="#ffffff" stroke-width="5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const createLogo =
    '<svg viewBox="111.2 35.0 137.6 115.9" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ffe57709"  /><stop offset="1.0" stop-color="#ffff5400"  /></linearGradient></defs><path transform="translate(138.33, 35.0)" d="M 15.69064998626709 115.9499206542969 C 20.32205009460449 89.23610687255859 15.80901050567627 66.19276428222656 11.20749187469482 51.56584930419922 C 8.602261543273926 43.2846565246582 5.693727493286133 36.76549530029297 3.712469577789307 32.75484085083008 C 1.563138008117676 28.40383720397949 0.01543441228568554 25.99120712280273 0 25.96734809875488 C 0.3682273924350739 25.85771179199219 44.22358322143555 12.81397533416748 85.35112762451172 0 C 93.38047790527344 9.537745475769043 99.59098815917969 19.90725135803223 103.8110504150391 30.82075691223145 C 107.1872329711914 39.55185317993164 109.3042144775391 48.64895248413086 110.1032638549805 57.85937118530273 C 110.8141860961914 66.05392456054688 110.3283157348633 72.82278442382813 109.7955169677734 77.05815887451172 C 109.2177581787109 81.65169525146484 108.4632186889648 84.33293151855469 108.455680847168 84.35948181152344 L 108.3665771484375 84.39095306396484 C 100.5983123779297 87.10034942626953 31.99993324279785 111.0044403076172 15.69064998626709 115.9499053955078 L 15.69064998626709 115.9499206542969 Z M 104.8694686889648 71.69686889648438 L 104.8694229125977 71.69688415527344 L 25.69147682189941 96.16078186035156 L 26.65670967102051 99.67622375488281 L 104.593132019043 76.19612884521484 L 104.8694686889648 71.69688415527344 L 104.8694686889648 71.69686889648438 Z M 105.0075302124023 63.11991500854492 L 25.69152069091797 86.81986999511719 L 26.7948112487793 90.67771148681641 L 105.0074844360352 68.04149627685547 L 105.0074844360352 63.11992645263672 L 105.0075302124023 63.11991500854492 Z M 13.75080490112305 34.27140426635742 L 13.75084972381592 34.27146148681641 C 13.78458976745605 34.37199020385742 17.21663856506348 44.62934112548828 20.36750030517578 55.49290084838867 C 22.23201370239258 61.92133712768555 23.65238380432129 67.3538818359375 24.58908271789551 71.63961791992188 C 25.76003265380859 76.99674224853516 26.17429542541504 80.56665802001953 25.82024574279785 82.25022125244141 C 30.75014877319336 80.51783752441406 32.18599700927734 79.62310028076172 32.19990539550781 79.6142578125 L 22.54429244995117 46.22223663330078 L 61.16805648803711 70.82694244384766 L 46.85618209838867 23.02293395996094 L 40.8219108581543 25.4841136932373 L 53.2365608215332 60.28229522705078 L 13.75084972381592 34.27144622802734 L 13.75080490112305 34.27140426635742 Z M 83.4105224609375 10.19348049163818 L 56.51251602172852 19.33274459838867 L 73.41046142578125 66.78482055664063 L 104.447265625 57.99747848510742 L 103.4121780395508 53.07590866088867 L 78.75507354736328 59.57922744750977 L 71.85867309570313 41.47704315185547 L 94.96327209472656 34.79816436767578 L 92.7215576171875 29.87738418579102 L 69.78933715820313 36.73183441162109 L 63.92641830444336 22.32064247131348 L 86.16973876953125 15.81733894348145 L 83.4105224609375 10.19348049163818 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ffff7000"  /><stop offset="1.0" stop-color="#ffb15106"  /></linearGradient></defs><path transform="translate(763.93, -12.74)" d="M -641.9000244140625 100.7692260742188 C -641.9000244140625 100.7692260742188 -627.0713500976563 110.918701171875 -614.1393432617188 157.2284088134766 C -610.6907958984375 110.8308258056641 -622.243408203125 91.85000610351563 -622.243408203125 91.85000610351563 L -641.9000244140625 100.7692260742188 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ffff7000"  /><stop offset="1.0" stop-color="#ffb15106"  /></linearGradient></defs><path transform="translate(765.66, -15.49)" d="M -641.7335205078125 114.5499877929688 C -641.7335205078125 114.5499877929688 -625.8702392578125 132.4763336181641 -621.38720703125 160.0688323974609 C -644.1043701171875 126.5008850097656 -654.449951171875 124.7433929443359 -654.449951171875 124.7433929443359 L -641.7335205078125 114.5499877929688 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const createLogoUIButton =
    '<svg xmlns="http://www.w3.org/2000/svg"  width="51.574" height="42.95" viewBox="0 0 51.574 42.95"><defs><linearGradient id="linear-gradient" x1="0.5" x2="0.5" y2="1" gradientUnits="objectBoundingBox"><stop offset="0" stop-color="#e57709"/><stop offset="1" stop-color="#ff5400"/></linearGradient><linearGradient id="linear-gradient-2" x1="0.5" x2="0.5" y2="1" gradientUnits="objectBoundingBox"><stop offset="0" stop-color="#ff7000"/><stop offset="1" stop-color="#b15106"/></linearGradient></defs><g id="Group_19" data-name="Group 19" transform="translate(-25 -16.025)"><path id="Exclusion_1" data-name="Exclusion 1" d="M5.882,42.95A50.418,50.418,0,0,0,4.2,19.1a49.085,49.085,0,0,0-2.81-6.968A28.2,28.2,0,0,0,0,9.619C.138,9.578,16.579,4.747,32,0a40.263,40.263,0,0,1,6.92,11.417,36.156,36.156,0,0,1,2.359,10.016,33.7,33.7,0,0,1-.115,7.112,20.076,20.076,0,0,1-.5,2.7l-.033.012c-2.912,1-28.628,9.858-34.742,11.69ZM39.314,26.558h0L9.631,35.62l.362,1.3,29.217-8.7.1-1.667Zm.052-3.177L9.631,32.16l.414,1.429L39.365,25.2V23.381ZM5.155,12.695h0c.013.037,1.3,3.837,2.48,7.861.7,2.381,1.231,4.394,1.583,5.981a11.927,11.927,0,0,1,.462,3.93,14.38,14.38,0,0,0,2.392-.976L8.451,17.122l14.479,9.114L17.565,8.528,15.3,9.44l4.654,12.89-14.8-9.635ZM31.269,3.776,21.185,7.161,27.52,24.738l11.635-3.255-.388-1.823-9.243,2.409-2.585-6.705L35.6,12.89l-.84-1.823-8.6,2.539-2.2-5.338L32.3,5.859Z" transform="translate(35.165 16.025)" fill="url(#linear-gradient)"/><path id="tail2" d="M-641.9,95.154s5.559,3.76,10.407,20.913c1.293-17.186-3.038-24.217-3.038-24.217Z" transform="translate(670.956 -59.485)" fill="url(#linear-gradient-2)"/><path id="tail3" d="M-649.683,114.55a36.272,36.272,0,0,1,7.628,16.861c-8.516-12.434-12.395-13.085-12.395-13.085Z" transform="translate(679.45 -74.796)" fill="url(#linear-gradient-2)"/></g></svg>';
const createDrawerUIButton =
    '<svg xmlns="http://www.w3.org/2000/svg" width="41" height="30" viewBox="0 0 41 30"> <g id="Group_18" data-name="Group 18" transform="translate(-297 -22.5)"> <line id="Line_5" data-name="Line 5" x2="35" transform="translate(300 25.5)" fill="none" stroke="#e87207" stroke-linecap="round" stroke-width="6"/> <line id="Line_5-2" data-name="Line 5" x2="35" transform="translate(300 37.5)" fill="none" stroke="#f16604" stroke-linecap="round" stroke-width="6"/> <line id="Line_5-3" data-name="Line 5" x2="35" transform="translate(300 49.5)" fill="none" stroke="#f56003" stroke-linecap="round" stroke-width="6"/></g></svg>';
const createCreateUpdateUIButton =
    '<svg xmlns="http://www.w3.org/2000/svg" width="246" height="246" viewBox="0 0 246 246"><defs><linearGradient id="linear-gradient" x1="0.5" x2="0.5" y2="1" gradientUnits="objectBoundingBox"><stop offset="0" stop-color="#e57709"/><stop offset="1" stop-color="#ff5400"/></linearGradient></defs><g id="Group_20" data-name="Group 20" transform="translate(-52 -57)"><circle id="Ellipse_12" data-name="Ellipse 12" cx="123" cy="123" r="123" transform="translate(52 57)" fill="url(#linear-gradient)"/><g id="Group_18" data-name="Group 18" transform="translate(-25 -201)"><path id="Path_15" data-name="Path 15" d="M1280.2,383.04l-20.16,33.28,16.32,9.76s14.72,1.76,21.76-8.32,1.44-22.72,0-23.04S1280.2,383.04,1280.2,383.04Z" transform="translate(-1040)" fill="#1d1d1d"/><path id="Path_16" data-name="Path 16" d="M1275.4,384c-.8,2.08-18.08,30.24-18.08,30.24h-60.8s-4.32-1.12-1.6-5.6,45.92-78.4,45.92-78.4,3.52-4.64,6.08,0,27.2,48,27.2,48S1276.2,381.92,1275.4,384Z" transform="translate(-1040)" fill="#1d1d1d"/><path id="Path_17" data-name="Path 17" d="M1221.48,357.36l-12.64,21.28-5.28-3.52s-2.24-1.76,0-4.64,9.28-14.72,9.28-14.72a2.96,2.96,0,0,1,4-.96C1219.24,356.24,1221.48,357.36,1221.48,357.36Z" transform="translate(-1040)" fill="#1d1d1d"/><path id="Path_18" data-name="Path 18" d="M1163.6,375.783h17.8s2.733,1.067,2.667,3.333-3.067,2.267-3.067,2.267h-17.4a2.5,2.5,0,0,1-2.4-2.667A2.857,2.857,0,0,1,1163.6,375.783Z" transform="translate(-1040)" fill="#1d1d1d"/><path id="Path_19" data-name="Path 19" d="M1163.6,375.783h17.8s2.733,1.067,2.667,3.333-3.067,2.267-3.067,2.267h-17.4a2.5,2.5,0,0,1-2.4-2.667A2.857,2.857,0,0,1,1163.6,375.783Z" transform="matrix(0.839, 0.545, -0.545, 0.839, -629.628, -603.586)" fill="#1d1d1d"/><path id="Path_20" data-name="Path 20" d="M1163.6,375.783h17.8s2.733,1.067,2.667,3.333-3.067,2.267-3.067,2.267h-17.4a2.5,2.5,0,0,1-2.4-2.667A2.857,2.857,0,0,1,1163.6,375.783Z" transform="matrix(0.545, 0.839, -0.839, 0.545, -157.521, -863.062)" fill="#1d1d1d"/></g><path id="Path_14" data-name="Path 14" d="M1250.92,418.96s.64-3.36,4.32-1.12,12.96,6.72,12.96,6.72a19.066,19.066,0,0,1,0,6.08c-.48,4.16-1.6,17.44-1.6,17.44s0,5.6-3.84,3.52-11.84-7.68-11.84-7.68-2.24.96-1.6-5.28S1250.92,418.96,1250.92,418.96Z" transform="translate(-1065 -201)" fill="#1d1d1d"/></g></svg>';

final userId = firebaseAuth.currentUser!.uid;

final firebaseAuth = FirebaseAuth.instance;
final firebaseFirestore = FirebaseFirestore.instance;

final users = firebaseFirestore.collection('Users');

initMain(final context) {
  final width = MediaQuery.of(context).size.width;
  return Stack(
    children: <Widget>[
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('res/images/img_background.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(start: 0.0, end: 0.0),
        Pin(size: 329.0, start: -29.0),
        child: Stack(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 44.0),
              width: width,
              child: BlendMask(
                blendMode: BlendMode.overlay,
                child: SvgPicture.string(
                  createChineseBlackDecoration,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            initLogo(),
          ],
        ),
      ),
      Pinned.fromPins(
        Pin(start: 0.0, end: 0.0),
        Pin(size: 847.0, end: -423.0),
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: width,
              child: BlendMask(
                blendMode: BlendMode.overlay,
                child: SvgPicture.string(
                  createChineseBlackDecoration1,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 110.0, start: 60.0),
              child: Container(
                margin: const EdgeInsets.only(left: 22.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SvgPicture.string(
                      createLine,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      width: 9.5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'YOUR DAILY',
                          style: TextStyle(
                            fontFamily: 'Tahoma',
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'NEWS UPDATE',
                          style: TextStyle(
                            fontSize: 40,
                            color: colorFulvous,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

initLogo() => Center(
      child: SizedBox(
        height: 170.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.string(
              createLogo,
              allowDrawingOutsideViewBox: true,
            ),
            const Text(
              'NEWS EXPOSÉ',
              style: TextStyle(
                fontFamily: 'Tahoma',
                fontSize: 15,
                color: colorWillpowerOrange,
                letterSpacing: 6,
              ),
            ),
          ],
        ),
      ),
    );

initBackground() => Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('res/images/img_background_1.png'),
          fit: BoxFit.cover,
        ),
      ),
    );

initTitle(final text) => Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.all(20.0),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Calibri',
          fontSize: 30,
          color: colorFulvous,
          fontWeight: FontWeight.w700,
        ),
      ),
    );

initInputDecoration(final hintText) => InputDecoration(
      border: InputBorder.none,
      hintText: hintText,
      hintStyle: const TextStyle(
          color: colorChineseSilver, fontStyle: FontStyle.italic),
      filled: true,
      fillColor: colorChineseBlack.withOpacity(0.75),
      contentPadding: const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: colorFulvous),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: colorKUCrimson),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: colorKUCrimson),
      ),
    );

initLabel(final label) => Text(
      label,
      style: const TextStyle(
        fontFamily: 'Calibri',
        fontSize: 25,
        color: Colors.white,
      ),
    );

initTextButton(final context, final firstText, final lastText, final width) =>
    SizedBox(
      width: width,
      child: GestureDetector(
        onTap: () => lastText.contains('Sign Up')
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()))
            : Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen())),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              firstText,
              style: const TextStyle(
                fontFamily: 'Tahoma',
                fontStyle: FontStyle.italic,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            Text(
              lastText,
              style: const TextStyle(
                fontFamily: 'Tahoma',
                fontStyle: FontStyle.italic,
                fontSize: 15,
                color: colorFulvous,
              ),
            ),
          ],
        ),
      ),
    );

onFocusChange(final formKey) async {
  formKey.currentState.save();
  formKey.currentState.validate();
}

late ProgressDialog buildProgressDialog;

initProgressDialog(final context, final message) async {
  buildProgressDialog =
      ProgressDialog(await context, type: ProgressDialogType.normal);
  buildProgressDialog.style(
      message: message,
      borderRadius: 10.0,
      backgroundColor: colorEerieBlack,
      progressWidget: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(
          colorFulvous,
        ),
      ),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      messageTextStyle: const TextStyle(
          color: Colors.white, fontSize: 19.0, fontWeight: FontWeight.w600));
}

buildFlutterToast(final msg, final color, {isLong = false}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: colorChineseBlack,
        textColor: color,
        fontSize: 16.0);

initTitle1() => Row(
  children: const <Widget>[

    Text(
      'News',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontFamily: 'Tahoma',
      ),
    ),

    Text(
      'EXPOSÉ',
      style: TextStyle(
        fontSize: 22,
        color: colorFulvous,
        fontFamily: 'Tahoma',
      ),
    )
  ],
);

buildCircularProgress() => Container(
  alignment: Alignment.center,
  child: const SizedBox(
    height: 100.0,
    width: 100.0,
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
          colorPhilippineOrange
      ),
    ),
  ),
);