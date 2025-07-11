//: [Previous](@previous)
/*:
 ---
 Contentstack is a headless, API-first content management system (CMS) that provides everything you need to power your web or mobile properties. To learn more about Contentstack, visit our [website](@https://www.contentstack.com) or refer to our [documentation](@https://www.contentstack.com/docs) site to understand what we do.
 
 This document is a detailed reference to Contentstack’s Image Delivery API and covers the parameters that you can add to the URL to retrieve images. The Image Delivery API is used to retrieve, manipulate and/or convert image files of your Contentstack account and deliver it to your web or mobile properties.
 
 If you are looking for APIs to deliver content to your web or mobile properties, use our [Content Delivery API](@https://www.contentstack.com/docs/apis/content-delivery-api/), and to manage content, you should use the [Content Management API](@https://www.contentstack.com/docs/apis/content-management-api/).

 ### Initialization
 To initialize, you will need to specify the stack's API Key, Access Token, and Environment's name.
 The snippet given below initializes your iOS SDK.
 */
import Contentstack
import PlaygroundSupport

let AccessToken = "delivery_token"
let APIKEY = "api_key"
let EnvironmentName = "production"

PlaygroundPage.current.needsIndefiniteExecution = true

let stack:Stack = Contentstack.stack(withAPIKey: APIKEY, accessToken: AccessToken, environmentName: EnvironmentName)
print(stack)

/*:
 ### Download Image
 */
func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        completion(data, response, error)
        }.resume()
}
/*:
 ### Image URL
 */
let imageURL: String = "https://images.contentstack.io/v3/assets/asset_uid/dummy_id/59e0c41ac0eddd140d5a8e3e/download";
/*:
 ## Automate Optimization
 The auto parameter lets you enable the functionality that automates certain image optimization features. [more](@https://www.contentstack.com/docs/apis/image-delivery-api/#automate-optimization)
 */
/*:
 ### Enable auto optimization
*/
let autoOptimizationTransformedUrl1:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "auto":"webp",
    ]);
print(autoOptimizationTransformedUrl1)
getDataFromUrl(url: URL(string: autoOptimizationTransformedUrl1)!) { data, response, error in
    guard let data = data, error == nil else { return }
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Enable auto optimization and encode to progressive JPEG
 */
let autoOptimizationTransformedUrl2:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "auto":"webp",
    "format": "pjpg"
    ]);
print(autoOptimizationTransformedUrl2)
getDataFromUrl(url: URL(string: autoOptimizationTransformedUrl2)!) { data, response, error in
    guard let data = data, error == nil else { return }
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ## Control Quality
 The quality parameter lets you control the compression level of images that have Lossy file format. [more](@https://www.contentstack.com/docs/apis/image-delivery-api/#control-quality)
 */
let qualityTransformedUrl:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "quality":2,
    ]);
print(qualityTransformedUrl)
getDataFromUrl(url: URL(string: qualityTransformedUrl)!) { data, response, error in
    guard let data = data, error == nil else { return }
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ## Convert Formats
The format parameter lets you converts a given image from one format to another. [more](@https://www.contentstack.com/docs/apis/image-delivery-api/#convert-formats)
 */
/*:
 ### Convert to GIF
 */
let convertToGIFURL:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "format":"gif",
    ]);
print(convertToGIFURL)
getDataFromUrl(url: URL(string: convertToGIFURL)!) { data, response, error in
    guard let data = data, error == nil else { return }
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Convert to PNG
 */
let convertToPNGURL:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "format":"png",
    ]);
print(convertToPNGURL)
getDataFromUrl(url: URL(string: convertToPNGURL)!) { data, response, error in
    guard let data = data, error == nil else { return }
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Convert to JPEG
 */
let convertToJPEGURL:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "format":"jpg",
    ]);
print(convertToJPEGURL)
getDataFromUrl(url: URL(string: convertToJPEGURL)!) { data, response, error in
    guard let data = data, error == nil else { return }
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Convert to Progressive JPEG
 */
let convertToProgressiveJPEGURL:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "format":"pjpg",
    ]);
print(convertToProgressiveJPEGURL)
getDataFromUrl(url: URL(string: convertToProgressiveJPEGURL)!) { data, response, error in
    guard let data = data, error == nil else { return }
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Convert to WEBP
 */
let convertToWEBPURL:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "format":"webp",
    ]);
print(convertToWEBPURL)
getDataFromUrl(url: URL(string: convertToWEBPURL)!) { data, response, error in
    guard let data = data, error == nil else { return }
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Convert to WEBP Lossy
 */
let convertToWEBPLossyURL:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "format":"webply",
    ]);
