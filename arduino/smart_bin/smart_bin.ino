#include <ESP8266WiFi.h>
#include <dht11.h>

// DEFINE PINS NUMBERS
const int greenLedPin = 5;
const int orangeLedPin = 6;
const int redLedPin = 7;
const int trigPin = 9;
const int echoPin = 10;

// DEFINE VARIABLES
long duration; 
int distance;
int garbage;

const char *binId = "COR001";  // Identifiant de la corbeille
// Nom et Mot de passe du wifi
const char *ssid = "wifi";
const char *password = "password";

// Adresse de l'application web
const char *host = "http://web.local";

void setup() {
  Serial.begin(115200);
  Serial.println("Started");
  delay(10);
  
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(greenLedPin, OUTPUT);
  pinMode(orangeLedPin, OUTPUT);
  pinMode(redLedPin, OUTPUT);

  // Connexion au WiFi
  Serial.println();
  Serial.println();
  Serial.println("Connexion à ");
  Serial.println(ssid);
  while(WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connecté");
  Serial.println("Adresse IP: ");
  Serial.println(WiFi.localIp();
}
void loop() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);

  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  // Calcul de la distance
  duration = pulseIn(schoPin, HIGH);
  distance = (duration / 2) / 29.1;

  if (distance <= 15) { // Si la distance <= 15 cm, Alerte Rouge
    digitalWrite(redLedPin, HIGH);
    digitalWrite(orangeLedPin, LOW);
    digitalWrite(greenLedPin, LOW);
  } else if (distance <= 25) {  // Si la distance entre 15 cm et 25 cm, Alerte Orange
    digitalWrite(redLedPin, LOW);
    digitalWrite(orangeLedPin, HIGH);
    digitalWrite(greenLedPin, LOW);
  } else { // Si la distance > 25 cm, Alerte Vert
    digitalWrite(redLedPin, LOW);
    digitalWrite(orangeLedPin, LOW);
    digitalWrite(greenLedPin, HIGH);
  }

  Serial.print("Distance = ");             // Affichage Distance
  Serial.print(distance);
  Serial.println(" cm");
 
  delay(1000); 

  // Connexion à l'application web
  Serial.print("connexion à ");
  Serial.println(host);

  WiFiClient client;
  const int port = 80;
  if (!client.connect(host, port)) {
    Serial.println("connexion echouée");
    return;
  }

  String url = "/api/data";
  String data = "{
    id: " + binId + ",
    distance: " + distance +
  "}";

  String request = "POST " + url + " HTTP/1.0\r\n" + 
  "HOST: " + host + "\r\n" + 
  "Accept: *" + "/" + "*\r\n" + 
  "Content-Length: " + data.length() + "\r\n" + 
  "Content-Type: application/json\r\n" + "\r\n" + data;

  client.print():

  Serial.println();
  Serial.println("fermeture de la connexion");
}
