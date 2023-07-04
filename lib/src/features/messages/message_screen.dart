import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:Whispers/src/configs/palette.dart';
import 'package:Whispers/src/cubit/detail_chanel_state.dart';
import 'package:Whispers/src/data/remote/upload_file_api.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';
import 'package:Whispers/src/features/messages/components/image_picker_screen.dart';
import 'package:Whispers/src/navigator/app_navigator.dart';
import 'package:Whispers/src/navigator/routers.dart';
import 'package:Whispers/src/share_components/loading/loading.dart';
import 'package:Whispers/src/share_components/share_componets.dart';
import 'package:Whispers/src/utils/helpers/logger.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:microphone/microphone.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../cubit/check_messages_cubit.dart';
import '../../configs/box.dart';
import '../../cubit/detail_chanel_cubit.dart';
import '../../data/model/api_response/param_message_model.dart';
import '../../data/model/message_model.dart';
import '../../share_components/time/time_extension.dart';

import 'components/message.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({required this.param, Key? key}) : super(key: key);
  final ParamMesage param;
  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final DetailChanelCubit detailChanelCubit = getIt<DetailChanelCubit>();
  final CheckMessagesCubit checkMessagesCubit = getIt<CheckMessagesCubit>();
  final UploadFileApi uploadFileApi = getIt<UploadFileApi>();

  int _page = 1;
  final int _size = 20;
  int _totalPage = 1;
  TextEditingController contenController = TextEditingController();
  TextEditingController textInputMessage = TextEditingController();
  FocusNode textInputMessageFouce = FocusNode();
  List<ContentMessage> _listMessageChanel = [];
  late ScrollController _sc;
  List<Viewer> _viewer = [];
  late Timer timer;
  bool isValidate = false;
  @override
  void initState() {
    // timer = Timer.periodic(const Duration(seconds: 3), (timer) {
    //   _initData();
    // });
    _initData();
    _checkMess();

    _sc = ScrollController()
      ..addListener(() {
        if (_sc.position.atEdge == true && _sc.position.pixels == 0 && _page < _totalPage) {
          _loadMore();
        }
      });
    super.initState();
  }

  void _loadMore() {
    Logger.d("page", _page);
    detailChanelCubit.getListMessageChanel(page: _page, size: _size, content: contenController.text, channelId: widget.param.chanel.id ?? '');
    _page++;
  }

  void _initData() async {
    _page = 1;
    _totalPage = 1;
    _listMessageChanel = [];
    _viewer = [];
    detailChanelCubit.getListMessageChanel(page: _page, size: _size, content: contenController.text, channelId: widget.param.chanel.id ?? '');
  }

  void _checkMess() async {
    checkMessagesCubit.checkMessages(
      channelId: widget.param.chanel.id ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DetailChanelCubit, DetailChanelState>(
      bloc: detailChanelCubit,
      listener: (context, state) {
        state.maybeMap(
          orElse: () => const Empty(),
          loading: (value) => const Loading(),
          failure: (value) => const Empty(),
          success: (value) {
            _totalPage = value.data.message?.totalPages ?? 1;
            _viewer.addAll(value.data.viewer as Iterable<Viewer>);
            if (value.data.message?.content != null) {
              _listMessageChanel.addAll(value.data.message?.content?.reversed.toList() as Iterable<ContentMessage>);
            }

            setState(() {});
            Logger.d("lenght", _listMessageChanel.length);
          },
        );
      },
      child: Scaffold(
        appBar: buildAppBar(),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  controller: _sc,
                  itemCount: _listMessageChanel.length,
                  itemBuilder: (context, index) => Message(message: _listMessageChanel[index], listViewer: _viewer),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16 / 2,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 32,
                    color: const Color(0xFF087949).withOpacity(0.08),
                  ),
                ],
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    const Icon(Icons.mic, color: Palette.primary),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Palette.primary.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                MicrophoneRecorder recorder = MicrophoneRecorder();
                                await recorder.start();
                                await Future.delayed(const Duration(seconds: 5));
                                await recorder.stop();
                                Uint8List data = await recorder.toBytes();
                                Logger.d("Data mic", utf8.decode(data));
                              },
                              icon: Icon(
                                Icons.sentiment_satisfied_alt_outlined,
                                color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.64),
                              ),
                            ),
                            BoxMain.w(4),
                            Expanded(
                              child: TextField(
                                focusNode: textInputMessageFouce,
                                controller: textInputMessage,
                                decoration: const InputDecoration(
                                  hintText: "Type message",
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    setState(() {
                                      isValidate = true;
                                    });
                                  } else {
                                    setState(() {
                                      isValidate = false;
                                    });
                                  }
                                },
                              ),
                            ),
                            if (isValidate != true)
                              IconButton(
                                  onPressed: () async {
                                    FilePickerResult? result = await FilePicker.platform.pickFiles();
                                    if (result != null) {
                                      String? filePath = result.files.single.path;
                                      if (filePath != null) {
                                        final data = await uploadFileApi.upload(filePath, result.files.single.name, 'PUBLIC');
                                        Logger.d("data", data.toString());
                                      }
                                    }
                                  },
                                  icon: Icon(
                                    Icons.attach_file,
                                    color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.64),
                                  )),
                            if (isValidate != true)
                              IconButton(
                                // onPressed: () => openImagePicker(context),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const CupertinoAlertDialog(
                                          title: Text('Tải ảnh lên'),
                                          content: Text("Chọn một ảnh để tải ảnh lên"),
                                          actions: [ImagePickerButton()],
                                        );
                                      });
                                },
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.64),
                                ),
                              ),
                            if (isValidate == true)
                              IconButton(
                                // onPressed: () => openImagePicker(context),
                                onPressed: () {
                                  Logger.d("seen");
                                },
                                icon: Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.64),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          InkWell(
            onTap: () => AppNavigator.push(
              Routes.channelDetailScreen,
              arguments: widget.param.chanel,
            ),
            child: widget.param.chanel.avatarUrl != null
                ? CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(widget.param.chanel.avatarUrl ?? ''),
                  )
                : const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage("assets/images/user.png"),
                  ),
          ),
          BoxMain.w(6 * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.param.chanel.name ?? '',
                style: AppFont.t.w600.white,
              ),
              Text(
                  "Hoạt động ${calculateTimeDifference(DateTime.fromMillisecondsSinceEpoch(widget.param.chanel.lastMessage?.updatedTime ?? 0).toLocal(), DateTime.now().toLocal())} trước",
                  style: AppFont.t.s(12).white)
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.local_phone),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.videocam),
          onPressed: () {},
        ),
        BoxMain.w(4),
      ],
    );
  }

  void openImagePicker(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Đã chọn một ảnh từ máy ảnh thành công
      File image = File(pickedFile.path);

      // Xử lý ảnh ở đây (ví dụ: tải lên server, lưu vào thư mục khác, ...)
      // ...

      // Hiển thị ảnh đã chọn
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Selected Image'),
            content: Image.file(image),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Người dùng không chọn ảnh
    }
  }

  Future<bool> requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      var result = await Permission.camera.request();
      return result.isGranted;
    }
    return status.isGranted;
  }
}
