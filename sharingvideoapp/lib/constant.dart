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

// const List<List<double>> visual = [SUMMER, BLACKWHITE, OLDTIMES];
// const List<List<double>> transition = [SUMMER, BLACKWHITE];
// const List<List<double>> split = [SUMMER];
const Map filterlist={
  'Visual': [SUMMER, BLACKWHITE, OLDTIMES],
  'Transition':  [SUMMER, BLACKWHITE],
 ' Split': [SUMMER],
};
// ColorFiltered(
// colorFilter: ColorFilter.matrix([
// 0.2126, 0.7152, 0.0722, 0, 0,
// 0.2126, 0.7152, 0.0722, 0, 0,
// 0.2126, 0.7152, 0.0722, 0, 0,
// 0,      0,      0,      1, 0,]),
// child:
