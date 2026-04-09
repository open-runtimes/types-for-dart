import 'logger.dart';
import 'request.dart';
import 'response.dart';

class RuntimeContext {
  RuntimeRequest req;
  RuntimeResponse res;
  Logger logger;

  RuntimeContext(RuntimeRequest req, RuntimeResponse res, Logger logger)
    : req = req,
      res = res,
      logger = logger {}

  void log(dynamic message) {
    this.logger.write(message, Logger.TYPE_LOG);
  }

  void error(dynamic message) {
    this.logger.write(message, Logger.TYPE_ERROR);
  }
}
