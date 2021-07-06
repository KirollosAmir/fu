import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/crops_bloc/crops_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/crops_bloc/crops_events.dart';
import 'package:fungicide_utilizer_app/BloC/crops_bloc/crops_states.dart';
import 'package:fungicide_utilizer_app/shared/components/drawer.dart';

class AllCropsPage extends StatefulWidget {
  _AllCropsPagestate createState() => _AllCropsPagestate();
}

class _AllCropsPagestate extends State<AllCropsPage> {
  PageController controller = PageController();
  // ignore: non_constant_identifier_names
  var ListData = ['My land '];
  bool checkPage = false;
  CropsBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<CropsBloc>(context);

    bloc.add(ViewCropEvent());

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
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crops',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
      drawer: FarmerDrawer(context),
      //resizeToAvoidBottomPadding: false,
      body: Center(
        // ignore: missing_return
        child: BlocBuilder<CropsBloc, CropsStates>(builder: (context, state) {
          if (state is InitialState) {
            return CircularProgressIndicator();
          } else if (state is LoadingState) {
            return CircularProgressIndicator();
          } else if (state is ViewCropsSuccess) {
            return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => cropwidget(
                  imagep,
                  state.crops[index].name,
                  state.crops[index].id,
                  state.crops[index].id),
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 15.0,
              ),
              itemCount: 3,
            );
          }
        }),
      ),
    );
  }

  Widget cropwidget(
          String imagepath, String text1, String text3, String text4) =>
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
                        text3
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
                    Text(text4 /*' 02:00 pm'*/),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  // @override
  // Widget build(BuildContext context) {
  //   var h = MediaQuery.of(context).size.height;
  //   var w = MediaQuery.of(context).size.width;

  //   ScreenUtil.init(context,
  //       designSize: Size(750, 1334), allowFontScaling: false);
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: const Text(
  //           'Crops',
  //           textAlign: TextAlign.center,
  //         ),
  //         backgroundColor: Colors.green,
  //       ),
  //       drawer: FarmerDrawer(context),
  //       //resizeToAvoidBottomPadding: false,
  //       body: Center(
  //         child:
  //             BlocListener<CropsBloc, CropsStates>(listener: (context, state) {
  //           if (state is InitialState) {
  //             return CircularProgressIndicator();
  //           } else if (state is LoadingState) {
  //             return CircularProgressIndicator();
  //           } else if (state is ViewCropsSuccess) {
  //             return Stack(
  //               children: [
  //                 Column(
  //                   children: [
  //                     Container(
  //                       child: Container(
  //                         height: h * .6,
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.all(Radius.circular(10)),
  //                         ),
  //                         child: ListView.builder(
  //                             itemCount: state.crops.length,
  //                             itemBuilder: (BuildContext context, int index) {
  //                               return Container(
  //                                 child: InkWell(
  //                                   child: Card(
  //                                     child: ListTile(
  //                                       title:
  //                                           Text('${state.crops[index].name}'),
  //                                       subtitle:
  //                                           Text('${state.crops[index].id}'),
  //                                     ),
  //                                   ),
  //                                   onTap: () {
  //                                     checkPage = true;
  //                                     // bloc.add(ViewCropEvent());
  //                                   },
  //                                 ),
  //                               );
  //                             }),
  //                       ),
  //                     ),
  //                   ],
  //                 )
  //               ],
  //             );
  //           } else if (state is ErrorState) {
  //             return Text(state.message);
  //           }
  //         }),
  //         // child: BlocBuilder<CropsBloc, CropsStates>(
  //         //     // ignore: missing_return
  //         //     builder: (context, state) {
  //         //   if (state is InitialState) {
  //         //     return CircularProgressIndicator();
  //         //   } else if (state is LoadingState) {
  //         //     return CircularProgressIndicator();
  //         //   } else if (state is ViewCropsSuccess) {
  //         //     return Stack(
  //         //       children: [
  //         //         Column(
  //         //           children: [
  //         //             Container(
  //         //               child: Container(
  //         //                 height: h * .6,
  //         //                 decoration: BoxDecoration(
  //         //                   borderRadius: BorderRadius.all(Radius.circular(10)),
  //         //                 ),
  //         //                 child: ListView.builder(
  //         //                     itemCount: state.crops.length,
  //         //                     itemBuilder: (BuildContext context, int index) {
  //         //                       return Container(
  //         //                         child: InkWell(
  //         //                           child: Card(
  //         //                             child: ListTile(
  //         //                               title:
  //         //                                   Text('${state.crops[index].name}'),
  //         //                               subtitle:
  //         //                                   Text('${state.crops[index].id}'),
  //         //                             ),
  //         //                           ),
  //         //                           onTap: () {
  //         //                             checkPage = true;
  //         //                             // bloc.add(ViewCropEvent());
  //         //                           },
  //         //                         ),
  //         //                       );
  //         //                     }),
  //         //               ),
  //         //             ),
  //         //           ],
  //         //         )
  //         //       ],
  //         //     );
  //         //   } else if (state is ErrorState) {
  //         //     return Text(state.message);
  //         //   }
  //         // }),
  //       ));
  // }

}
