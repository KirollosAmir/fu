import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fungicide_utilizer_app/BloC/notification/NotificatioEvent.dart';
import 'package:fungicide_utilizer_app/BloC/notification/notificatioBloc.dart';
import 'package:fungicide_utilizer_app/BloC/notification/notificationState.dart';
import 'package:fungicide_utilizer_app/shared/components/drawer.dart';

class Notifcations extends StatefulWidget {
  _Notifcationsstate createState() => _Notifcationsstate();
}

// ignore: camel_case_types
class _Notifcationsstate extends State<Notifcations> {
  NotificationBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<NotificationBloc>(context);
    bloc.add(ViewNotificationsEvent());

    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var imagep =
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fvectors%2Fbell-notification-communication-4924849%2F&psig=AOvVaw3oKSPyolAZb_g_TKOeib-E&ust=1625626326917000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCNiA_o-4zfECFQAAAAAdAAAAABAD";

    // var h = MediaQuery.of(context).size.height;
    // var w = MediaQuery.of(context).size.width;

    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications ',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
      drawer: FarmerDrawer(context),
      body: Center(
        child: BlocBuilder<NotificationBloc, NotificationState>(
            // ignore: missing_return
            builder: (context, state) {
          if (state is NotificationInitialState) {
            return CircularProgressIndicator();
          } else if (state is NotificationLoadingState) {
            return CircularProgressIndicator();
          } else if (state is NotificationSuccessState) {
            return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) =>
                  notificationWidget(
                      imagep,
                      state.notifications[index].id,
                      state.notifications[index].message,
                      state.notifications[index].date),
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 10.0,
              ),
              itemCount: state.notifications.length,
            );
          }
        }),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   var h = MediaQuery.of(context).size.height;
  //   var w = MediaQuery.of(context).size.width;

  //   ScreenUtil.init(context,
  //       designSize: Size(750, 1334), allowFontScaling: false);
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: const Text(
  //           'Notifications ',
  //           textAlign: TextAlign.center,
  //         ),
  //         backgroundColor: Colors.green,
  //       ),
  //       drawer: FarmerDrawer(context),
  //       body: Center(
  //         child: BlocBuilder<NotificationBloc, NotificationState>(
  //           // ignore: missing_return
  //           builder: (context, state) {
  //             if (state is NotificationInitialState) {
  //               return CircularProgressIndicator();
  //             } else if (state is NotificationLoadingState) {
  //               return CircularProgressIndicator();
  //             } else if (state is NotificationSuccessState) {
  //               return Stack(
  //                 children: [
  //                   Padding(
  //                     padding: EdgeInsets.only(top: h * .02),
  //                     child: Container(
  //                       height: h * .9,
  //                       child: ListView.builder(
  //                           itemCount: state.notifications.length,
  //                           itemBuilder: (BuildContext context, int index) {
  //                             return Padding(
  //                                 padding: EdgeInsets.only(
  //                                     bottom: h * 0.02,
  //                                     left: w * .01,
  //                                     right: w * .01),
  //                                 child: Container(
  //                                   height: h * 0.15,
  //                                   width: w * 0.914,
  //                                   decoration: BoxDecoration(
  //                                     color: Colors.grey.withOpacity(.5),
  //                                     borderRadius:
  //                                         BorderRadius.all(Radius.circular(8)),
  //                                   ),
  //                                   child: ListTile(
  //                                     subtitle: Text(
  //                                         "'${state.notifications[index].date}'"),
  //                                     title: Text(
  //                                         "'${state.notifications[index].message}'"),
  //                                   ),
  //                                 ));
  //                           }),
  //                     ),
  //                   )
  //                 ],
  //               );
  //             } else if (state is NotificationErrorState) {
  //               return Text(state.message);
  //             }
  //             // ignore: unused_label
  //             child:
  //             Container();
  //           },
  //         ),
  //       ));
  // }

  Widget notificationWidget(
          String imagepath, String text1, String text2, String text3) =>
      Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(imagepath
                    /*'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'*/),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.only(bottom: 3.0, end: 3.0),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1
                  /*'ali barakat'*/,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        text2
                        /*' hi my name is ali barakat i want to play game with you , i have a experinse for '*/,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Text(text3 /*' 02:00 pm'*/),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
}
