# NYT_Articles

This is NYT most popular articles flutter app using MVC architecture.

<div align="center">
 <img src="https://user-images.githubusercontent.com/60781548/147371939-d1d3ad6b-6616-4497-b8d6-92c7f8f9134c.png" width="25%"</img> 
 <img width="50"></img>
 <img src="https://user-images.githubusercontent.com/60781548/147371941-49569be5-3cfc-4980-a251-05c30ebc0ef2.png" width="25%"<img> 

</div>

## Getting Started

Make sure to create an account at [NYT Developer website](https://developer.nytimes.com/get-started") first, than enable most popular articles service, copy your api key, and create the file: [**.env**]() in the root folder and add the following:

```console

SAMPLE_KEY = {put_your_api_here}

```
now you can run the app, and to do so exceute the following command in the root folder of the app:

```console

flutter run

```

## Testing

You can run the tests from vs code as seen in the picture below:

<div align="center">
<img src="https://user-images.githubusercontent.com/60781548/147371647-a5e23543-0451-40ca-b403-ee7ca614f125.png">
</div>

or by the running the following command in the root folder:

```console

flutter test test

```

<div align="center">
<img src="https://user-images.githubusercontent.com/60781548/147371628-5cfaea48-601d-4204-bc67-834cf826a6be.png" width="50%"></img>
</div>

## Builidng the app

To build the application for android please run the following command in the root folder:

```console

flutter build apk --split-per-abi

```

for iOS, I would recommend build it from xcode as you do with native iOS applications.