print(convertToWEBPLossyURL)
getDataFromUrl(url: URL(string: convertToWEBPLossyURL)!) { data, response, error in
    guard let data = data, error == nil else { return }
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Convert to WEBP Lossless
 */
let convertToWEBPLosslessURL:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "format":"webpll",
    ]);
print(convertToWEBPLosslessURL)
getDataFromUrl(url: URL(string: convertToWEBPLosslessURL)!) { data, response, error in
    guard let data = data, error == nil else { return }
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ## Resize Images [more](@https://www.contentstack.com/docs/apis/image-delivery-api/#resize-images)
 */
/*:
 ### Height and width by pixel
 */
let resizeImageUrl1:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "width":100,
    "height":100,
    "disable":"upscale",
    ]);
print(resizeImageUrl1)
getDataFromUrl(url: URL(string: resizeImageUrl1)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Height and width by percentage
 */
let resizeImageUrl2:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "width":"200p",
    "height":"200p",
    "disable":"upscale",
    ]);
print(resizeImageUrl2)
getDataFromUrl(url: URL(string: resizeImageUrl2)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Fit to bounds
 */
let fitToBoundsUrl:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "width":0.50,
    "height":0.50,
    "fit":"bounds"
    ]);
print(fitToBoundsUrl)
getDataFromUrl(url: URL(string: fitToBoundsUrl)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Fit by cropping
 */
let fitByCropUrl:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "width":125,
    "height":125,
    "fit":"crop",
    ]);
print(fitByCropUrl)
getDataFromUrl(url: URL(string: fitByCropUrl)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ## Crop Images [more](@https://www.contentstack.com/docs/apis/image-delivery-api/#crop-images)
 */
/*:
 ### Crop by width and height
 */
let cropHWUrl:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "crop":"150,100",
    ]);
print(cropHWUrl)
getDataFromUrl(url: URL(string: cropHWUrl)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Crop sub region
 */
let cropSubRegionUrl:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "crop":"50,75,x0.10,y0.20",
    ]);
print(cropSubRegionUrl)
getDataFromUrl(url: URL(string: cropSubRegionUrl)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Crop and offset
 */
let cropAndOffsetUrl:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "crop":"150,100,offset-x0.45,offset-y0.75",
    ]);
print(cropAndOffsetUrl)
getDataFromUrl(url: URL(string: cropAndOffsetUrl)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ## Trim
 The trim parameter lets you trim an image from the edges. [more](@https://www.contentstack.com/docs/apis/image-delivery-api/#trim-images)
 */
let trimUrl:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "trip":"25,50,75,100",
    ]);
print(trimUrl)
getDataFromUrl(url: URL(string: trimUrl)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ## Reorient Images
 The orient parameter lets you control the cardinal orientation of the given image. [more](@https://www.contentstack.com/docs/apis/image-delivery-api/#reorient-images)
 You can use any of the following values for the orient parameter:
 1 - Set image to default
 2 - Flip image horizontally
 3 - Flip image horizontally and vertically
 4 - Flip image vertically
 5 - Flip image horizontally and then rotate 90 degrees towards left
 6 - Rotate image 90 degrees towards right
 7 - Flip image horizontally and then rotate 90 degrees towards right
 8 - Rotate image 90 degrees towards left
 */
let orientationUrl:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "orient":6,
    ]);
print(orientationUrl)
getDataFromUrl(url: URL(string: orientationUrl)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ## Overlay Settings
 The overlay parameter allows you to put one image on top of another.  [more](@https://www.contentstack.com/docs/apis/image-delivery-api/#overlay-settings)
 */
/*:
 ### Overlay image
 */
let overlayUrl:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "overlay":"/v3/assets/asset_uid/dummy_id/59e0c401462a293417405f34/download",
    ]);
print(overlayUrl)
getDataFromUrl(url: URL(string: overlayUrl)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Align overlay
 */
let overlayAndAlingUrl:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "overlay":"/v3/assets/asset_uid/dummy_id/59e0c401462a293417405f34/download",
    "overlay-align":"left,bottom",
    ]);
print(overlayAndAlingUrl)
getDataFromUrl(url: URL(string: overlayAndAlingUrl)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Repeat overlay horizontally
 */
let overlayRepeatHorizontally:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "overlay":"/v3/assets/asset_uid/dummy_id/59e0c401462a293417405f34/download",
    "overlay-repeat":"x",
    ]);
