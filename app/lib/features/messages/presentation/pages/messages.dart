import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tak/core/constants/assets.dart';
import 'package:tak/core/services/get_it_services.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/utils/extensions.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/core/widgets/tak_along_loading.dart';
import 'package:tak/features/messages/domain/entities/messages_entity.dart';
import 'package:tak/features/messages/presentation/bloc/message_bloc.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MessageBloc>(
      create: (context) => getIt<MessageBloc>()..add(FetchMessagesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Messages',
          ),
        ),
        body: BlocBuilder<MessageBloc, MessageState>(
          builder: (context, state) {
            if (state is MessageLoadedState) {
              List<MessageEntity> messageEntity = state.messages;
              if (messageEntity.isEmpty) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 250.w,
                        height: 250.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(messageGif),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Gap(16.h),
                      Text(
                        'No Messages Available',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      )
                    ],
                  ),
                );
              } else {
                return Container(
                  padding: EdgeInsets.all(10.w),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: messageEntity.length,
                    itemBuilder: (context, index) {
                      bool isSameDate = true;
                      final String dateString = messageEntity[index].createdAt;
                      final DateTime date = DateTime.parse(dateString);
                      if (index == 0) {
                        isSameDate = false;
                      } else {
                        final String prevDateString =
                            messageEntity[index - 1].createdAt;
                        final DateTime prevDate =
                            DateTime.parse(prevDateString);
                        isSameDate = date.isSameDate(prevDate);
                      }
                      if (index == 0 || !(isSameDate)) {
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Gap(8.h),
                              Text(
                                date.formatDate(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              Gap(8.h),
                              MessageCard(message: messageEntity[index]),
                            ]);
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Gap(8.h),
                            MessageCard(message: messageEntity[index]),
                          ],
                        );
                      }
                    },
                  ),
                );
              }
            } else {
              return TakLoading(
                color: Brightness.dark == Theme.of(context).brightness
                    ? white
                    : dark,
              );
            }
          },
        ),
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    required this.message,
  });

  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      margin: EdgeInsets.all(0.w),
      child: Container(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    message.title,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    convertDateToAgo(message.createdAt),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              ],
            ),
            Text(
              message.message,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
