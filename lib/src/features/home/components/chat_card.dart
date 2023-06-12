
import 'package:Whispers/src/configs/palette.dart';
import 'package:Whispers/src/cubit/get_list_chanel_cubit.dart';
import 'package:Whispers/src/cubit/get_list_chanel_state.dart';
import 'package:Whispers/src/data/model/get_list_chanel_model.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';
import 'package:Whispers/src/share_components/empty/empty.dart';
import 'package:Whispers/src/share_components/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/Chat.dart';

class ChatCard extends StatefulWidget {
  const ChatCard({Key? key, required this.chat, required this.press, required this.isStatus}) : super(key: key);

  final Chat chat;
  final VoidCallback press;
  final bool isStatus;

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  final int _page = 1;
  final int _size = 10;
  final getChanelListCubit = getIt<GetListChanelCubit>();
  List<Chanel> listChanel = [];

  @override
  void initState() {
    getChanelListCubit.getListChanel(page: _page, size: _size, status: 1);
    super.initState();
  }

  @override
  void dispose() {
    getChanelListCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetListChanelCubit, GetListChanelState>(
      bloc: getChanelListCubit,
      listener: (context, state) {
        state.maybeMap(
          orElse: () => const Empty(),
          loading: (value) => const Loading(),
          succes: (value) {

          },
          failure: (value) => const Empty(),
        );
      },
      child: Scaffold(
        body: Column(
          children: [...listChanel.map((e) => lisData(chanel: e))],
        ),
      ),
    );
  }

  Widget lisData({required Chanel chanel}) {
    return InkWell(
      onTap: widget.press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16 * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(widget.chat.image),
                ),
                if (widget.chat.isActive)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: Palette.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 3),
                      ),
                    ),
                  )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chat.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        widget.isStatus ? widget.chat.lastMessage : 'Whispers',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Text(widget.isStatus ? widget.chat.time : ''),
            ),
          ],
        ),
      ),
    );
  }
}
