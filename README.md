# LSI_CONTEST_HUST
Image Encryption and Decryption using CNN

Overview:

This project implements image encryption and decryption using Convolutional Neural Networks (CNN) with specific features for efficient processing. The encryption and decryption operations leverage line buffers for temporary data storage during convolution calculations, and employ sequential convolution operations to reduce hardware resource utilization. The system is designed to handle images of varying sizes and is optimized for FPGA deployment with the See3Cam camera.

Features

-Using Line Buffer : The implementation uses a line buffer to efficiently read and store temporary data during the convolution process. This helps optimize memory usage and processing efficiency.

-Sequential Convolution Operation: The CNN model employs sequential convolution operations to perform image encryption and decryption. This approach is chosen to minimize hardware resource requirements while maintaining computational accuracy.

-Versatile Image Size Handling: The system is designed to handle images of different sizes as input. It dynamically adjusts to the dimensions of the provided image, ensuring flexibility and compatibility with various input sources.

-FPGA Deployment with See3Cam Camera: The implementation is tailored for deployment on an FPGA (Field-Programmable Gate Array) and is compatible with the See3Cam camera. This enables real-time image processing and encryption directly from the camera input.


<span style="font-size: 50px;">**CNN model**</span>
![image](https://github.com/nguyendaithien/LSI_CONTEST_HUST/assets/91738843/4449794c-fcf1-4d9f-a38c-faa6a5a5e50d)

<span style="font-size: 50px;">**Using line buffer to store data**</span>

![image](https://github.com/nguyendaithien/LSI_CONTEST_HUST/assets/91738843/392fabdd-ad5f-4f08-96ab-401a7fe047be)

<span style="font-size: 50px;">**Horizontal convolution is employed to reduce hardware**</span>
![image](https://github.com/nguyendaithien/LSI_CONTEST_HUST/assets/91738843/21e3aa71-d812-4ca8-afa3-e88fbc72e0a5)

span style="font-size: 50px;">**The model is capable of computation with any arbitrary input image size**</span>






