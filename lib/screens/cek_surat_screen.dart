import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CekSuratScreen extends StatefulWidget {
  final ValueChanged<int> onNavigateTab;

  const CekSuratScreen({super.key, required this.onNavigateTab});

  @override
  State<CekSuratScreen> createState() => _CekSuratScreenState();
}

class _CekSuratScreenState extends State<CekSuratScreen> {
  bool _expandPoint1 = false;
  bool _expandPoint2 = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. TOP PILL BADGE & HEADER
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF7CC4F8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.verified_user_outlined,
                    size: 15, color: AppColors.darkNavy),
                SizedBox(width: 6),
                Text(
                  'Pemeriksa Dokumen Terbuka',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkNavy,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Pindai & Cek Surat Berbahaya',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Periksa kontrak kerja, surat utang pinjol, atau somasi. Kenali jebakan bahasa hukum rumit secara instan.',
            style: TextStyle(
              fontSize: 13.5,
              color: AppColors.textSecondary,
              height: 1.45,
            ),
          ),

          const SizedBox(height: 18),

          // 2. UPLOAD DOCUMENT CARD
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F6FB),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFDBEAFE)),
            ),
            child: Column(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    color: AppColors.softBlueBadge,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.document_scanner_rounded,
                      color: AppColors.primaryNavy, size: 28),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Foto atau Masukkan Surat Anda',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Pastikan tulisan di lembaran surat terlihat terang, tidak buram, dan mudah terbaca.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Membuka kamera untuk memindai surat...')),
                      );
                    },
                    icon: const Icon(Icons.camera_alt_outlined, size: 20),
                    label: const Text('Ambil Foto Surat dengan Ponsel'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryNavy,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      textStyle: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Memilih gambar atau file PDF...')),
                      );
                    },
                    icon: const Icon(Icons.upload_file_rounded, size: 20),
                    label: const Text('Pilih dari Galeri atau File PDF'),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primaryNavy,
                      side: const BorderSide(color: Color(0xFFCBD5E1)),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      textStyle: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lock_outline_rounded,
                        size: 15, color: Color(0xFFA16207)),
                    SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        'Data surat dienkripsi & terlindungi kerahasiaannya',
                        style: TextStyle(
                          fontSize: 11.5,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // 3. DOKUMEN TERAKHIR DIPERIKSA
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.find_in_page_outlined,
                      size: 20, color: AppColors.primaryNavy),
                  SizedBox(width: 8),
                  Text(
                    'Dokumen Terakhir\nDiperiksa',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
              Text(
                '2 menit yang\nlalu',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 11.5,
                  color: AppColors.textMuted,
                  height: 1.25,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // 4. ANALYSIS RESULT CARD
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Document Info
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.softBlueBg,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.article_outlined,
                          color: AppColors.primaryNavy, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.softBlueBadge,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.check_circle_outline_rounded,
                                    size: 13, color: AppColors.primaryNavy),
                                SizedBox(width: 4),
                                Text(
                                  'Selesai Dianalisis',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryNavy,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Kategori: Utang Piutang',
                            style: TextStyle(
                              fontSize: 11.5,
                              color: AppColors.textMuted,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Surat Perjanjian Pinjaman Tunai Koperasi',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                              height: 1.25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Lampu Indikator Keamanan Dokumen
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Lampu Indikator Keamanan Dokumen',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.warning_amber_rounded,
                            size: 16, color: AppColors.redDanger),
                        SizedBox(width: 4),
                        Text(
                          '1 Titik Berbahaya',
                          style: TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w800,
                            color: AppColors.redDanger,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Indicator 1: RED
                _IndicatorAlertBox(
                  bgColor: AppColors.softRedBg,
                  icon: Icons.error_rounded,
                  iconColor: AppColors.redDanger,
                  titleColor: AppColors.redDanger,
                  textColor: AppColors.redDarkText,
                  title: 'Peringatan: Bunga Denda Melampaui Batas Wajar',
                  body:
                      'Denda keterlambatan tertera 1.2%/hari (Batas wajar aturan AFPI/OJK maksimal 0.3%/hari). Klausul ini berpotensi mencekik peminjam.',
                  trailing: const Icon(Icons.chevron_right_rounded,
                      color: AppColors.redDanger, size: 20),
                ),
                const SizedBox(height: 10),

                // Indicator 2: YELLOW
                _IndicatorAlertBox(
                  bgColor: AppColors.softYellowBg,
                  icon: Icons.warning_rounded,
                  iconColor: AppColors.amberDark,
                  titleColor: AppColors.textPrimary,
                  textColor: AppColors.textPrimary,
                  title: 'Klausul Pelepasan Hak Data Kontak Pribadi',
                  body:
                      'Pasal 7 menyatakan Anda memberi izin menghubungi kontak keluarga/teman jika telat bayar. Hak privasi Anda ditarik secara sepihak.',
                  trailing: const Icon(Icons.chevron_right_rounded,
                      color: AppColors.amberDark, size: 20),
                ),
                const SizedBox(height: 10),

                // Indicator 3: BLUE
                _IndicatorAlertBox(
                  bgColor: AppColors.softBlueBg,
                  icon: Icons.check_circle_rounded,
                  iconColor: AppColors.primaryNavy,
                  titleColor: AppColors.darkNavy,
                  textColor: AppColors.textSecondary,
                  title: 'Pemberi Pinjaman Terdaftar Resmi',
                  body:
                      'Badan hukum terverifikasi legal dan memiliki izin operasional simpan pinjam aktif dari otoritas terkait.',
                  trailing: const Icon(Icons.check_circle_outline_rounded,
                      color: AppColors.primaryNavy, size: 18),
                ),

                const SizedBox(height: 18),

                // 3 Hal Pokok yang Wajib Anda Tahu
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '3 Hal Pokok yang Wajib Anda Tahu',
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    Text(
                      'Bahasa Sehari-hari',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryNavy,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Accordion 1
                _ExpandableKeyPoint(
                  number: '1',
                  title: 'Apa Kewajiban Utama Anda?',
                  isExpanded: _expandPoint1,
                  onToggle: () =>
                      setState(() => _expandPoint1 = !_expandPoint1),
                  expandedContent: const Text(
                    'Membayar cicilan pokok beserta bunga sesuai jadwal yang disepakati dalam perjanjian resmi.',
                    style: TextStyle(
                      fontSize: 12.5,
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Accordion 2
                _ExpandableKeyPoint(
                  number: '2',
                  title: 'Apa Risikonya Jika Telat Bayar?',
                  isExpanded: _expandPoint2,
                  onToggle: () =>
                      setState(() => _expandPoint2 = !_expandPoint2),
                  expandedContent: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hukum Indonesia melarang sita paksa motor, barang rumah tangga, atau intimidasi verbal di luar putusan resmi pengadilan.',
                        style: TextStyle(
                          fontSize: 12.5,
                          color: AppColors.textSecondary,
                          height: 1.45,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.softBlueBg,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.gavel_rounded,
                                size: 17, color: AppColors.primaryNavy),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Sita sepihak oleh penagih utang lapangan (debt collector) merupakan tindak pidana perampasan.',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.darkNavy,
                                  height: 1.35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                // Rekomendasi Tindakan Kami
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.softYellowBg,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.error_rounded,
                              color: AppColors.amberDark, size: 20),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Rekomendasi Tindakan Kami',
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w800,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_up_rounded,
                              color: AppColors.amberDark),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.remove_circle_rounded,
                                color: AppColors.redDanger, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    color: AppColors.textPrimary,
                                    height: 1.45,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'JANGAN tanda tangan ',
                                      style: TextStyle(
                                        color: AppColors.redDanger,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          'sebelum meminta penghapusan klausul akses kontak darurat keluarga dan meminta denda harian diturunkan sesuai batas OJK.',
                                    ),
                                  ],
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
          ),

          const SizedBox(height: 16),

          // 5. BOTTOM FULL CTA BUTTON
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => widget.onNavigateTab(1),
              icon: const Icon(Icons.forum_outlined, size: 20),
              label: const Text('Tanya Asisten AI Mengenai Surat Ini'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryNavy,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IndicatorAlertBox extends StatelessWidget {
  final Color bgColor;
  final IconData icon;
  final Color iconColor;
  final Color titleColor;
  final Color textColor;
  final String title;
  final String body;
  final Widget trailing;

  const _IndicatorAlertBox({
    required this.bgColor,
    required this.icon,
    required this.iconColor,
    required this.titleColor,
    required this.textColor,
    required this.title,
    required this.body,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: titleColor,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: TextStyle(
                    fontSize: 12,
                    color: textColor,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          trailing,
        ],
      ),
    );
  }
}

class _ExpandableKeyPoint extends StatelessWidget {
  final String number;
  final String title;
  final bool isExpanded;
  final VoidCallback onToggle;
  final Widget expandedContent;

  const _ExpandableKeyPoint({
    required this.number,
    required this.title,
    required this.isExpanded,
    required this.onToggle,
    required this.expandedContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.softBlueBadge,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      number,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primaryNavy,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: AppColors.primaryNavy,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: expandedContent,
            ),
        ],
      ),
    );
  }
}