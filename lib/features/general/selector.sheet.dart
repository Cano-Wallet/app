// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:supercharged/supercharged.dart';

// import '../../core/utils/my_loggy.dart';
// import '../animations/animations.dart';
// import '../tokens/token.controller.dart';
// import 'sheet_dismiss_indicator.widget.dart';

// dynamic selectedData;

// class SelectorSheet extends StatelessWidget with MyLoggy {
//   final String title;
//   final String subTitle;
//   final Axis direction;
//   final List<SelectorItem> items;
//   final List<dynamic> values;
//   final dynamic activeId;
//   final double height;

//   SelectorSheet({
//     this.title = '',
//     this.subTitle = '',
//     this.direction = Axis.vertical,
//     this.items,
//     this.values,
//     this.activeId,
//     this.height,
//   });

//   Future<dynamic> show() async {
//     TokenController.to.spend("show_selector_sheet", value: 1);

//     selectedData = null;

//     await Get.bottomSheet(
//       height == null ? this : SizedBox(height: height, child: this),
//       isScrollControlled: height != null,
//       backgroundColor: Get.isDarkMode ? Color(0xFF171717) : Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(15),
//           topRight: Radius.circular(15),
//         ),
//       ),
//     );

//     return selectedData;
//   }

//   @override
//   Widget build(BuildContext context) {
//     var _items = items;

//     if (values != null) {
//       _items = values
//           .map(
//             (e) => SelectorItem(
//               title: e.toString(),
//               id: e,
//               data: e,
//             ),
//           )
//           .toList();
//     }

//     Widget _itemBuilder(context, index) {
//       final data = _items[index];

//       void _onTap() {
//         Get.back();
//         selectedData = data?.data ?? data.id;
//         data?.onSelected?.call();
//         loggy.info('selected: $selectedData');
//       }

//       Widget _content;

//       if (direction == Axis.vertical) {
//         _content = ListTile(
//           title: Text(data.title,
//               style:
//                   const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
//           subtitle: data.subTitle != null
//               ? Text(data.subTitle, style: const TextStyle(color: Colors.grey))
//               : null,
//           leading: data.leading,
//           trailing: activeId != null && data?.id == activeId
//               ? Icon(Icons.check_circle, color: Get.theme.accentColor)
//               : null,
//           onTap: _onTap,
//         );
//       } else if (direction == Axis.horizontal) {
//         _content = Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: InkWell(
//             child: Column(
//               children: <Widget>[
//                 data.leading,
//                 const SizedBox(height: 10),
//                 Text(data.title,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 15))
//               ],
//             ),
//             onTap: _onTap,
//           ),
//         );
//       }

//       return ListItemAnimation(
//         child: _content,
//         axis: direction,
//         delay: 100.milliseconds,
//         duration: 300.milliseconds,
//       );
//     }

//     return Padding(
//       padding: EdgeInsets.all(15),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           SheetTopBar(title, subTitle),
//           Flexible(
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: _items.length,
//               itemBuilder: _itemBuilder,
//               scrollDirection: direction,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SheetTopBar extends StatelessWidget {
//   final String title;
//   final String subTitle;
//   const SheetTopBar([this.title = '', this.subTitle = '']);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SheetDimissIndicator(),
//         if (title.isNotEmpty) ...[
//           const SizedBox(height: 5),
//           Text(
//             title.toUpperCase(),
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 5),
//           if (subTitle.isNotEmpty) ...[
//             Text(
//               subTitle,
//               style: const TextStyle(fontSize: 10),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 5)
//           ]
//         ],
//       ],
//     );
//   }
// }

// class SelectorItem {
//   final String title;
//   final String subTitle;
//   final Widget leading;
//   final dynamic id;
//   final dynamic data;
//   final Function onSelected;

//   SelectorItem({
//     this.title,
//     this.subTitle,
//     this.leading,
//     this.id,
//     this.data,
//     this.onSelected,
//   });
// }
