import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          Text(
            "Save",
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.blue, fontSize: 18),
          ),
          SizedBox(
            width: 20,
          )
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: const Color.fromARGB(255, 119, 119, 118).withOpacity(0.3),
              height: 1.0,
            )),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(80)),
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(
                              "https://media.istockphoto.com/id/1361217779/photo/portrait-of-happy-teenage-boy-at-park.jpg?s=612x612&w=0&k=20&c=yGHZLPu6UWwoj2wazbbepxmjl29MS1Hr2jV3N0FzjyI=",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              bottom: 1,
                              right: 1,
                              child: Container(
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromARGB(255, 94, 94, 94),
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      ),
                      Text(
                        "Change Photo",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 28, 147, 245),
                            fontSize: 18),
                      ),
                    ],
                  )),
              SizedBox(
                height: 30,
              ),
              Text(
                "Personal Information",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Full Name",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 119, 118, 118)
                            .withOpacity(0.5),
                        width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Your Full Name",
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                          fontSize: 18)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Email Address",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 119, 118, 118)
                            .withOpacity(0.5),
                        width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Your Email",
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                          fontSize: 18)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Phone Number",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 119, 118, 118)
                            .withOpacity(0.5),
                        width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Your Mobile Number",
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                          fontSize: 18)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Password",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 119, 118, 118)
                            .withOpacity(0.5),
                        width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Your Full Name",
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Change Password",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                    fontSize: 14),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Banking Information",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 244, 244, 244),
                  ),
                  child: Column(children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Account Holder Name",
                          prefixIcon: Icon(
                            Icons.person,
                            size: 22,
                          ), // Use prefixIcon instead of prefix
                          border: InputBorder.none,
                          isDense:
                              true, // ✅ Fixes vertical alignment of hint text
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 13), // Adjust padding
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Bank Name",
                          prefixIcon: Icon(
                            Icons.dashboard,
                            size: 22,
                          ), // Use prefixIcon instead of prefix
                          border: InputBorder.none,
                          isDense:
                              true, // ✅ Fixes vertical alignment of hint text
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 13), // Adjust padding
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Account Number",
                          prefixIcon: Icon(
                            Icons.credit_card,
                            size: 22,
                          ), // Use prefixIcon instead of prefix
                          border: InputBorder.none,
                          isDense:
                              true, // ✅ Fixes vertical alignment of hint text
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 13), // Adjust padding
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "IFSC Code",
                          prefixIcon: Icon(
                            Icons.key,
                            size: 22,
                          ), // Use prefixIcon instead of prefix
                          border: InputBorder.none,
                          isDense:
                              true, // ✅ Fixes vertical alignment of hint text
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 13), // Adjust padding
                        ),
                      ),
                    ),
                  ])),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 244, 244, 244),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 249, 142, 1),
                            ),
                            child: Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Account Status",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        Text(
                          "Pending Verification",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Colors.amber),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    "Delete Account",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
