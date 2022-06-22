import 'package:flutter/material.dart';
import 'src/proxy_ffi.dart';
import 'src/c_strings.dart';
import 'src/generated.dart';
import 'package:web_ffi/web_ffi_modules.dart';

Future<String> testFFI() async {
    await initFfi();
    DynamicLibrary dynLib = openAlgorithm();
    FunctionsAndGlobals algorithm = FunctionsAndGlobals(dynLib);
    String version = fromCString(algorithm.get_version());

    Pointer<Double>? p = Memory.global?.allocate<Double>(16);
    p![0] = 471.20001220703125;
    p[1] = 258.6000061035156;
    p[2] = 672.2666625976562;
    p[3] = 398.3333435058594;
    p[4] = 504.5333251953125;
    p[5] = 676.7333374023438;
    p[6] = 370.3999938964844;
    p[7] = 781;

    p[8] = 611.2000732421875;
    p[9] = 186.59999084472656;
    p[10] = 498.13338216145837;
    p[11] = 418.60000101725257;
    p[12] = 612.8000284830729;
    p[13] = 757.000010172526;
    p[14] = 698.4000244140625;
    p[15] = 868.2000122070312;

    Pointer<Double> intersections = algorithm.bezier_intersect(p);
    int index = 0;

    while(intersections.elementAt(index).value > -1.0)
    {
      var x = intersections.elementAt(index).value;
      var y = intersections.elementAt(index+1).value;
      print('x==> $x y ===> $y');
      index = index + 2;
    }
    Memory.global?.free(p);

    algorithm.free_pointer(Pointer<Void>.fromAddress(intersections.address));
    return version;
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String version = await testFFI();
  runApp(MyApp(version));
}

class MyApp extends StatelessWidget {
  final String _opusVersion;

  const MyApp(this._opusVersion);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'web_ffi Demo',
      home: Scaffold(
          appBar: AppBar(
            title: Text('web_ffi Demo'),
            centerTitle: true,
          ),
          body: Container(
            alignment: Alignment.center,
            child: Text(_opusVersion),
          )),
    );
  }
}
