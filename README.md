# LSI_CONTEST_HUST
Design Counter module, Synthesys and Layout

<span style="font-size: 120 px;">**Overview:**</span>

Description: Optimizing hardware for a CNN model used in image compression and decompression, implementing
the algorithm in C/C++, synthesizing RTL code, and deploying on an FPGA.Details: Autoencoder module utilizing
a CNN model for compressing and decompressing grayscale images of any size. The model has been trained on
Colab and comprises 7 convolution layers, 3 pooling layers, and 3 upsampling layers.
• Solution: The algorithm employs a line buffer to efficiently read and store temporary data during the convolution
process. It uses a data channel called ”stream” to connect between two processes in the CNN.

<span style="font-size: 120 px;">**Features**</span>


-Using Line Buffer : The implementation uses a line buffer to efficiently read and store temporary data during the convolution process. This helps optimize memory usage and processing efficiency.

-Sequential Convolution Operation: The CNN model employs sequential convolution operations to perform image encryption and decryption. This approach is chosen to minimize hardware resource requirements while maintaining computational accuracy.

-Versatile Image Size Handling: The system is designed to handle images of different sizes as input. It dynamically adjusts to the dimensions of the provided image, ensuring flexibility and compatibility with various input sources.

-FPGA Deployment with See3Cam Camera: The implementation is tailored for deployment on an FPGA (Field-Programmable Gate Array) and is compatible with the See3Cam camera. This enables real-time image processing and encryption directly from the camera input.

-The model is capable of computation with any arbitrary input image size

<span style="font-size: 40px;">**-The github project include : **</span>
<span style="font-size: 40px;">**-Code HLS (C/C++) for CNN model **</span>
<span style="font-size: 40px;">**-Code RTL generated by Vitis HLS (C/C++) for CNN model **</span>
<span style="font-size: 40px;">**-Data of model CNN testing  **</span>
<span style="font-size: 40px;">**-Specification of project  **</span>

<span style="font-size: 50px;">**CNN model**</span>
![image](https://github.com/nguyendaithien/LSI_CONTEST_HUST/assets/91738843/4449794c-fcf1-4d9f-a38c-faa6a5a5e50d)

<span style="font-size: 50px;">**Using line buffer to store data**</span>

![image](https://github.com/nguyendaithien/LSI_CONTEST_HUST/assets/91738843/392fabdd-ad5f-4f08-96ab-401a7fe047be)

<span style="font-size: 50px;">**Horizontal convolution is employed to reduce hardware**</span>
![image](https://github.com/nguyendaithien/LSI_CONTEST_HUST/assets/91738843/21e3aa71-d812-4ca8-afa3-e88fbc72e0a5)

<span style="font-size: 50px;">**Deploying hardware on FPGA: ZCU104 board and See3Cam**</span>

![image](https://github.com/nguyendaithien/LSI_CONTEST_HUST/assets/91738843/8f8561eb-cad7-4325-920f-5efbfeb57c35)









