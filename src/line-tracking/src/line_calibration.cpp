#include <unistd.h>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/opencv.hpp>
#include <iostream>
#include <fstream>
#include <ctime>
#include <signal.h>
#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>

using namespace cv;
using namespace std;

//string point_cloud_frame_id = "";
//ros::Time point_cloud_time;

//Task kill flag
static volatile int keepRunning = 1;
//static volatile double xscale = 0.003787727;
//static volatile double yscale = 0.00419224;
static volatile double yOffset = 0.17;
static volatile double xOffset = 0.7366;

//Initialize the Mats needed for calculations
static Mat frame;
static Mat HSV;
static Mat threshld;
static Mat Gaussian;
static Mat Can;
static Mat ctv;
static Mat Hough;
static Mat output;

//Vector that holds the detected lines
static vector<Vec4i> lines;

//The HSV ranges
static int H_MIN, H_MAX, S_MIN, S_MAX, V_MIN, V_MAX, S_TOP, S_BOT, X_SCALE, Y_SCALE;
static double X_SCALE2, Y_SCALE2;

static int horizScaleBig, vertScaleBig, vertCorrBig;

static volatile float horizOffset = 0.17, vertOffset = 0.7366;
static double horizScale, vertScale, vertCorr;
static volatile int horizPixels, vertPixels;

//cnt+c handeler (may not be needed with ros.spin())
void intHandler(int dummy) {
	keepRunning = 0;
}

//ROS Comms initialization
class ImageConverter {
	//Initialize node handeler
	ros::NodeHandle nh_;
	
	//Set up subscriber
	image_transport::ImageTransport it_;
	image_transport::Subscriber image_sub_;
	cv_bridge::CvImagePtr cv_ptr;

public:
	//Subscribe to the ROS topic
	ImageConverter():it_(nh_) {
		// Subscribe to input video feed and publish output video feed
		image_sub_ = it_.subscribe("/camera/rgb/image_rect_color", 1,
		&ImageConverter::imageCb, this);
	}

	//Main image transform function
	void imageCb(const sensor_msgs::ImageConstPtr& msg) {
		
		//*Initialization Phase*//
		
		//Try to convert
		try {
			cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
		//Catch errors and print to screen
		} catch (cv_bridge::Exception& e) {
			ROS_ERROR("cv_bridge exception: %s", e.what());
			return;
		}
		

		//Get the current frame
		frame = cv_ptr->image;

		//*Perspective shift phase*//
		
		//Initialize perspective shift quadralaterals
		Point2f inputQuad[4];
		Point2f outputQuad[4];

		// Lambda Matrix
		Mat lambda(2, 4, CV_32FC1);

		// Set the lambda matrix the same type and size as input
		lambda = Mat::zeros(frame.rows, frame.cols, frame.type());

		horizPixels = frame.cols;
		vertPixels = frame.rows;

		// The 4 points that select quadilateral on the input , from top-left in clockwise order
		// These four pts are the sides of the rect box used as input
		//inputQuad[0] = Point2f(100, 360);
		//inputQuad[1] = Point2f(1180, 360);
		//inputQuad[2] = Point2f(1940, 720);
		//inputQuad[3] = Point2f(-660, 720);
		inputQuad[0] = Point2f(0, frame.rows/2);
		inputQuad[1] = Point2f(frame.cols, frame.rows/2);
		inputQuad[2] = Point2f(frame.cols, frame.rows);
		inputQuad[3] = Point2f(0, frame.rows);
		// The 4 points where the mapping is to be done , from top-left in clockwise order
		outputQuad[0] = Point2f(-S_TOP, 0);
		outputQuad[1] = Point2f(frame.cols+S_TOP, 0);
		outputQuad[2] = Point2f(frame.cols-S_BOT, frame.rows);
		outputQuad[3] = Point2f(+S_BOT, frame.rows);

		// Get the Perspective Transform Matrix i.e. lambda
		lambda = getPerspectiveTransform(inputQuad, outputQuad);
		// Apply the Perspective Transform just found to the src image
		warpPerspective(frame, output, lambda, output.size());

		//*Discovery Phase*//
		//Convert the frame to different kinds of Mats
		cvtColor(output, HSV, COLOR_BGR2HSV);
		inRange(HSV, Scalar(H_MIN, S_MIN, V_MIN), Scalar(H_MAX, S_MAX, V_MAX), threshld);
		inRange(HSV, Scalar(0, 0, 0), Scalar(0, 0, 0), Hough);
		morphOps(threshld);

		//Detect Edges
		Canny(threshld, Can, 50, 200, 3);

		//Convert to black and white
		cvtColor(Can, ctv, CV_GRAY2BGR);

		//Detect lines
		HoughLinesP(Can, lines, 1, CV_PI/180, 50, 20, 10);

		//*Data conversion phase*//
		int index = 0;
		//For all points
		for (size_t i = 0; i < lines.size(); i++) {
			//Convert take one point out of the array
			Vec4i l = lines[i];
			line(ctv, Point(l[0], l[1]), Point(l[2], l[3]), Scalar(0, 0, 255), 3, CV_AA);
		}
		
		X_SCALE2 = X_SCALE/10000;
		Y_SCALE2 = Y_SCALE/10000;
//			line(output, Point((0.5-yOffset)/Y_SCALE2,(2-xOffset)/X_SCALE2), Point((-0.5-yOffset)/Y_SCALE2,(2-xOffset)/X_SCALE2), Scalar(255, 0, 0), 3, CV_AA);
//			line(output, Point((0.5-yOffset)/Y_SCALE2,(1-xOffset)/X_SCALE2), Point((-0.5-yOffset)/Y_SCALE2,(1-xOffset)/X_SCALE2), Scalar(255, 0, 0), 3, CV_AA);
		if (vertScale > 0 && vertCorr > 0) {
			line(output, Point(horizDistToPix(0.5),frame.rows-20), Point(horizDistToPix(-0.5),frame.rows-20), Scalar(255, 0, 255), 3, CV_AA);
			line(output, Point(horizDistToPix(0),vertDistToPix(1)), Point(horizDistToPix(0),vertDistToPix(2)), Scalar(255, 0, 255), 3, CV_AA);
		}
		//*Show Phase*//
		//Make and populate the windows that show the Mats
		namedWindow( "Input Image", WINDOW_NORMAL );
		imshow("Input Image", frame);
		waitKey(25);
			
		namedWindow( "Color Filtering", WINDOW_NORMAL );
		imshow("Color Filtering", threshld);
		waitKey(25);
			
		namedWindow( "Line Tracking", WINDOW_NORMAL );
		imshow("Line Tracking", ctv);
		waitKey(25);

		namedWindow( "Shift", WINDOW_NORMAL );// Create a window for display.
		imshow("Shift", output);
		waitKey(25);
		
		//Initialize the sliders
		char HMINSlide[50];
		char HMAXSlide[50];
		char SMINSlide[50];
		char SMAXSlide[50];
		char VMINSlide[50];
		char VMAXSlide[50];
		char TOPSlide[50];
		char BOTSlide[50];
		char HorizSlide[50];
		char VertSlide[50];
		char CorrSlide[50];
		sprintf( HMINSlide, "H_MIN");
		sprintf( HMAXSlide, "H_MAX");
		sprintf( SMINSlide, "S_MIN");
		sprintf( SMAXSlide, "S_MAX");
		sprintf( VMINSlide, "V_MIN");
		sprintf( VMAXSlide, "V_MAX");
		sprintf( TOPSlide, "S_TOP");
		sprintf( BOTSlide, "S_BOT");
		sprintf( HorizSlide, "HorizScale");
		sprintf( VertSlide, "VertScale");
		sprintf( CorrSlide, "VertCorrection");
 
		//Open a window for the sliders and populate

		namedWindow( "Calibration", WINDOW_NORMAL );
		createTrackbar( HMINSlide, "Calibration", &H_MIN, 255);
		createTrackbar( HMAXSlide, "Calibration", &H_MAX, 255);
		createTrackbar( SMINSlide, "Calibration", &S_MIN, 255);
		createTrackbar( SMAXSlide, "Calibration", &S_MAX, 255);
		createTrackbar( VMINSlide, "Calibration", &V_MIN, 255);
		createTrackbar( VMAXSlide, "Calibration", &V_MAX, 255);
		createTrackbar( TOPSlide, "Calibration", &S_TOP, 1024);
		createTrackbar( BOTSlide, "Calibration", &S_BOT, 1024);
		createTrackbar( HorizSlide, "Calibration", &horizScaleBig, 10000);
		createTrackbar( VertSlide, "Calibration", &vertScaleBig, 10000);
		createTrackbar( CorrSlide, "Calibration", &vertCorrBig, 10000);
		vertCorr = ((float)vertCorrBig/10000);
		horizScale = ((float)horizScaleBig/10000);
		vertScale = ((float)vertScaleBig/10000);
	}

