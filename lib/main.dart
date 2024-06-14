import 'package:car_accessories_ecommerce/bulk_add_funcs.dart';
import 'package:car_accessories_ecommerce/models/fun_fact.dart';
import 'package:car_accessories_ecommerce/models/quote.dart';
import 'package:car_accessories_ecommerce/models/trivia.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brainloom Admin',
      home: Scaffold(
        body: Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () {
                  // BulkAddFuncs.addFunfacts(funFacts);
                },
                child: const Text(
                  "add elements",
                  style: TextStyle(color: Colors.white),
                ))),
      ),
    );
  }
}

List<FunFact> funFacts = [
  FunFact(
    id: const Uuid().v1(),
    content:
        "During World War II, the British Army created a 'Ghost Army' of inflatable tanks and vehicles to deceive the enemy.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "The shortest war in history lasted between the British Empire and Zanzibar on August 27, 1896, lasting only 38 minutes.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "Julius Caesar was once kidnapped by pirates who demanded a ransom of 20 talents of silver. He insisted they ask for 50.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content: "The ancient Romans used urine to whiten their teeth.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "The Great Fire of London in 1666 started in a bakery on Pudding Lane.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "Mozart wrote a piece of music titled 'Leck mich im Arsch,' which translates to 'Lick me in the arse.'",
  ),
  FunFact(
    id: const Uuid().v1(),
    content: "The Aztecs used cocoa beans as currency.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "The Great Emu War was fought in Australia in 1932, where soldiers were sent to cull emus that were damaging crops.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content: "Ancient Egyptians slept on pillows made of stone.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content: "The world's oldest known recipe is for beer.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "In 1962, the United States detonated a nuclear bomb in space, creating an artificial aurora borealis.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "Cleopatra VII of Egypt lived closer in time to the moon landing than to the construction of the Great Pyramid of Giza.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "During World War I, a Canadian soldier, John McCrae, wrote the famous poem 'In Flanders Fields' on the battlefield.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "Napoleon Bonaparte was once attacked by a horde of rabbits during a hunting trip.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "The ancient Greeks used to exercise in the nude during the Olympics.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "The Eiffel Tower was originally intended to be a temporary installation for the 1889 World's Fair in Paris.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "The Boston Tea Party of 1773 saw American colonists disguise themselves as Mohawk Indians before dumping British tea into the harbor.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "Albert Einstein's brain was preserved after his death in 1955 for scientific research purposes.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "The first computer programmer was a woman named Ada Lovelace, who worked on Charles Babbage's early mechanical general-purpose computer.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "Ancient Romans used human urine as mouthwash because the ammonia acted as a cleaning agent.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "During the Middle Ages, chicken suits were used to put defendants on trial in France.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "The Soviet Union had a semi-automatic anti-tank dog program during World War II, where dogs were trained to carry explosives to enemy tanks.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "Ancient Egyptians shaved off their eyebrows to mourn the deaths of their cats.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "The Great Wall of China is not visible from space with the naked eye.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "The longest war in history, known as the Hundred Years' War, lasted for 116 years, from 1337 to 1453.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "Thomas Edison, inventor of the light bulb, was afraid of the dark.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "The tradition of wearing wedding rings dates back to ancient Egypt, where they believed the ring finger had a vein that connected directly to the heart.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "The first use of the term 'OMG' (Oh My God) was in a letter to Winston Churchill in 1917.",
  ),
  FunFact(
    id: const Uuid().v1(),
    content:
        "During World War II, the British intelligence service MI5 created a plan to use exploding rats to destroy German boilers.",
  ),
];
