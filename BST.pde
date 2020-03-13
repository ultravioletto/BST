import java.util.*; //<>//

List<Leaf> leafs = new ArrayList<Leaf>();

List<Leaf> leafsEnds = new ArrayList<Leaf>();


int MAX_LEAF_SIZE = 20;



void setup() {

  size(800, 800);

  Leaf root = new Leaf(10, 10, width-20, height-20, null);
  leafs.add(root);

  boolean did_split = true;

  while (did_split)
  {
    did_split = false;

    ListIterator<Leaf> itr = leafs.listIterator();

    while (itr.hasNext()) {

      Leaf l = itr.next();

      if (l.childA == null && l.childB == null && !l.endGrowth) {
        if (l.w > MAX_LEAF_SIZE || l.h > MAX_LEAF_SIZE || random(1) > 0.01) {
          if (l.split()) {
            itr.add(l.childA);
            itr.add(l.childB);

            did_split = true;
          }
        }
      }
    }
  }
  println("LEAFS "+leafs.size());

  for (Leaf l : leafs) {
    if (l.isEnd()) {
      leafsEnds.add(l);
    }
  }
println("LEAFS ENDS "+leafsEnds.size());
  noFill();
  stroke(255);
}


void draw() {
  background(9);
  for (Leaf l : leafsEnds) {
    l.show();
  }
}


void mousePressed(){
 leafs.clear();
 leafsEnds.clear();
  println("LEAFS "+leafs.size());
  println("LEAFS ENDS "+leafsEnds.size());


setup();

}
