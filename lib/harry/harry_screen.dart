import 'dart:math';
import 'package:calculator/harry/harry_model/harry_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HarryScreen extends StatefulWidget {
  const HarryScreen({super.key});

  @override
  State<HarryScreen> createState() => _HarryScreenState();
}

class _HarryScreenState extends State<HarryScreen> {

  final ValueNotifier<List<HarryModel>> dataNotifier = ValueNotifier<List<HarryModel>>([]);
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  int _currentIndex = 0;
  final List<String> _endpoints = ['characters', 'books', 'houses', 'spells'];

  @override
  void initState(){
    super.initState();
    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(child: ValueListenableBuilder(valueListenable: isLoading, builder: (context, loading, _){
        if(loading) return const Center(child: CircularProgressIndicator(color: Color(0xFFD4AF37)));
        return ValueListenableBuilder(valueListenable: dataNotifier, builder: (context, data, _){
          if(data.isEmpty) return const Center(child: Text('Error', style: TextStyle(color: Colors.white)));
          switch(_currentIndex){
            case 0: return _buildStudyTab(data);
            case 1: return _buildNewsTab(data);
            case 2: return _buildMapTab(data);
            case 3: return _buildShopTab(data);
            default:return const SizedBox();
          }
        });
      })),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildStudyTab(List<HarryModel> data){
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Professor of Hogwarts', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),
              Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18,),
            ],
          ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: data.length,
              itemBuilder: (context, index) => _buildProfessorAvatar(data[index]),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(20),
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: const DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1547756536-cde3673fa2e5?q=80&w=1000&auto=format&fit=crop'),
              fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(20),
            child: const Text('Gryffindor Faculty', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
          ),
        ),
        SliverPadding(padding: const EdgeInsets.symmetric(horizontal: 20),
        sliver: SliverGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1.1,
          children: [
            _buildSmallCard('Library', const Color(0xFF0056D2), Icons.menu_book),
            _buildSmallCard('Your schedule', const Color(0xFF333333), Icons.calendar_today),
          ],
        ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20,),)
      ],
    );
  }

  Widget _buildNewsTab(List<HarryModel> data){
    return ListView.builder(itemCount: data.length, padding: const EdgeInsets.all(16), itemBuilder: (context, index){
      final book = data[index];
      return Card(
        color: Colors.white10, margin: const EdgeInsets.only(bottom: 16),
        child: ListTile(leading: const Icon(Icons.book, color: Color(0xFFD4AF37),),
        title: Text(book.title ?? 'Error', style: const TextStyle(color: Colors.white),),
          subtitle: Text('Release: ${book.releaseDate ?? 'Unknown'}', style: const TextStyle(color: Colors.white60),),
        ),
      );
    },);
  }

  Widget _buildMapTab(List<HarryModel> data){
    return GridView.builder(padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: data.length,
        itemBuilder: (context, index){
        final item = data[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.fort, color: Color(0xFFD4AF37), size: 50,),
              const SizedBox(height: 10,),
              Text(item.house ?? 'Unknown', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
            ],
          ),
        );
        });
  }

  Widget _buildShopTab(List<HarryModel> data){
    return ListView.separated(padding: const EdgeInsets.all(16), itemCount: data.length, separatorBuilder: (_, __) => const Divider(
      color: Colors.white10,
    ),
      itemBuilder: (context, index){
      final item = data[index];
      return ListTile(title: Text(item.spell ?? 'Unknown', style: const TextStyle(color: Color(0xFFD4AF37),
      fontWeight: FontWeight.bold),),
      subtitle: Text(item.use ?? 'Error', style: const TextStyle(color: Colors.white70),),
        trailing: const Icon(Icons.flash_on, color: Colors.blue,),
      );
      },
    );
  }



  Widget _buildBottomNav(){
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index){
        setState(() => _currentIndex = index);
        getHttp();
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFF1A1A1A),
      selectedItemColor: const Color(0xFFD4AF37),
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Study'),
        BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Shop'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }

  Widget _buildProfessorAvatar(HarryModel item){
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: const Color(0xFFD4AF37),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(item.image ?? ''),
          ),
        ),
        const SizedBox(height: 4,),
        SizedBox(
          width: 70,
          child: Text(item.nickname ?? item.fullName ?? '', overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        )
      ],
    ),
    );
  }

  Widget _buildSmallCard(String title, Color  color, IconData icon){
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: Colors.white, size: 30,),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }


  Future<void> getHttp() async {
    isLoading.value = true;
    try {
      final dio = Dio();
      final response = await dio.get('https://potterapi-fedeperin.vercel.app/en/${_endpoints[_currentIndex]}');
      final List<dynamic> rawData = response.data;
      dataNotifier.value = rawData.map((e) => HarryModel.fromJson(e)).toList();
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }



}