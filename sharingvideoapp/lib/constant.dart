enum MenuState { home, search, add, message,profile}

const List<double> SUMMER = [
  1, 0, -0.4, 0, 0,
  0, 1, 0, 0, 0,
  -1.3, 0.4, 1, 0, 0,
  1.7, 0.7, 1.1, 1, 0];
const List<double> BLACKWHITE = [
  0, 1, 0, 0, 0,
  0, 1, 0, 0, 0,
  0, 1, 0, 0, 0,
  0, 1, 0, 1, 0];
const List<double> OLDTIMES = [
  1, 0, 0, 0, 0,
  -0.4, 1.3, -0.4, 0.2, -0.1,
  0, 0, 1, 0, 0,
  0, 0, 0, 1, 0,];
// ColorFiltered(
// colorFilter: ColorFilter.matrix([
// 0.2126, 0.7152, 0.0722, 0, 0,
// 0.2126, 0.7152, 0.0722, 0, 0,
// 0.2126, 0.7152, 0.0722, 0, 0,
// 0,      0,      0,      1, 0,]),
// child: