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
      widget.likeCount += _isLiked ? 1 : -1;
    });
  }

  void _toggleShare() {
    setState(() {
      _isShared = !_isShared;
      widget.shareCount += _isShared ? 1 : -1;
    });
  }

  void _addComment() {
    if (_commentController.text.trim().isNotEmpty) {
      setState(() {
        widget.comments.add(_commentController.text.trim());
        _commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Post content
                    // Media container
                    Stack(
                      children: [
                        SizedBox(
                          height: 300,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius),
                            child: PageView(
                              children: widget.mediaContent,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat('MMMM d')
                                    .format(DateTime.parse(widget.postDate)),
                                style: const TextStyle(fontSize: 14),
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(widget.userName,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              NeumorphicButton(
                                onPressed: _toggleLike,
                                style: NeumorphicStyle(
                                  boxShape: NeumorphicBoxShape.roundRect(
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
                                  width:
                                      widget.spacingBetweenButtonsAndCounters),
                              Text(widget.likeCount.toString()),
                            ],
                          ),
                          Row(
                            children: [
                              Text(widget.shareCount.toString()),
                              SizedBox(
                                  width:
                                      widget.spacingBetweenButtonsAndCounters),
                              NeumorphicButton(
                                onPressed: _toggleShare,
                                style: NeumorphicStyle(
                                  boxShape: NeumorphicBoxShape.roundRect(
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
                    // Description
                    GestureDetector(
                      onVerticalDragUpdate: (details) {
                        if (details.delta.dy < 0) {
                          setState(() {
                            _showComments = true;
                          });
                        } else if (details.delta.dy > 0) {
                          setState(() {
                            _showComments = false;
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: Text(widget.description),
                      ),
                    ),
                    // Comments
                    AnimatedCrossFade(
                      firstChild: Container(),
                      secondChild: Container(
                        height:
                            300.0, // Change the height according to your needs
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${widget.userName}: ${widget.description}'),
                            Flexible(
                              fit: FlexFit.loose,
                              child: ListView.builder(
                                itemCount: widget.comments.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(widget.comments[index]),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      crossFadeState: _showComments
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 300),
                    ),
                    // Comment input field and send button
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 77.0),
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
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
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
          ],
        ),
      ),
    );
  }
}
