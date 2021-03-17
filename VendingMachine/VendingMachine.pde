/*
vending machine
6 candies
10 bags of chips
3 functions
one to buy candy
print updated status
one to buy chips
*/

class VendM
{
  float Pcandy;
  float Pchips;
  int caAmount;
  int chAmount;
  VendM()
  {
      Pcandy = 1.50;
      Pchips = 3.50;
      caAmount = 6;
      chAmount = 10;
  }
  void BuyChips()
  {
      if(chAmount != 0)
      {
          println("You have bought 1 Chips");
          chAmount --;
      }
  }
  void BuyCandy()
  {
      println("You have bought 1 Candy");
      caAmount --;
  }
  void Stock()
  {
     println("You have " + caAmount + " candy left and " + chAmount + " chips left.");
  }
}
VendM v;
void setup()
{
     v = new VendM();
     v.Stock();
     v.BuyCandy();
     v.BuyCandy();
     v.Stock();
}
