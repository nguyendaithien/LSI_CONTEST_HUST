#include<stdio.h>
#include<hls_stream.h>
#include<stdint.h>
#include <assert.h>


typedef double data_t;
#define MAX_IMG_ROWS 30
#define MAX_IMG_COLS 30


// top module CNN
void CNN( int padding, int width, int hight,  data_t *image, data_t *output, data_t *output_pooling1, data_t *output_conv2, data_t *output_pooling2, data_t *output_conv3, data_t *output_pooling3,data_t *output_conv4, data_t *output_upsampling1, data_t *output_conv5, data_t *output_upsampling2, data_t *output_conv6, data_t *output_upsampling3, data_t *output_conv7);

// relu function
static data_t relu(data_t a)
{
	return a > (data_t)0 ? a : (data_t)0;
}
// convolution function 
template <typename INPUT_DATA_TYPE
         ,typename OUTPUT_DATA_TYPE
	 ,typename KERNEL_TYPE
	 ,typename PADDING_TYPE
	 ,int CONV_DATA_XSIZE
	 ,int CONV_DATA_YSIZE
	 ,int CONV_NUM_CHANNEL
	 ,int CONV_NUM_KERNEL
	 ,int CONV_DATA_OUT_XSIZE
	 ,int CONV_DATA_OUT_YSIZE
	 ,int KERNEL_XSIZE
	 ,int KERNEL_YSIZE
	 ,int CONV_STRICE
	 ,int CONV_PADDING_SIZE
	 >
         void convolution( int padding, int width, int hight ,INPUT_DATA_TYPE bias[CONV_NUM_CHANNEL], data_t *image, const KERNEL_TYPE *kernel,OUTPUT_DATA_TYPE *output) {
             hight = CONV_DATA_YSIZE + 2*CONV_PADDING_SIZE;
             width = CONV_DATA_XSIZE + 2*padding;
             INPUT_DATA_TYPE window_buffer[3][3];
             INPUT_DATA_TYPE line_buffer[3][30];
           // write pixel to line buffer
	     #pragma HLS ARRAY_PARTITION variable=line_buffer dim=1 complete
	     #pragma HLS INLINE 
            for ( int num_channel = 0 ; num_channel < CONV_NUM_CHANNEL ; num_channel ++ ){
                 for( int num_ker= 0 ; num_ker < CONV_NUM_KERNEL ; num_ker ++){
                    for( int i = 0 ; i < hight ; i++ ) {
		       for( int j = 0 ; j < 30; j++ ) { 
		       line_buffer[0][j] = line_buffer[1][j];
                       line_buffer[1][j] = line_buffer[2][j];
                       line_buffer[2][j] = (i == 0 || i == hight - 1 || j == 0 || j == width - 1) ? 0 :
                          image[num_channel * CONV_DATA_XSIZE * CONV_DATA_YSIZE + (i - CONV_PADDING_SIZE) * CONV_DATA_XSIZE + (j - CONV_PADDING_SIZE)];
                            
		   // shift window
Shift_win_right:for( int b = 0 ; b < width - 2 ; b++) {
           	if( b == 0) {
		   for( int row = 0; row < 3 ; row ++) {
			for( int col = 0 ; col < 3 ; col ++) {
			#pragma HLS PIPELINE
			    window_buffer[row][col] = (col== 0)? 0 : ( col == 1)? line_buffer[row][0] : ( col == 2)?line_buffer[row][1]:0;
			}
	           }
           	}
		   for( int row = 0; row < 3 ; row ++) {
		      for( int col = 0 ; col < 3 ; col ++) {
	              #pragma HLS PIPELINE
			  window_buffer[row][col] = (col== 0)? window_buffer[row][1] : ( col == 1)? window_buffer[row][2] : ( col == 2)?line_buffer[row][b+2] : 0 ;
		      }
		   }
		   if( i > 1) {
                INPUT_DATA_TYPE sum = 0;
                   for (int m = 0; m < KERNEL_XSIZE; m++) {
                      for (int n = 0; n < KERNEL_YSIZE; n++) {
	              #pragma HLS PIPELINE
                        sum += window_buffer[m][n] * kernel[num_ker * CONV_NUM_CHANNEL *  KERNEL_XSIZE*KERNEL_YSIZE + num_channel*KERNEL_XSIZE*KERNEL_YSIZE + m*3 + n];
                      }
           	   }
           	       output[num_ker * CONV_DATA_OUT_XSIZE * CONV_DATA_OUT_YSIZE + (i - (KERNEL_XSIZE - 1)) * CONV_DATA_OUT_XSIZE + b] += sum;
           	} 
               }
              }
             }
            }
               // Apply ReLU and add bias
            for (int num_ker = 0; num_ker < CONV_NUM_KERNEL; num_ker++) {
                 for (int i = 0; i < CONV_DATA_OUT_YSIZE; i++) {
                      for (int j = 0; j < CONV_DATA_OUT_XSIZE; j++) {
			    #pragma HLS PIPELINE
                           int index = num_ker * CONV_DATA_OUT_YSIZE * CONV_DATA_OUT_XSIZE + i * CONV_DATA_OUT_XSIZE + j;
                           output[index] = relu(bias[num_ker] + output[index]);
                      }
                 }
            }
        }
      }
 
