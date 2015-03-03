int swrow = 12; // swatches
ArrayList history = new ArrayList();
float distthresh = 600;
float opacity = 70;
color col = color(0, 120);
String path = "http://gordeychernyy.github.io/drawing/images/";
void setup() { 
  size(700,700);
  background(255);
  smooth();
  stroke(col, opacity);
}

void draw() {
}
void keyReleased() {

}
void keyPressed() {
  if (key == '1') colorChange(0);
  if (key == '2') colorChange(1);
  if (key == '3') colorChange(2);
  if (key == '4') colorChange(3);
  if (key == '-') erase();
  if (key == 's') saveImg(path+"img.jpg");
  if (keyCode == LEFT) palleteNext(); // right arrow
  if (keyCode == RIGHT) palletePrev(); // left arrow
}
void colorChange(int num){
  col = swatches[swrow][num];
}
void erase(){
    history.clear();
    background(255);
}
void saveImg(){
  save();
}
void palleteNext(){
  if(swrow<swatches.length-1)swrow++; 
}
void palletePrev(){
  if(swrow>0)swrow--;
}
void mouseReleased() {
  history.clear();
}

void mousePressed() {
  
}

void mouseMoved() {

}

void mouseDragged() {
  stroke(col, opacity);  
  PVector d = new PVector(mouseX, mouseY, 0);
  history.add(0, d); 
  noFill();
  for (int p=0; p<history.size (); p++) {
    PVector v = (PVector) history.get(p);
    float joinchance = p/history.size() + d.dist(v)/distthresh;
    if (joinchance < random(0.4)) {
      line(d.x, d.y, v.x, v.y);
    }
  }
  endDraw();
}
color[][] swatches = {
    {
        color(110,255,2),
        color(235,255,19),
        color(255,9,79),
        color(8,10,10)},
    {
        color(211,253,253),
        color(197,255,48),
        color(231,83,49),
        color(214,9,44)
    },
    {
        color(254,5,12),
        color(138,4,109),
        color(254,129,253),
        color(8,10,11)
    },
    {
        color(244,255,143),
        color(173,9,70),
        color(242,250,1),
        color(189,199,219)
    },
    {
        color(57,150,254),
        color(147,83,255),
        color(254,26,14),
        color(243,255,133)
    },
    {
        color(250,23,30),
        color(29,136,82),
        color(243,250,39),
        color(235,145,24)
    },
    {
        color(184,145,252),
        color(195,64,235),
        color(240,145,33),
        color(212,171,138)
    },
    {
        color(85,193,144),
        color(240,255,92),
        color(187,89,68),
        color(193,188,140)
    },
    {
        color(234,255,10),
        color(254,3,15),
        color(254,184,224),
        color(253,178,94)
    },
    {
        color(240,255,11),
        color(167,255,2),
        color(193,147,254),
        color(246,1,11)
    },
    {
        color(236,0,22),
        color(227,61,241),
        color(219,128,190),
        color(208,120,254)
    },
    {
        color(206,206,194),
        color(254,3,66),
        color(119,62,255),
        color(168,80,57)
    },
    {
        color(236,255,24),
        color(173,236,148),
        color(87,202,140),
        color(194,61,176)
    },
    
};

