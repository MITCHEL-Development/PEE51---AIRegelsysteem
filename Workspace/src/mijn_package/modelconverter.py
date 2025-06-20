import tensorflow as tf
import struct
import mijn_package.config as c


# Convert Keras model to a tflite model and generate C header file
def convert_model_to_tflite_and_c_header(model, tflite_path, header_path, var_name):
    # Converteer Keras model naar TFLite model
    converter = tf.lite.TFLiteConverter.from_keras_model(model)
    converter.optimizations = [tf.lite.Optimize.OPTIMIZE_FOR_SIZE]
    tflite_model = converter.convert()
        # Sla TFLite model op als .tflite bestand
    with open(tflite_path, 'wb') as f:
        f.write(tflite_model)
            # Zet de TFLite model bytes om in een C-array
    def hex_to_c_array(hex_data, var_name):
        c_str = ''
        c_str += '#ifndef ' + var_name.upper() + '_H\n'
        c_str += '#define ' + var_name.upper() + '_H\n\n'
        c_str += 'unsigned int ' + var_name + '_len = ' + str(len(hex_data)) + ';\n'
        c_str += 'unsigned char ' + var_name + '[] = {\n '
        hex_array = []
        for i, val in enumerate(hex_data):
            hex_str = format(val, '#04x')
            if (i + 1) < len(hex_data):
                hex_str += ','
            if (i + 1) % 12 == 0:
                hex_str += '\n '
            hex_array.append(hex_str)
        c_str += ' '.join(hex_array) + '\n};\n\n'
        c_str += '#endif //' + var_name.upper() + '_H\n'
        return c_str
        # Sla de gegenereerde C-header op
    with open(header_path, 'w') as file:
        file.write(hex_to_c_array(tflite_model, var_name))
        
        
        
def convert_model_to_tflite_and_c_header_float(model, tflite_path, header_path, var_name):
    # Converteer Keras model naar TFLite model
    converter = tf.lite.TFLiteConverter.from_keras_model(model)
    converter.optimizations = [tf.lite.Optimize.OPTIMIZE_FOR_SIZE]
    tflite_model = converter.convert()
        # Sla TFLite model op als .tflite bestand
    with open(tflite_path, 'wb') as f:
        f.write(tflite_model)
            # Zet de TFLite model bytes om in een C-array
        # Sla de gegenereerde C-header op
    with open(header_path, 'w') as file:
        file.write(hex_to_c_array_float(tflite_model, var_name))


def hex_to_c_array_float(float_data, var_name):
    c_str = ''
    c_str += '#ifndef ' + var_name.upper() + '_H\n'
    c_str += '#define ' + var_name.upper() + '_H\n\n'
    c_str += 'unsigned int ' + var_name + '_len = ' + str(len(float_data)) + ';\n'
    c_str += 'float ' + var_name + '[] = {\n '

    float_values = struct.unpack('<' + 'f' * (len(float_data) // 4), float_data)

    for i, val in enumerate(float_values):
        float_str = f"{val:.8f}"
        if (i + 1) < len(float_values):
            float_str += ','
        if (i + 1) % 6 == 0:
            float_str += '\n '
        c_str += float_str + ' '

    c_str += '\n};\n\n'
    c_str += '#endif //' + var_name.upper() + '_H\n'
    return c_str