// pooling function
#define POOL_SIZE 2
template<typename DATA_IN_TYPE,
         typename DATA_OUT_TYPE,
         int NUM_CHANNEL,
         int DATA_IN_XSIZE,
         int DATA_IN_YSIZE,
         int DATA_OUT_XSIZE,
         int DATA_OUT_YSIZE,
         int POOLING_SIZE,
         int STRIDE_SIZE
        >
void max_pooling(int width, int height, DATA_IN_TYPE *input, DATA_OUT_TYPE *output) {
    DATA_IN_TYPE line_buffer_0[28];
    DATA_IN_TYPE line_buffer_1[28];
    DATA_IN_TYPE window_buffer[POOL_SIZE][POOL_SIZE];
 #pragma HLS INLINE
    for (int num_channel = 0; num_channel < NUM_CHANNEL; num_channel++) {
        for (int i = 0; i < height; i += STRIDE_SIZE) {
            for (int j = 0; j < width; j += STRIDE_SIZE) {
                for (int k = 0; k < POOLING_SIZE; k++) {
		   #pragma HLS PIPELINE
                    line_buffer_0[k] = line_buffer_1[k];
                    line_buffer_1[k] = input[num_channel * DATA_IN_XSIZE * DATA_IN_YSIZE + (i + POOLING_SIZE - 1) * DATA_IN_XSIZE + (j + k)];
                }
                if (i + POOLING_SIZE - 1 < height && j + POOLING_SIZE - 1 < width) {
                    DATA_IN_TYPE max_val = line_buffer_0[0];
                    for (int a = 0; a < POOLING_SIZE; a++) {
                        for (int b = 0; b < POOLING_SIZE; b++) {
		   #pragma HLS PIPELINE
                            max_val = (line_buffer_1[b] > max_val) ? line_buffer_1[b] : max_val;
                        }
                    }

                    output[num_channel * DATA_OUT_XSIZE * DATA_OUT_YSIZE + (i / STRIDE_SIZE) * DATA_OUT_XSIZE + (j / STRIDE_SIZE)] = max_val;
                }
            }
        }
    }
}

// upsampling function
template <typename DATA_IN_TYPE,
          typename DATA_OUT_TYPE,
          int NUM_CHANNEL,
          int DATA_IN_XSIZE,
          int DATA_IN_YSIZE,
          int DATA_OUT_XSIZE,
          int DATA_OUT_YSIZE,
          int UPSAMPLING_FACTOR_X,
          int UPSAMPLING_FACTOR_Y>
void upsampling(int width, int height, DATA_IN_TYPE *in_us1, DATA_OUT_TYPE *out_us1) {
    DATA_IN_TYPE upsam_buf[2 * 28];
 #pragma HLS INLINE
    for (int num_channel = 0; num_channel < NUM_CHANNEL; num_channel++) {
        for (int i = 0; i < 2 * height; i++) {
            for (int j = 0; j < 2 * width; j++) {
		 #pragma HLS PIPELINE
                if (i % 2 == 0) {
                    upsam_buf[j / 2] = in_us1[num_channel * DATA_IN_XSIZE * DATA_IN_YSIZE + (i / 2) * DATA_IN_XSIZE + (j / UPSAMPLING_FACTOR_Y)];
                    out_us1[num_channel * DATA_OUT_XSIZE*DATA_OUT_XSIZE + i * DATA_OUT_XSIZE + j] = upsam_buf[j / 2];
                } else {
                    out_us1[num_channel * DATA_OUT_XSIZE + i * DATA_OUT_XSIZE + j] = out_us1[num_channel *DATA_OUT_XSIZE*DATA_OUT_XSIZE + (i - 1) * DATA_OUT_XSIZE + j];
                }
            }
        }

    }
}