	void morphOps(Mat &thresh) {
		//create structuring element that will be used to "dilate" and "erode" image.
		//the element chosen here is a 3px by 3px rectangle

		Mat erodeElement = getStructuringElement(MORPH_RECT, Size(2, 2));
		//dilate with larger element so make sure object is nicely visible
		Mat dilateElement = getStructuringElement(MORPH_RECT, Size(3, 3));

		//Erode the image
		//erode(thresh, thresh, erodeElement);
		//erode(thresh, thresh, erodeElement);

		//Dilate the image
		dilate(thresh, thresh, dilateElement);
		dilate(thresh, thresh, dilateElement);
	}

	cv_bridge::CvImagePtr getImage() {
		return cv_ptr;
	}

	float horizPixToDist(int pixel) {
		float dist = (horizScale*(pixel-(horizPixels/2)))+horizOffset;
		return dist;
	}

	int horizDistToPix(float dist) {
		float pixel = ((dist-horizOffset)/horizScale)+(horizPixels/2);
		return pixel;
	}

	float vertPixToDist(int pixel) {
		float dist = (vertScale*(vertPixels-pixel))+vertOffset;
		return dist;
	}

	int vertDistToPix(float dist) {
		float pixel = -((dist-vertOffset)/(vertScale)-vertPixels);
		return pixel;
	}

};

int main(int argc, char** argv) {
	//Get the file with HSV values and inport them
	std::fstream HSVfile("LineTrackingFiles/HSV.txt", std::ios_base::in);
	HSVfile >> H_MIN >> H_MAX >> S_MIN >> S_MAX >> V_MIN >> V_MAX >> S_TOP >> S_BOT >> horizScale >> vertScale >> vertCorr;
	HSVfile.close();
	
	horizScaleBig = horizScale*10000;
	vertScaleBig = vertScale*10000;
	vertCorrBig = vertCorr*10000;

	//Initialize signal handeler
	signal(SIGINT, intHandler);
	
	//Initialize topic
	ros::init(argc, argv, "image_converter");
	ImageConverter ic;

	//Spin until cntr+c
	ros::spin();
	
	//When the exit signal comes, save the HSV values to the file
	ofstream HSVfiles;
	HSVfiles.open("LineTrackingFiles/HSV.txt");
	HSVfiles << H_MIN << " " << H_MAX << " " << S_MIN << " " << S_MAX << " " << V_MIN << " " << V_MAX << " " << S_TOP << " " << S_BOT << " " << horizScale << " " << vertScale << " " << vertCorr;
			
	//End the program
	return 0;
}
