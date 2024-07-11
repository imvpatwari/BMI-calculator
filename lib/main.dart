import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 12, 104, 231)),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var htController = TextEditingController();
  var result='';
  var alert = Colors.white ;
  var msg = '';


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        color: alert,
      child:Center(
        child: Container(
          // color: alert,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('BMI',style: TextStyle(
              fontSize: 34, fontWeight: FontWeight.w700
            ),),

            TextField(
              controller: wtController,
              decoration: const InputDecoration(
                label: Text('Enter  Your Weight(in Kgs)'),
                prefixIcon: Icon(Icons.line_weight),
              ),
              keyboardType: TextInputType.number,
            ),

            TextField(
              controller: htController,
              decoration: const InputDecoration(
                label: Text('Enter Your Height (in Cms )'),
                prefixIcon: Icon(Icons.height)
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed:(){
             var wt = wtController.text.toString();
             var ht = htController.text.toString();

             if(wt!='' && ht!=''){
               
               var iwt = int.parse(wt);
               var iht = int.parse(ht);

               var tm = iht/100;

               var bmi= iwt/(tm*tm);
               var msg = '';

               if(bmi>25){
                msg = "You are Over-Weight";
                alert = Colors.red;
               }else if(bmi<18){
                 msg = "You are Under-Weight";
                alert = Colors.orange;
               }else{
                msg = "You are Fit and Fine";
                alert = Colors.green;
               }
               setState(() {
                 result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                 msg;
               });
             }else{
              setState(() {
                result='Please fill all the details!! ';
              });

             }
            },
            child: Text('Check')),
            
            Text(result,style: TextStyle(fontSize: 20),),
           
          ],
        ),
      )
      )
      )
    );
  }
}
