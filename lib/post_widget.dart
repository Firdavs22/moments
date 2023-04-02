import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PostWidget extends StatefulWidget {
  final String userName;
  final String avatarUrl;
  final String postDate;
  final String location;
  final List<Widget> mediaContent;
  int likeCount;
  int shareCount;
  final String description;
  List<String> comments;
  final double buttonSize;
  final double spacingBetweenButtonsAndCounters;
  final double borderRadius;

  PostWidget({
    Key? key,
    required this.userName,
    required this.avatarUrl,
    required this.postDate,
    required this.location,
    required this.mediaContent,
    required this.likeCount,
    required this.shareCount,
    required this.description,
    required this.comments,
    this.buttonSize = 24.0,
    this.spacingBetweenButtonsAndCounters = 17.0,
    this.borderRadius = 12.0,
  }) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool _isLiked = false;
  bool _isShared = false;
  final TextEditingController _commentController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _showComments = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        widget.likeCount += 1;
      } else {
        widget.likeCount -= 1;
      }
    });
  }

  void _toggleShare() {
    setState(() {
      _isShared = !_isShared;
      if (_isShared) {
        widget.shareCount += 1;
      } else {
        widget.shareCount -= 1;
      }
    });
  }

  void _addComment() {
    setState(() {
      widget.comments.add(_commentController.text);
      _commentController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity != null && details.primaryVelocity! < 0) {
          setState(() {
            _showComments = true;
          });
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.comments.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Post content
                            // Media container
                            Stack(
                              children: [
                                SizedBox(
                                  height: 300,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        widget.borderRadius),
                                    child: Column(
                                      children: widget.mediaContent,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        DateFormat('MMMM d').format(
                                            DateTime.parse(widget.postDate)),
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(widget.userName,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              if (widget.location.isNotEmpty)
                                                Text(widget.location),
                                            ],
                                          ),
                                          const SizedBox(width: 8.0),
                                          CircleAvatar(
                                            backgroundImage:
                                                NetworkImage(widget.avatarUrl),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Buttons
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      NeumorphicButton(
                                        onPressed: _toggleLike,
                                        style: NeumorphicStyle(
                                          boxShape:
                                              NeumorphicBoxShape.roundRect(
                                                  BorderRadius.circular(12)),
                                        ),
                                        child: Icon(
                                          _isLiked
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: _isLiked ? Colors.red : null,
                                          size: widget.buttonSize,
                                        ),
                                      ),
                                      SizedBox(
                                          width: widget
                                              .spacingBetweenButtonsAndCounters),
                                      Text(widget.likeCount.toString()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(widget.shareCount.toString()),
                                      SizedBox(
                                          width: widget
                                              .spacingBetweenButtonsAndCounters),
                                      NeumorphicButton(
                                        onPressed: _toggleShare,
                                        style: NeumorphicStyle(
                                          boxShape:
                                              NeumorphicBoxShape.roundRect(
                                                  BorderRadius.circular(12)),
                                        ),
                                        child: Icon(
                                          Icons.share,
                                          size: widget.buttonSize,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Description and Comments
                            _showComments
                                ? SizedBox(
                                    height:
                                        300.0, // Change the height according to your needs
                                    child: ListView.builder(
                                      itemCount: widget.comments.length + 1,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        if (index == 0) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '${widget.userName}: ${widget.description}'),
                                              const SizedBox(height: 8.0),
                                            ],
                                          );
                                        } else {
                                          int commentIndex = index - 1;
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0,
                                                vertical: 8.0),
                                            child: Text(
                                                widget.comments[commentIndex]),
                                          );
                                        }
                                      },
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 8.0),
                                    child: Text(widget.description),
                                  ),
                          ],
                        );
                      } else {
                        int commentIndex = index - 1;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 8.0),
                          child: Text(widget.comments[commentIndex]),
                        );
                      }
                    },
                  ),
                ),
              ),
// Add comment section
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 32.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12)),
                        ),
                        child: TextField(
                          controller: _commentController,
                          decoration: InputDecoration(
                            hintText: 'Add a comment...',
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    NeumorphicButton(
                      onPressed: _addComment,
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                      ),
                      child: const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
