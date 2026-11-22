import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class _CaseItem {
  final String filter;
  final String categoryLabel;
  final String lawTag;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String desc;
  final String step;
  final IconData stepIcon;

  const _CaseItem({
    required this.filter,
    required this.categoryLabel,
    required this.lawTag,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.desc,
    required this.step,
    required this.stepIcon,
  });
}

class BerandaScreen extends StatefulWidget {
  final ValueChanged<int> onNavigateTab;

  const BerandaScreen({super.key, required this.onNavigateTab});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  String _selectedCategory = 'Semua Masalah';

  final _categories = const [
    'Semua Masalah',
    'Pinjol & Utang',
    'Kerja & Gaji',
    'Agraria & Waris',
    'Penipuan Digital',
  ];

  final _cases = const [
    _CaseItem(
      filter: 'Pinjol & Utang',
      categoryLabel: 'Ancaman Pinjol Ilegal',
      lawTag: 'UU PDP & OJK',
      icon: Icons.gavel_rounded,
      iconBg: Color(0xFFFEE2E2),
      iconColor: Color(0xFFDC2626),
      title: 'Pinjaman Online Menagih Kasar & Teror Kontak',
      desc:
          'Penagih dilarang menyebarkan data pribadi Anda ke nomor lain. Anda berhak menolak teror dan melapor ke Satgas Waspada Investasi.',
      step: 'Langkah 1: Jangan Panik, Kumpulkan Bukti Chat',
      stepIcon: Icons.shield_outlined,
    ),
    _CaseItem(
      filter: 'Kerja & Gaji',
      categoryLabel: 'Ketenagakerjaan',
      lawTag: 'UU Cipta Kerja',
      icon: Icons.work_outline_rounded,
      iconBg: Color(0xFFFEF3C7),
      iconColor: Color(0xFFB45309),
      title: 'Di-PHK Sepihak Tanpa Diberikan Uang Pesangon',
      desc:
          'Pekerja tetap dan kontrak memiliki hak atas pesangon atau uang kompensasi kerja. Perusahaan tidak boleh memecat tanpa alasan sah.',
      step: 'Langkah 1: Minta Surat Alasan Resmi PHK',
      stepIcon: Icons.description_outlined,
    ),
    _CaseItem(
      filter: 'Agraria & Waris',
      categoryLabel: 'Agraria & Waris',
      lawTag: 'Hukum Adat & Perdata',
      icon: Icons.landscape_outlined,
      iconBg: Color(0xFFDBEAFE),
      iconColor: AppColors.primaryNavy,
      title: 'Sengketa Batas Tanah & Hak Waris Keluarga',
      desc:
          'Hindari ribut fisik. Mintalah mediasi resmi di hadapan Kepala Desa/Lurah dan Badan Pertanahan Nasional (BPN) setempat.',
      step: 'Langkah 1: Bawa Bukti Girik/Sertifikat ke Desa',
      stepIcon: Icons.handshake_outlined,
    ),
    _CaseItem(
      filter: 'Penipuan Digital',
      categoryLabel: 'Penipuan Digital',
      lawTag: 'UU ITE & KUHP',
      icon: Icons.shopping_cart_outlined,
      iconBg: Color(0xFFDBEAFE),
      iconColor: AppColors.primaryNavy,
      title: 'Tertipu Belanja Online atau Arisan Bodong',
      desc:
          'Rekening penipu bisa diblokir oleh pihak bank sebelum uang ditarik bila Anda segera membawa bukti percakapan dan transfer.',
      step: 'Langkah 1: Telepon Call Center Bank Pengirim',
      stepIcon: Icons.account_balance_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredCases = _selectedCategory == 'Semua Masalah'
        ? _cases
        : _cases.where((c) => c.filter == _selectedCategory).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. HERO BANNER
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF0E5692), Color(0xFF003B6F)],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x22003B6F),
                  blurRadius: 16,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Stack(
              children: [
                const Positioned(
                  right: -12,
                  bottom: -14,
                  child: Icon(
                    Icons.balance_rounded,
                    size: 130,
                    color: Color.fromRGBO(255, 255, 255, 0.08),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.14),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.verified_rounded,
                                color: Color(0xFFFDE047), size: 15),
                            SizedBox(width: 6),
                            Text(
                              'Bantuan Hukum Terbuka & Ramah',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Halo Warga, Apa yang Sedang Membebani Pikiran Anda?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w800,
                          height: 1.28,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Semua orang berhak mengerti hukum tanpa rasa takut dan tanpa biaya mahal. Kami temani langkah Anda.',
                        style: TextStyle(
                          color: Color(0xFFE0F2FE),
                          fontSize: 13,
                          height: 1.45,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // 2. LAYANAN BANTUAN TERBUKA
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.apps_rounded,
                      color: AppColors.primaryNavy, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Layanan Bantuan\nTerbuka',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
              Text(
                'Pilih bantuan\nAnda',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textMuted,
                  height: 1.25,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _ServiceGridCard(
                  icon: Icons.edit_note_rounded,
                  iconBg: const Color(0xFFFDE68A),
                  iconColor: const Color(0xFF92400E),
                  title: 'Bikin Surat Laporan',
                  subtitle: 'Format aduan resmi, panduan isi mudah',
                  onTap: () => widget.onNavigateTab(3),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ServiceGridCard(
                  icon: Icons.document_scanner_rounded,
                  iconBg: const Color(0xFFD6ECFA),
                  iconColor: AppColors.primaryNavy,
                  title: 'Cek & Foto Surat',
                  subtitle: 'Analisis pasal & cek potensi jebakan',
                  onTap: () => widget.onNavigateTab(2),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Card Tanya Hukum Santai
          InkWell(
            onTap: () => widget.onNavigateTab(1),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.cardBorder),
              ),
              child: const Row(
                children: [
                  _ChatIconBox(),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tanya Hukum Santai',
                          style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Ubah pasal rumit jadi obrolan santai & solusi cepat',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Row(
                    children: [
                      Text(
                        'Mulai',
                        style: TextStyle(
                          color: AppColors.primaryNavy,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 3),
                      Icon(Icons.arrow_forward_rounded,
                          size: 16, color: AppColors.primaryNavy),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 3. KARTU PENDAMPINGAN WARGA
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.softBlueBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFDBEAFE)),
            ),
            child: Row(
              children: [
                Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1E3A8A), Color(0xFF00447B)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.groups_rounded,
                          color: Color(0xFFFDE68A), size: 30),
                      SizedBox(height: 2),
                      Text(
                        'LBH',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pendampingan Warga',
                        style: TextStyle(
                          color: AppColors.primaryNavy,
                          fontSize: 11.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Hak Anda Sama di Hadapan Hukum',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Jangan biarkan oknum menakut-nakuti Anda dengan ancaman pasal palsu.',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // 4. MASALAH YANG SERING DIALAMI
          const Row(
            children: [
              Icon(Icons.search_rounded,
                  color: AppColors.primaryNavy, size: 22),
              SizedBox(width: 8),
              Text(
                'Masalah yang Sering Dialami',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Filter Chips Horizontal
          SizedBox(
            height: 38,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final cat = _categories[index];
                final isSelected = cat == _selectedCategory;
                return ChoiceChip(
                  label: Text(cat),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() {
                      _selectedCategory = cat;
                    });
                  },
                  showCheckmark: false,
                  selectedColor: AppColors.primaryNavy,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : AppColors.textSecondary,
                    fontSize: 12.5,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: isSelected
                          ? AppColors.primaryNavy
                          : AppColors.cardBorder,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 14),

          // Case Cards List
          ...filteredCases.map((item) => _CaseCard(
                item: item,
                onReadSolution: () => widget.onNavigateTab(1),
              )),

          const SizedBox(height: 8),

          // 5. CLOSING KINDNESS & DISCLAIMER CARD
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_rounded,
                        color: Color(0xFFA16207), size: 20),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Catatan Penuh Kebaikan dari Tim Keadilan Terbuka',
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Aplikasi ini dibuat khusus untuk mempermudah pemahaman awal masalah hukum Anda secara mandiri. Kami meringankan beban pikiran Anda dengan pengetahuan dasar yang benar.',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: AppColors.textSecondary,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.softBlueBg,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFBFDBFE)),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.verified_user_outlined,
                          color: AppColors.primaryNavy, size: 18),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Untuk proses persidangan resmi di pengadilan, gunakan bantuan advokat resmi dari LBH terakreditasi.',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkNavy,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatIconBox extends StatelessWidget {
  const _ChatIconBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.softBlueBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.chat_bubble_rounded,
        color: AppColors.primaryNavy,
        size: 22,
      ),
    );
  }
}

class _ServiceGridCard extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ServiceGridCard({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: iconBg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: iconColor, size: 22),
                ),
                const Icon(Icons.north_east_rounded,
                    size: 18, color: AppColors.textMuted),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
                height: 1.25,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11.5,
                color: AppColors.textSecondary,
                height: 1.35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CaseCard extends StatelessWidget {
  final _CaseItem item;
  final VoidCallback onReadSolution;

  const _CaseCard({required this.item, required this.onReadSolution});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: item.iconBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(item.icon, color: item.iconColor, size: 16),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item.categoryLabel,
                  style: TextStyle(
                    color: item.iconColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.softBlueBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  item.lawTag,
                  style: const TextStyle(
                    color: AppColors.primaryNavy,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            item.desc,
            style: const TextStyle(
              fontSize: 12.5,
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(height: 1, color: Color(0xFFF1F5F9)),
          ),
          Row(
            children: [
              Icon(item.stepIcon, size: 16, color: AppColors.primaryNavy),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  item.step,
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: onReadSolution,
                child: const Row(
                  children: [
                    Text(
                      'Baca Solusi',
                      style: TextStyle(
                        color: AppColors.primaryNavy,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded,
                        size: 18, color: AppColors.primaryNavy),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}