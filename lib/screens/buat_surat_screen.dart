import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class _LetterTypeItem {
  final String title;
  final String subtitle;
  final String desc;
  final IconData icon;
  final String headerDoc;
  final String recipient;

  const _LetterTypeItem({
    required this.title,
    required this.subtitle,
    required this.desc,
    required this.icon,
    required this.headerDoc,
    required this.recipient,
  });
}

class BuatSuratScreen extends StatefulWidget {
  const BuatSuratScreen({super.key});

  @override
  State<BuatSuratScreen> createState() => _BuatSuratScreenState();
}

class _BuatSuratScreenState extends State<BuatSuratScreen> {
  int _selectedLetterIndex = 0;
  int _sktmOption = 0;

  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _storyController;

  final _letterTypes = const [
    _LetterTypeItem(
      title: 'Permohonan Pengacara Gratis (Posbakum)',
      subtitle: 'Format resmi Pengadilan Negeri / LBH',
      desc:
          'Digunakan saat menghadapi panggilan polisi, gugatan sidang, atau sengketa dan tidak memiliki biaya pengacara.',
      icon: Icons.gavel_rounded,
      headerDoc: 'SURAT PERMOHONAN BANTUAN HUKUM CUMA-CUMA',
      recipient:
          'Ketua Pos Bantuan Hukum (Posbakum)\nPengadilan Negeri Setempat',
    ),
    _LetterTypeItem(
      title: 'Pengaduan Pemotongan Gaji / PHK',
      subtitle: 'Tujuan Pimpinan Perusahaan & Disnaker',
      desc:
          'Digunakan untuk mengajukan musyawarah bipartit atau pengaduan perselisihan hubungan kerja ke Disnaker.',
      icon: Icons.work_outline_rounded,
      headerDoc: 'SURAT PERMOHONAN PERUNDINGAN BIPARTIT / PHK',
      recipient: 'Pimpinan HRD / Manajemen Perusahaan\ndi Tempat',
    ),
    _LetterTypeItem(
      title: 'Penolakan Penagihan Ilegal Pinjol',
      subtitle: 'Merujuk UU PDP & Aturan Resmi POJK',
      desc:
          'Digunakan untuk memperingatkan penagih yang menyebarkan data kontak pribadi atau melakukan intimidasi.',
      icon: Icons.shield_outlined,
      headerDoc: 'SURAT KEBERATAN & SOMASI PENAGIHAN ILEGAL',
      recipient: 'Penyelenggara Layanan Pinjaman Online /\nOtoritas Jasa Keuangan',
    ),
    _LetterTypeItem(
      title: 'Surat Kuasa Dokumen Keluarga',
      subtitle: 'Format sah bermeterai untuk urusan sipil',
      desc:
          'Digunakan untuk memberi kuasa pengurusan dokumen kependudukan, perbankan, atau administrasi keluarga.',
      icon: Icons.family_restroom_rounded,
      headerDoc: 'SURAT KUASA KHUSUS URUSAN KELUARGA',
      recipient: 'Instansi Terkait / Pelayanan Publik\ndi Tempat',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Siti Rahmawati')
      ..addListener(() => setState(() {}));
    _phoneController = TextEditingController(text: '085712349876')
      ..addListener(() => setState(() {}));
    _storyController = TextEditingController(
      text:
          'Saya pedagang kaki lima di pasar kemis. Kemarin barang dagangan disita tanpa surat tugas resmi dan diminta tebusan 2 juta rupiah oleh oknum. Saya butuh bantuan',
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _storyController.dispose();
    super.dispose();
  }

  String get _economicStatusText {
    if (_sktmOption == 0) {
      return 'Berpenghasilan Tidak Tetap (Melampirkan SKTM)';
    } else if (_sktmOption == 1) {
      return 'Berpenghasilan Tidak Tetap (SKTM Dalam Proses)';
    }
    return 'Berpenghasilan Tidak Tetap (Pengantar RT/RW)';
  }

  @override
  Widget build(BuildContext context) {
    final activeLetter = _letterTypes[_selectedLetterIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. TOP PILL BADGE & HEADER
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFD6ECFA),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.verified_rounded,
                    size: 15, color: AppColors.primaryNavy),
                SizedBox(width: 6),
                Text(
                  '100% Bebas Biaya & Sah Hukum',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryNavy,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Buat Surat Resmi Tanpa Pusing Format & Bahasa Hukum',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Cukup isi formulir singkat 3 pertanyaan, surat langsung jadi dan siap dicetak atau dikirim via WhatsApp ke pihak terkait.',
            style: TextStyle(
              fontSize: 13.5,
              color: AppColors.textSecondary,
              height: 1.45,
            ),
          ),

          const SizedBox(height: 16),

          // 2. YELLOW UU POSBAKUM INFO BOX
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.softYellowBg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFACC15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.shield_outlined,
                      size: 17, color: AppColors.amberDark),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hak Warga Negara yang Dijamin UU',
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Negara mewajibkan bantuan hukum gratis bagi masyarakat pra-sejahtera lewat Pos Bantuan Hukum (Posbakum).',
                        style: TextStyle(
                          fontSize: 12.5,
                          color: AppColors.textPrimary,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 3. PILIH JENIS SURAT
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.folder_open_rounded,
                      size: 20, color: AppColors.primaryNavy),
                  SizedBox(width: 8),
                  Text(
                    'Pilih Jenis Surat',
                    style: TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              Text(
                'Geser pilihan',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryNavy,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          ...List.generate(_letterTypes.length, (index) {
            final item = _letterTypes[index];
            final isSelected = index == _selectedLetterIndex;
            return GestureDetector(
              onTap: () => setState(() => _selectedLetterIndex = index),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.softBlueBg : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primaryNavy
                        : AppColors.cardBorder,
                    width: isSelected ? 1.5 : 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primaryNavy
                                : AppColors.softBlueBg,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            item.icon,
                            color: isSelected
                                ? Colors.white
                                : AppColors.primaryNavy,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: isSelected
                                      ? AppColors.primaryNavy
                                      : AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item.subtitle,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          isSelected
                              ? Icons.check_circle_rounded
                              : Icons.chevron_right_rounded,
                          color: isSelected
                              ? AppColors.primaryNavy
                              : AppColors.textMuted,
                        ),
                      ],
                    ),
                    if (isSelected) ...[
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          item.desc,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),

          const SizedBox(height: 14),

          // 4. STEP 1 FORM CARD
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Progress
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: AppColors.softBlueBg,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Langkah 1 dari 3',
                            style: TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w800,
                              color: AppColors.primaryNavy,
                            ),
                          ),
                          Text(
                            '33% Selesai',
                            style: TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryNavy,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: const LinearProgressIndicator(
                          value: 0.33,
                          minHeight: 7,
                          backgroundColor: Color(0xFFCBD5E1),
                          valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primaryNavy),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Data Diri & Cerita Masalah',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        'Ketik dengan tenang atau cukup tekan tombol mikrofon jika lelah mengetik.',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Input 1
                      const Text(
                        '1. Nama Lengkap (Sesuai KTP) *',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.person_outline_rounded,
                              color: AppColors.textMuted),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Input 2
                      const Text(
                        '2. Nomor WhatsApp / HP yang Aktif *',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.phone_outlined,
                              color: AppColors.textMuted),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Input 3
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '3. Ceritakan Masalah Anda Singkat Saja *',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          Text(
                            'Bahasa Santai',
                            style: TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryNavy,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _storyController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.mic_none_rounded,
                                color: AppColors.primaryNavy),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Input suara diaktifkan...')),
                              );
                            },
                          ),
                          contentPadding: const EdgeInsets.all(14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Input 4: SKTM Radio Options
                      const Text(
                        '4. Apakah Anda memiliki SKTM dari Kelurahan?',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        'Syarat wajib agar Posbakum Pengadilan membebaskan seluruh biaya jasa advokat.',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 10),

                      _SktmOptionTile(
                        title: 'Sudah Punya SKTM',
                        icon: Icons.verified_outlined,
                        selected: _sktmOption == 0,
                        onTap: () => setState(() => _sktmOption = 0),
                      ),
                      const SizedBox(height: 8),
                      _SktmOptionTile(
                        title: 'Belum Punya / Baru Mau Buat',
                        icon: Icons.description_outlined,
                        selected: _sktmOption == 1,
                        onTap: () => setState(() => _sktmOption = 1),
                      ),
                      const SizedBox(height: 8),
                      _SktmOptionTile(
                        title: 'Bantu Saya Buat Surat Pengantar RT/RW',
                        icon: Icons.note_add_outlined,
                        selected: _sktmOption == 2,
                        onTap: () => setState(() => _sktmOption = 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // 5. PANDUAN MENGURUS SKTM DI KELURAHAN
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F6FB),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFDBEAFE)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.badge_outlined,
                        color: AppColors.primaryNavy, size: 22),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Panduan Mengurus SKTM di Kelurahan',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  'Gratis tanpa dipungut biaya retribusi apapun:',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 12),
                _SktmGuideStepCard(
                  step: '1',
                  title: 'Surat Pengantar RT & RW',
                  desc:
                      'Bawa fotokopi KTP & Kartu Keluarga ke Ketua RT/RW setempat minta tanda tangan pengantar tidak mampu.',
                ),
                SizedBox(height: 8),
                _SktmGuideStepCard(
                  step: '2',
                  title: 'Bawa ke Kantor Kelurahan',
                  desc:
                      'Serahkan ke loket Pelayanan Terpadu. Petugas memeriksa dan mencetak lembar resmi SKTM berstempel dinas.',
                ),
                SizedBox(height: 8),
                _SktmGuideStepCard(
                  step: '3',
                  title: 'Lampirkan Bersama Surat Ini',
                  desc:
                      'Serahkan ke petugas Posbakum di Pengadilan Negeri setempat untuk mendapatkan kuasa hukum gratis.',
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // 6. PRATINJAU DRAF SURAT OTOMATIS (LIVE PREVIEW)
          const Text(
            'Pratinjau Draf Surat Otomatis',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFCBD5E1)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0C0F172A),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    activeLetter.headerDoc,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Jakarta, 14 Mei 2024',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 11,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Kepada Yth.\n${activeLetter.recipient}',
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 11.5,
                    color: AppColors.textPrimary,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Saya yang bertanda tangan di bawah ini:',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 11.5,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Nama   : ${_nameController.text.isEmpty ? "-" : _nameController.text}',
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  'No. HP : ${_phoneController.text.isEmpty ? "-" : _phoneController.text}',
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  'Status : $_economicStatusText',
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Dengan ini memohon penunjukan advokat pendampingan secara cuma-cuma demi terwujudnya keadilan yang seadil-adilnya...',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 11.5,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(height: 1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Dasar Hukum: UU No. 16 Tahun 2011',
                      style: TextStyle(
                        fontSize: 10.5,
                        color: AppColors.textMuted,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.softBlueBg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Tinggal Tanda Tangan',
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryNavy,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // 7. BOTTOM ACTION BUTTONS
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Menyiapkan draf surat siap unduh (PDF)...')),
                );
              },
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Lanjutkan & Lihat Surat Siap Unduh'),
                  SizedBox(width: 6),
                  Icon(Icons.arrow_forward_rounded, size: 18),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.support_agent_rounded, size: 20),
              label: const Text('Butuh Bantuan Mengisi? Hubungi Pendamping LBH'),
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.softBlueBg,
                foregroundColor: AppColors.primaryNavy,
                side: const BorderSide(color: Color(0xFFBFDBFE)),
                padding: const EdgeInsets.symmetric(vertical: 13),
                textStyle: const TextStyle(
                  fontSize: 12.5,
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

class _SktmOptionTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _SktmOptionTile({
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
        decoration: BoxDecoration(
          color: selected ? AppColors.softBlueBg : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.primaryNavy : AppColors.cardBorder,
          ),
        ),
        child: Row(
          children: [
            Icon(icon,
                size: 18,
                color: selected ? AppColors.primaryNavy : AppColors.textMuted),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            Icon(
              selected
                  ? Icons.radio_button_checked_rounded
                  : Icons.radio_button_off_rounded,
              size: 20,
              color: selected ? AppColors.primaryNavy : AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}

class _SktmGuideStepCard extends StatelessWidget {
  final String step;
  final String title;
  final String desc;

  const _SktmGuideStepCard({
    required this.step,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.primaryNavy,
              shape: BoxShape.circle,
            ),
            child: Text(
              step,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                    height: 1.35,
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