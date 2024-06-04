// cleanup_detail.dart

import 'package:flutter/material.dart';
import 'package:globalsolution/components/bottom_button.dart';
import 'package:globalsolution/models/cleanup_solution_model.dart';
import 'package:globalsolution/pages/gallery.dart';

class CleanupDetail extends StatefulWidget {
  final CleanupSolution clpSolution;
  const CleanupDetail({Key? key, required this.clpSolution}) : super(key: key);

  @override
  State<CleanupDetail> createState() => _CleanupDetailState();
}

class _CleanupDetailState extends State<CleanupDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/${widget.clpSolution.image}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.clpSolution.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        widget.clpSolution.since,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Text(
                        widget.clpSolution.statusDescription,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    widget.clpSolution.description,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 30),
                  BottomButton(
                    buttonTitle: 'View Gallery (${widget.clpSolution.id})',
                    color: Color(0xFFEB1555),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Gallery(images: widget.clpSolution.imagesGallery),
                        ),
                      );
                    },
                  ),
                  BottomButton(
                    buttonTitle: 'Back',
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
