class Leaf { //<>//
  int MIN_LEAF_SIZE = (int) random(1, 10)*20;
  int x, y, w, h;

  color myColor = (int)random(255);

  Leaf childA;
  Leaf childB;
  Leaf parent;


  boolean endGrowth = false;
  boolean splitVertical;

  Leaf(int x, int y, int w, int h, Leaf parent) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    this.parent = parent;


    if (random(1)<.05) {
      endGrowth = true;
    } else {
      endGrowth = false;
    }
  }

  boolean split() {
    if (childA != null && childB != null) {
      return false;
    }

    splitVertical = random(1)>.5; 

    int max;
    if (splitVertical) {
      max = h - MIN_LEAF_SIZE;
    } else {
      max = w - MIN_LEAF_SIZE;
    }

    if (max <= MIN_LEAF_SIZE) {
      return false; // the area is too small to split any more...
    }



    float numModuls = max/MIN_LEAF_SIZE;

    // int splitPortion = (int)random(MIN_LEAF_SIZE, max);
    int splitPortion = (int)(random(1, numModuls)*MIN_LEAF_SIZE);

      if (splitVertical) {
        childA = new Leaf(x, y, w, splitPortion, this);
        childB = new Leaf(x, y + splitPortion, w, h - splitPortion, this);
      } else {
        childA = new Leaf(x, y, splitPortion, h, this);
        childB = new Leaf(x + splitPortion, y, w - splitPortion, h, this);
      }
      return true;
   
      
    
  }

  boolean isEnd() {

    if ((childA == null && childB == null)) {
      return true;
    } else {
      return false;
    }
  }

  void show() {
    rect(x, y, w, h);
  }
}
