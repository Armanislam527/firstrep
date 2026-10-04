// PIR Motion Sensor Test Script for ESP8266
// Hardware: PIR Sensor Data pin connected to D5

// On ESP8266 NodeMCU/D1 Mini, the pin labeled "D5" maps to GPIO 14
const int PIR_PIN = D5; 

// Variables to keep track of the sensor state
int currentSensorState = LOW;
int lastSensorState = LOW;
unsigned long lastHeartbeatTime = 0;

void setup() {
  // Start the serial communication for logging
  Serial.begin(115200);
  delay(500); // Give the serial monitor a moment to settle
  
  Serial.println("\n=================================");
  Serial.println("ESP8266 PIR Sensor Test Starting...");
  Serial.println("=================================");

  // Configure D5 as an input with an internal pull-down resistor 
  // This keeps the pin stable at 0V until the PIR sends a 3.3V signal
  pinMode(PIR_PIN, INPUT_PULLDOWN_16);

  Serial.println("Sensor initialized. Calibrating PIR (Warm-up)...");
  Serial.println("Note: Some PIR sensors take 10-60 seconds to stabilize.");
}

void loop() {
  // Read the current live state of the D5 pin (HIGH or LOW)
  currentSensorState = digitalRead(PIR_PIN);

  // Check if the state has changed since the last loop run
  if (currentSensorState != lastSensorState) {
    
    if (currentSensorState == HIGH) {
      // The PIR detected motion and sent a HIGH signal
      Serial.println(" [✅ MOTION] -> Signal went HIGH! Motion detected.");
    } 
    else {
      // The PIR cleared its timer and went back to LOW
      Serial.println(" [⚪ CLEARED] -> Signal went LOW! Motion stopped.");
    }
    
    // Save the current state for the next comparison
    lastSensorState = currentSensorState;
  }

  // Heartbeat log: Prints a status update every 5 seconds 
  // This proves your ESP8266 is running fine even if you aren't moving
  if (millis() - lastHeartbeatTime >= 5000) {
    lastHeartbeatTime = millis();
    Serial.print("[System OK] Live PIR Pin State is: ");
    Serial.println(currentSensorState == HIGH ? "HIGH (Motion)" : "LOW (No Motion)");
  }

  delay(20); // Small delay to avoid bouncing/flickering issues
}
