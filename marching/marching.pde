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

// the "resolution" of the world and corresponding rows and cols
int nReso = 20;
int nRows, nCols;

// the "grid" containing the color values of the "dots"
int[][] nColorGrid;

// fill the grid with random black or white values for each "dot"
void populateColorGrid() {
  nColorGrid = new int[nCols][nRows];
  for (int y=0; y<nRows; y++) {
    for (int x=0; x<nCols; x++) { 
      int cColor = (int)random(255);
      // is the color black or white ?
      cColor = cColor < 127 ? 0 : 1;
      nColorGrid[x][y] = cColor;
    }
  }
}
// inits
void setup() {
  size(600, 600);
  // init rows and cols
  nCols = width/nReso;
  nRows = height/nReso;
  populateColorGrid();
}
// the drawing loop
void draw() {
  background(127);
  // draw the colorGrid
  translate(nReso/2, nReso/2);
  for (int y=0; y<nRows; y++) {
    for (int x=0; x<nCols; x++) {
      fill(nColorGrid[x][y] * 255);
      ellipse(x*nReso, y*nReso, 8, 8);
    }
  }
}
