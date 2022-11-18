
#include <Servo.h> // Thư viện điều khiển servo
Servo myservo;// giao thong o pho di bo
int red1=7,yellow1=2,green1=3;
int red2=4,yellow2=5,green2=6;
int quangtro = A5;
int servoPin = 9;
int pos = 0;

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  myservo.attach(servoPin); 

  pinMode(red1, OUTPUT);
  pinMode(red2, OUTPUT);
  pinMode(yellow1, OUTPUT);
  pinMode(yellow2, OUTPUT);
  pinMode(green2, OUTPUT);
  pinMode(green1, OUTPUT);
  Serial.begin(9600);

}

// the loop function runs over and over again forever
void loop() {
   int value =0;  

  int gtquangtro = analogRead(quangtro);// đọc giá trị quang trở
    Serial.println(gtquangtro);
    // bat den khi troi sang
  if(gtquangtro<1000){
    fenceopen();
    changelight();
  }
  else {
      fenceclose();
  }
  delay(7000);
}
void in(){
  
}
void fenceopen(){
  if(pos!=180){
    for(pos=0; pos < 180; pos += 1){ 

        myservo.write(pos);
        delay(15);
    }
  }else{}
  
  
}
void fenceclose(){
    if(pos != 0){
      for(pos;  pos>=1; pos -= 1){ 

        myservo.write(pos);
        delay(15);
      }
    }
    else{}
    
  
  
}



void changelight(){
  // bat 2 den vang
  digitalWrite(yellow1,LOW );
  digitalWrite(yellow2,LOW);
  digitalWrite(red2,LOW);
    digitalWrite(red1,LOW);
  digitalWrite(yellow1,HIGH);
  digitalWrite(yellow2,HIGH);
  delay(5000);

  // tat den vang bat den xanh2 va do1
  digitalWrite(yellow1,LOW );
  digitalWrite(yellow2,LOW);
  digitalWrite(red1,HIGH);
  digitalWrite(green2,HIGH);
  delay(5000);

  // bat 2 den vang
  digitalWrite(red1,LOW);
  digitalWrite(green2,LOW);
  digitalWrite(yellow1,HIGH);
  digitalWrite(yellow2,HIGH);
  delay(5000);

  // tat 2 den vang , bat xanh 1 red 2
  digitalWrite(yellow1,LOW );
  digitalWrite(yellow2,LOW);
  digitalWrite(red2,HIGH);
  digitalWrite(green1,HIGH);
  delay(5000);
  digitalWrite(red2,LOW);
  digitalWrite(green1,LOW);
}
