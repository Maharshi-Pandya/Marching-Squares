// The utils which will help to implement/visualize the algorithm
class LineUtil {
  // determines if the lines to be drawn are of value 5 or 10
  boolean isFiveTen;
  PVector coord1, coord2;
  PVector coord3, coord4;

  LineUtil(float x1, float y1, float x2, float y2) {
    coord1 = new PVector(x1, y1);
    coord2 = new PVector(x2, y2);
    isFiveTen = false;
  }
  // overload for 5/10 values
  LineUtil(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    coord1 = new PVector(x1, y1);
    coord2 = new PVector(x2, y2);
    coord3 = new PVector(x3, y3);
    coord4 = new PVector(x4, y4);
    isFiveTen = true;
  }
  // draw the lines
  void showLines() {
    line(coord1.x, coord1.y, coord2.x, coord2.y);
    // when the values are 5/10, there will be two lines drawn
    if (isFiveTen) {
      line(coord3.x, coord3.y, coord4.x, coord4.y);
    }
  }
}
