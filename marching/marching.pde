//   __  __                _     _             
//  |  \/  | __ _ _ __ ___| |__ (_)_ __   __ _ 
//  | |\/| |/ _` | '__/ __| '_ \| | '_ \ / _` |
//  | |  | | (_| | | | (__| | | | | | | | (_| |
//  |_|  |_|\__,_|_|  \___|_| |_|_|_| |_|\__, |
//                                       |___/ 
//   ____                                  
//  / ___|  __ _ _   _  __ _ _ __ ___  ___ 
//  \___ \ / _` | | | |/ _` | '__/ _ \/ __|
//   ___) | (_| | |_| | (_| | | |  __/\__ \
//  |____/ \__, |\__,_|\__,_|_|  \___||___/
//            |_|                          
//
// The main file for implementing/visualizing the marching squares algorithm
// https://github.com/Maharshi-Pandya/Marching-Squares

int totalFrames = 120;

// the "resolution" of the world and corresponding rows and cols
int nReso = 10;
int nRows, nCols;

// the "grid" containing the color values of the "dots"
float[][] nColorGrid;

// The line configs corresponding to the "values" of the 
// "dot square" under consideration
LineUtil[] configs;

// fill the grid with perlin noise values for each "dot"
float xoff, yoff, start=0.f;
float inc = 0.05f;
float zoff = 0.f, zinc = 0.01f;
void populateColorGrid() {
  // infinite flying illusion
  yoff = start;
  for (int y=0; y<nRows; y++) {
    yoff += inc;
    xoff = 0.f;    // for every yoff, xoff starts at 0
    for (int x=0; x<nCols; x++) { 
      // use Perlin Noise to generate smooth random values
      // so as to make the contour smoother
      float cColor = (noise(xoff, yoff, zoff));
      nColorGrid[x][y] = cColor;
      xoff += inc;
    }
  }
  zoff += zinc;
  // // uncomment to travel through noise space in time
  // start -= 0.05f;
}
// Populate the configs array with all the local line coordinates
void populateConfigs() {
  // the total number configurations for marching squares
  // will be 2^4 = 16.
  configs = new LineUtil[16];
  //x1  //y2 //x2 //y2 //x3 //y3 //x4 //y4
  configs[0] = new LineUtil(0.f, 0.f, 0.f, 0.f);
  configs[1] = new LineUtil(0.f, 0.5f, 0.5f, 1.f);
  configs[2] = new LineUtil(1.f, 0.5f, 0.5f, 1.f);
  configs[3] = new LineUtil(0.f, 0.5f, 1.f, 0.5f);
  configs[4] = new LineUtil(0.5f, 0.f, 1.f, 0.5f);
  configs[5] = new LineUtil(0.5f, 0.f, 0.f, 0.5f, 1.f, 0.5f, 0.5f, 1.f);
  configs[6] = new LineUtil(0.5f, 0.f, 0.5f, 1.f);
  configs[7] = new LineUtil(0.5f, 0.f, 0.f, 0.5f);
  configs[8] = new LineUtil(0.5f, 0.f, 0.f, 0.5f);
  configs[9] = new LineUtil(0.5f, 0.f, 0.5f, 1.f);
  configs[10] = new LineUtil(0.5f, 0.f, 1.f, 0.5f, 0.5f, 1.f, 0.f, 0.5f);
  configs[11] = new LineUtil(0.5f, 0.f, 1.f, 0.5f);
  configs[12] = new LineUtil(0.f, 0.5f, 1.f, 0.5f);
  configs[13] = new LineUtil(1.f, 0.5f, 0.5f, 1.f);
  configs[14] = new LineUtil(0.f, 0.5f, 0.5f, 1.f);
  configs[15] = new LineUtil(0.f, 0.f, 0.f, 0.f);
}
// construct the "value" of the square under consideration using
// the color of each of the 4 "dots" as a bit and draw the contour
int value = 0;
void binToContour() {
  for (int y=0; y<nRows-1; y++) {
    for (int x=0; x<nCols-1; x++) { 
      // for each square value starts at 0.
      value = 0;
      // get the msb to lsb clockwise
      int msb = nColorGrid[x][y] < 0.5f ? 0 : 1;
      int b1 = nColorGrid[x+1][y] < 0.5f ? 0 : 1;
      int b2 = nColorGrid[x+1][y+1] < 0.5f ? 0 : 1;
      int lsb = nColorGrid[x][y+1] < 0.5f ? 0 : 1;
      // set the bit in the value accordingly
      value |= (msb << 3);
      value |= (b1 << 2);
      value |= (b2 << 1);
      value |= lsb;
      // draw the lines
      configs[value].showLines(x, y);
    }
  }
}
// inits
void setup() {
  size(1200, 800);
  // init rows and cols
  nCols = width/nReso;
  nRows = height/nReso;
  // init colorGrid and configs
  nColorGrid = new float[nCols][nRows];
  populateConfigs();
}
// the drawing loop
void draw() {
  // ...
  render();
}
void render(){
  background(30);
  // color the colorGrid every frame using Perlin Noise
  populateColorGrid();
  binToContour();
  // draw the colorGrid
  translate(nReso/2, nReso/2);
  for (int y=0; y<nRows; y++) {
    for (int x=0; x<nCols; x++) {
      fill(0, nColorGrid[x][y] * 255, 0);
      noStroke();
      ellipse(x*nReso, y*nReso, 4, 4);
    }
  }
}
