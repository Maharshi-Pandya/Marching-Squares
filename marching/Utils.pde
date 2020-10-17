// The utils which will help to implement/visualize the algorithm
class LineUtil {
  // determines if the lines to be drawn are of value 5 or 10
  boolean isFiveTen, toBeDrawn;
  PVector coord1, coord2;
  PVector coord3, coord4;

  LineUtil(float x1, float y1, float x2, float y2) {
    if (!(x1 == 0.f && y1 == 0.f && x2 == 0.f && y2 == 0.f)) {
      coord1 = new PVector(x1, y1);
      coord2 = new PVector(x2, y2);
      isFiveTen = false;
      toBeDrawn = true;
    } else {
      toBeDrawn = false;
    }
  }
  // overload for 5/10 values
  LineUtil(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    if (!(x1 == 0.f && y1 == 0.f && x2 == 0.f && y2 == 0.f && x3 == 0.f && y3 == 0.f && x4 == 0.f && y4 == 0.f)) {
      coord1 = new PVector(x1, y1);
      coord2 = new PVector(x2, y2);
      coord3 = new PVector(x3, y3);
      coord4 = new PVector(x4, y4);
      isFiveTen = true;
      toBeDrawn = true;
    } else {
      toBeDrawn = false;
    }
  }
  // draw the lines
  void showLines(float x, float y) {
    if (toBeDrawn) {
      stroke(0, 255, 0);
      line((x + coord1.x) * nReso, (y + coord1.y) * nReso, (x + coord2.x)*nReso, (y + coord2.y)*nReso);
      // when the values are 5/10, there will be two lines drawn
      if (isFiveTen) {
        line((x + coord3.x)*nReso, (y + coord3.y)*nReso, (x + coord4.x)*nReso, (y + coord4.y)*nReso);
      }
    }
  }
}
