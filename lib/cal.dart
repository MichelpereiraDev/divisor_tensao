import 'package:divisor_tensao/divisor.dart';

final tensao = Tensao();

class Calcu extends tensaoState {
  calcula() {
    double vinResul, resoneResul, restwoResul, voutResul;
    double vin = double.tryParse(vInController.text);

    double resistorone = double.tryParse(resOneController.text);
    double resistortwo = double.tryParse(resTwoController.text);
    double vout = double.tryParse(vOutController.text);

    if (vin == null) {
      vinResul = (vout * ((resistorone + resistortwo) / resistortwo));

      vInController.text = "${vinResul.toStringAsPrecision(3)}v";
    } else if (resistorone == null) {
      resoneResul = (((vin * resistortwo) / vout) - resistortwo);

      resOneController.text = "${resoneResul.toStringAsPrecision(3)}ohms";
    } else if (resistortwo == null) {
      restwoResul = ((vout * resistorone) / (vin - vout));

      resTwoController.text = "${restwoResul.toStringAsPrecision(4)}ohms";
    } else if (vout == null) {
      voutResul = ((resistortwo / (resistorone + resistortwo)) * vin);
      vOutController.text = "${voutResul.toStringAsPrecision(3)}v";
    }
  }
}