print(overlayAndAlingUrl)
getDataFromUrl(url: URL(string: overlayAndAlingUrl)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Repeat overlay vertically
 */
let overlayRepeatVertically:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "overlay":"/v3/assets/asset_uid/dummy_id/59e0c401462a293417405f34/download",
    "overlay-repeat":"x",
    ]);
print(overlayRepeatVertically)
getDataFromUrl(url: URL(string: overlayRepeatVertically)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Repeat overlay vertically and horizontally
 */
let overlayRepeatHorizontallyVertically:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "overlay":"/v3/assets/asset_uid/dummy_id/59e0c401462a293417405f34/download",
    "overlay-repeat":"both",
    ]);
print(overlayRepeatHorizontallyVertically)
getDataFromUrl(url: URL(string: overlayRepeatHorizontallyVertically)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Set overlay width
 */
let overlayWidthURL:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "overlay":"/v3/assets/asset_uid/dummy_id/59e0c401462a293417405f34/download",
    "overlay-width":100,
    ]);
print(overlayWidthURL)
getDataFromUrl(url: URL(string: overlayWidthURL)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
### Set overlay height
*/
let overlayHeightURL:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "overlay":"/v3/assets/asset_uid/dummy_id/59e0c401462a293417405f34/download",
    "overlay-height":150,
    ]);
print(overlayHeightURL)
getDataFromUrl(url: URL(string: overlayHeightURL)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ## Pad
 This parameter lets you add extra pixels to the edges of an image. [more](@https://www.contentstack.com/docs/apis/image-delivery-api/#pad)
 */
/*:
 ### Add padding
 */
let padURL:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "pad":"25,50,75,100",
    ]);
print(padURL)
getDataFromUrl(url: URL(string: padURL)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Add padding and background color
 */
let paddingWithBackgroundColorURL:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "pad":"25,50,75,100",
    "bg-color":"FF0000"
    ]);
print(paddingWithBackgroundColorURL)
getDataFromUrl(url: URL(string: paddingWithBackgroundColorURL)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ## Background Color
 The bg-color parameter lets you set a backgroud color for the given image.  [more](@https://www.contentstack.com/docs/apis/image-delivery-api/#background-color)
 */
/*:
 ### Change background color using hexadecimal value
 The first type is the 3- or 6-digit hexadecimal value, for example ?bg-color=cccccc.
 */
let hexBackgroundColorURL:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "bg-color":"cccccc"
    ]);
print(hexBackgroundColorURL)
getDataFromUrl(url: URL(string: hexBackgroundColorURL)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Change background color by Red, Blue, Green value
The second type is the Red, Blue, Green value which defines the intensity of the corresponding color, with the value ranging anywhere between 0 and 255 for each. An example of this is ?bg-color=140,220,123.
 */
let rgbBackgroundColorURL:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "bg-color":"140,220,123"
    ]);
print(rgbBackgroundColorURL)
getDataFromUrl(url: URL(string: rgbBackgroundColorURL)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ### Change background color by Red, Blue, Green, Alpha value
 And the last type is the Red, Blue, Green, Alpha value, which is an extension of the second type with an addition of the alpha element. The alpha value defines the transparency, with 0.0 being fully transparent and 1.0 being completely opaque. An example of this is ?bg-color=140,220,123,0.5.
 */
let rgbaBackgroundColorURL:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "bg-color":"140,220,123,0.5"
    ]);
print(rgbaBackgroundColorURL)
getDataFromUrl(url: URL(string: rgbaBackgroundColorURL)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ## Background Color
 The dpr parameter lets you deliver images with appropriate size to devices that come with a defined device pixel ratio.

 For example, if the iPhone 6s has a device pixel ratio of 2, it means that the actual resolution is double the logical resolution. Different devices have different pixel ratios. This parameter, therefore, lets you render appropriately sized images to different devices.
 The value for this parameter could be a whole number (between 1 and 10000) or any decimal number (between 0.0 and 9999.9999...).

 [more](@https://www.contentstack.com/docs/apis/image-delivery-api/#device-pixel-ratio)
 */
let dprURL:String = stack.imageTransform(withUrl: imageURL, andParams: [
    "dpr":"2"
    ]);
print(dprURL)
getDataFromUrl(url: URL(string: dprURL)!) { data, response, error in
    guard let data = data, error == nil else { return }
    print(data)
    DispatchQueue.main.async() {
        let image = UIImage(data: data)
    }
}
/*:
 ---
 */
//: [Next](@next)
