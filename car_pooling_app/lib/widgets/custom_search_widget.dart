import 'package:car_pooling_app/feature/home/controllers/api_controller.dart';
import 'package:car_pooling_app/model/api/place_prediction_model.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
    required this.typeAheadController,
    required this.apiController,
  });

  final TextEditingController typeAheadController;
  final ApiController apiController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // * Actual Search Widget
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TypeAheadField<PlacePredictionModel?>(
            textFieldConfiguration: TextFieldConfiguration(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: 'What are you searching for?',
                labelText: "From",
                suffixIcon: IconButton(
                  onPressed: () {
                    typeAheadController.clear();
                    apiController.placePredictionModel = null;
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
              controller: typeAheadController,
              style: const TextStyle(fontSize: 18),
            ),
            debounceDuration: const Duration(milliseconds: 500),
            suggestionsCallback: (pattern) => apiController.getPredictions(pattern),
            suggestionsBoxDecoration: SuggestionsBoxDecoration(
              borderRadius: BorderRadius.circular(10),
              elevation: 8,
            ),
            loadingBuilder: (context) => const SizedBox(),
            itemBuilder: (context, suggestion) {
              return ListTile(
                shape: ShapeBorder.lerp(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  0.5,
                ),
                style: ListTileStyle.drawer,
                title: Text(suggestion!.description, maxLines: 2, style: const TextStyle(fontSize: 16),),
              );
              
            },
            noItemsFoundBuilder: (context) => const SizedBox(),
            onSuggestionSelected: (suggestion) {
              typeAheadController.text = suggestion!.description;
              apiController.placePredictionModel = suggestion;
            },
          ),
        ),

        // * Switcher Icon
        IconButton(
          onPressed: () => apiController.toggleSearch(),
          icon: const Icon(Icons.swap_vert, size: 30),
        ),

        // * Static Text Field
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Neumorphic(
            curve: Neumorphic.DEFAULT_CURVE,
            style: NeumorphicStyle(depth: NeumorphicTheme.embossDepth(context)),
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
            child: TextFormField(
              readOnly: true,
              initialValue: "Amity University, Noida, Uttar Pradesh",
              style: const TextStyle(fontSize: 18),
              decoration: const InputDecoration.collapsed(
                hintText: "To",
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSearchWidget2 extends StatelessWidget {
  const CustomSearchWidget2({
    super.key,
    required this.typeAheadController,
    required this.apiController,
  });

  final TextEditingController typeAheadController;
  final ApiController apiController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // * Static Text Field
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Neumorphic(
            curve: Neumorphic.DEFAULT_CURVE,
            style: NeumorphicStyle(depth: NeumorphicTheme.embossDepth(context)),
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
            child: TextFormField(
              readOnly: true,
              initialValue: "Amity University, Noida, Uttar Pradesh",
              style: const TextStyle(fontSize: 18),
              decoration: const InputDecoration.collapsed(
                hintText: "From",
              ),
            ),
          ),
        ),

        // * Switcher Icon
        IconButton(
          onPressed: () => apiController.toggleSearch(),
          icon: const Icon(Icons.swap_vert, size: 30),
        ),

        // * Actual Search Widget
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TypeAheadField<PlacePredictionModel?>(
            textFieldConfiguration: TextFieldConfiguration(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: 'What are you searching for?',
                labelText: "To",
                suffixIcon: IconButton(
                  onPressed: () {
                    typeAheadController.clear();
                    apiController.placePredictionModel = null;
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
              controller: typeAheadController,
              style: const TextStyle(fontSize: 18),
            ),
            debounceDuration: const Duration(milliseconds: 500),
            suggestionsCallback: (pattern) => apiController.getPredictions(pattern),
            suggestionsBoxDecoration: SuggestionsBoxDecoration(
              borderRadius: BorderRadius.circular(10),
              elevation: 8,
            ),
            loadingBuilder: (context) => const SizedBox(),
            itemBuilder: (context, suggestion) {
              return ListTile(
                shape: ShapeBorder.lerp(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  0.5,
                ),
                style: ListTileStyle.drawer,
                title: Text(
                  suggestion!.description,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 16),
                ),
              );
            },
            noItemsFoundBuilder: (context) => const SizedBox(),
            onSuggestionSelected: (suggestion) {
              typeAheadController.text = suggestion!.description;
              apiController.placePredictionModel = suggestion;
            },
          ),
        ),
      ],
    );
  }
}
