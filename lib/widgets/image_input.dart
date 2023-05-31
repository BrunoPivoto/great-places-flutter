import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: const Text('Sem imagem'),
        ),
        const SizedBox(width: 10),
        Expanded(
            child: ElevatedButton.icon(
          icon: const Icon(Icons.camera),
          label: const Text('Tirar foto'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white, //Theme.of(context).colorScheme.secondary,
            elevation: 0,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            // shape: const ContinuousRectangleBorder(),
          ),
          onPressed: () {},
        ))
      ],
    );
  }
}
