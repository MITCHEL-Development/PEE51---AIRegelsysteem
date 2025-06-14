import numpy as np
import tensorflow as tf
import time# of gebruik tflite_runtime.interpreter als je dat gebruikt

# Stap 1: Laad het TFLite-model
interpreter = tf.lite.Interpreter(model_path="/Users/mitchelreints/Desktop/05_Development/#Projecten/PEE51 - AIRegelsysteem/pwm_model.tflite")
interpreter.allocate_tensors()

# Stap 2: Haal input/output details op
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

# Debug: print input/output info
print("Input shape:", input_details[0]['shape'])
print("Input dtype:", input_details[0]['dtype'])
print("input: ", input_details)
print("Output shape:", output_details[0]['shape'])
print("Output:", output_details)

# Stap 3: Maak een voorbeeldinput van 5 waarden
# Dit moet overeenkomen met input shape, meestal [1, 5]
input_data = np.array([
    [
        [1.0, 0.0, 3.0, 4.0, 5.0],
        [5.0, 4.0, 3.0, 2.0, 1.0]
    ]
], dtype=np.float32)  # Shape: (1, 2, 5)

# Stap 4: Zet input in het model
interpreter.set_tensor(input_details[0]['index'], input_data)

# Stap 5: Voer het model uit
start = time.time()
interpreter.invoke()
end = time.time()
print(f"Inference time: {(end - start)} sec")
# Stap 6: Haal de output op
output_data = interpreter.get_tensor(output_details[0]['index'])
print("Model output:", output_data)
