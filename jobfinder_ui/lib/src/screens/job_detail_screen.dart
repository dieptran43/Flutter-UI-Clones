// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:jobfinder_ui/src/components/custom_appbar.dart';

import '../components/company_logo.dart';
import '../components/light_icon_box.dart';
import '../components/segmented_control.dart';
import '../data/job_data.dart';

class JobDetailScreen extends StatelessWidget {
  static const routeName = '/job-detail-screen';
  const JobDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jobId = ModalRoute.of(context)!.settings.arguments as int;
    final selectedJob = jobsData.firstWhere((job) => job.id == jobId);

    final textStyle = Theme.of(context).textTheme.headline1!;

    return Scaffold(
      appBar: CustomAppBar(
        onPrefixTap: () {
          Navigator.of(context).pop();

          // Navigator.of(context).pushAndRemoveUntil(
          //     MaterialPageRoute(builder: (context) => const PageNavigator()),
          //     (Route route) => false);
        },
        prefixIcon: IconlyLight.arrow_left_2,
        title: 'Details',
        suffixIcon:
            selectedJob.isSaved ? IconlyBold.bookmark : IconlyLight.bookmark,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    CompanyLogo(
                      imageUrl: selectedJob.imageUrl,
                      size: 80,
                      imageBackground: selectedJob.imageBackground,
                    ),
                    const SizedBox(height: 10),
                    Text(selectedJob.company,
                        style: textStyle.copyWith(fontSize: 20)),
                    const SizedBox(height: 5),
                    Text(selectedJob.title,
                        style:
                            textStyle.copyWith(fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LightIconBox(
                      icon: 'assets/svg/other/location.svg',
                      title: selectedJob.location),
                  LightIconBox(
                      icon: 'assets/svg/other/dollar.svg',
                      title: selectedJob.salary),
                  LightIconBox(
                      icon: 'assets/svg/other/briefcase.svg',
                      title: selectedJob.type.text),
                ],
              ),
              const SegmentedSlider(),
              const SizedBox(height: 60)
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15),
        child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Apply Now',
              style: textStyle.copyWith(color: Colors.white, fontSize: 17),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
