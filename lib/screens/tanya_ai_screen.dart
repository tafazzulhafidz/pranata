import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TanyaAiScreen extends StatefulWidget {
  final ValueChanged<int> onNavigateTab;

  const TanyaAiScreen({super.key, required this.onNavigateTab});

  @override
  State<TanyaAiScreen> createState() => _TanyaAiScreenState();
}

class _TanyaAiScreenState extends State<TanyaAiScreen> {
  final TextEditingController _chatController = TextEditingController();
  bool? _isHelpful;

  final List<String> _followUpQuestions = [
    'Bagaimana cara lapor ke Disnaker?',
    'Berapa lama proses mediasi bipartit?',
    'Rumus hitung pesangon 2 tahun kerja?',
  ];

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. PERSONA HEADER CARD
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryNavy,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.support_agent_rounded,
                              color: Colors.white, size: 24),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 13,
                            height: 13,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEAB308),
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sahabat Keadilan',
                            style: TextStyle(
                              fontSize: 15.5,
                              fontWeight: FontWeight.w800,
                              color: AppColors.primaryNavy,
                            ),
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              Icon(Icons.circle,
                                  size: 8, color: Color(0xFFCA8A04)),
                              SizedBox(width: 5),
                              Text(
                                'Bahasa Santun & Awam',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.softBlueBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.verified_user_outlined,
                          size: 18, color: AppColors.primaryNavy),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Pendamping hukum pribadi. Bebas istilah rumit, langsung solusi.',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.darkNavy,
                            fontWeight: FontWeight.w500,
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

          // 2. SESSION BADGE
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Hari Ini • Sesi Konsultasi Kerja',
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkNavy,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 3. USER QUESTION BUBBLE
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Pertanyaan Anda',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.account_circle_outlined,
                  size: 16, color: AppColors.textSecondary),
            ],
          ),
          const SizedBox(height: 6),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.84,
              ),
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                color: AppColors.skyBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(4),
                ),
              ),
              child: const Text(
                'Pak/Bu, saya kerja di pabrik 2 tahun tapi tiba-tiba disuruh berhenti tanpa pesangon dan surat resmi. Saya harus bagaimana?',
                style: TextStyle(
                  fontSize: 13.5,
                  color: AppColors.darkNavy,
                  fontWeight: FontWeight.w600,
                  height: 1.45,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '09:41 WIB • Terbaca',
                style: TextStyle(fontSize: 11, color: AppColors.textMuted),
              ),
              SizedBox(width: 4),
              Icon(Icons.done_all_rounded,
                  size: 15, color: AppColors.primaryNavy),
            ],
          ),

          const SizedBox(height: 14),

          // 4. AI RESPONSE SECTION
          const Row(
            children: [
              Icon(Icons.smart_toy_outlined,
                  size: 18, color: AppColors.primaryNavy),
              SizedBox(width: 6),
              Text(
                'Jawaban Sahabat Keadilan',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryNavy,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.cardBorder),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0A0F172A),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Intro Reassurance Box
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.softBlueBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.sentiment_satisfied_alt_rounded,
                          color: AppColors.primaryNavy, size: 22),
                      const SizedBox(width: 10),
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textPrimary,
                              height: 1.4,
                            ),
                            children: [
                              TextSpan(
                                text: 'Jangan panik ya, ',
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              TextSpan(
                                text:
                                    'Anda tidak sendirian. Mari kita amankan hak Anda langkah demi langkah secara sederhana:',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Step 1
                const _NumberedAdviceStep(
                  number: '1',
                  title: 'Jangan Tanda Tangani Surat Apapun Dulu',
                  body:
                      'Tolak halus jika diminta menandatangani formulir "Pengunduran Diri Sukarela". Jika Anda tanda tangan itu, Anda bisa kehilangan hak pesangon.',
                ),
                const SizedBox(height: 14),

                // Step 2
                _NumberedAdviceStep(
                  number: '2',
                  title: 'Anda Punya Hak Uang Pesangon',
                  richBody: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        height: 1.45,
                      ),
                      children: [
                        TextSpan(
                            text:
                                'Karena sudah bekerja 2 tahun, menurut aturan ketenagakerjaan resmi Anda berhak menerima '),
                        TextSpan(
                          text: 'Uang Pesangon',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary),
                        ),
                        TextSpan(text: ' dan '),
                        TextSpan(
                          text: 'Penghargaan Masa Kerja.',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                // Step 3
                const _NumberedAdviceStep(
                  number: '3',
                  title: 'Langkah Awal: Musyawarah Bipartit',
                  body:
                      'Ajak pimpinan bicara resmi secara damai. Buat surat undangan pertemuan resmi. Ini bukti sah pertama Anda jika urusan berlanjut ke dinas.',
                ),

                const SizedBox(height: 16),

                // Yellow CTA Box
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
                          Icon(Icons.lightbulb_rounded,
                              color: AppColors.amberDark, size: 20),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              'Bantuan Langsung Tanpa Ribet',
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w800,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Kami bisa buatkan contoh surat undangan Bipartit langsung dengan nama pabrik Anda dalam 1 menit:',
                        style: TextStyle(
                          fontSize: 12.5,
                          color: AppColors.textPrimary,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => widget.onNavigateTab(3),
                          icon: const Icon(Icons.edit_document, size: 18),
                          label: const Text('Buat Surat Bipartit Sekarang'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryNavy,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                // Feedback Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Apakah penjelasan ini jelas?',
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Row(
                      children: [
                        _FeedbackCircleBtn(
                          icon: Icons.thumb_up_alt_outlined,
                          active: _isHelpful == true,
                          onTap: () => setState(() => _isHelpful = true),
                        ),
                        const SizedBox(width: 8),
                        _FeedbackCircleBtn(
                          icon: Icons.thumb_down_alt_outlined,
                          active: _isHelpful == false,
                          onTap: () => setState(() => _isHelpful = false),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),
          const Text(
            '09:42 WIB • Dihitung otomatis',
            style: TextStyle(fontSize: 11, color: AppColors.textMuted),
          ),

          const SizedBox(height: 18),

          // 5. SUGGESTED FOLLOW-UP QUESTIONS
          const Row(
            children: [
              Icon(Icons.psychology_alt_outlined,
                  size: 18, color: AppColors.primaryNavy),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Pilih Pertanyaan Lanjutan yang Sering Ditanyakan:',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 38,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _followUpQuestions.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                return ActionChip(
                  avatar: Icon(
                    index == 0
                        ? Icons.help_outline_rounded
                        : Icons.access_time_rounded,
                    size: 16,
                    color: AppColors.primaryNavy,
                  ),
                  label: Text(_followUpQuestions[index]),
                  onPressed: () {
                    _chatController.text = _followUpQuestions[index];
                  },
                  backgroundColor: AppColors.softBlueBg,
                  labelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryNavy,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Color(0xFFBFDBFE)),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 14),

          // 6. INPUT BAR
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _chatController,
                  decoration: InputDecoration(
                    hintText: 'Tanyakan masalah Anda disini',
                    hintStyle: const TextStyle(
                        fontSize: 13.5, color: AppColors.textMuted),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: AppColors.cardBorder),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: AppColors.cardBorder),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  if (_chatController.text.trim().isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Mengirim pertanyaan: "${_chatController.text.trim()}"'),
                      ),
                    );
                    _chatController.clear();
                  }
                },
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primaryNavy,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.send_rounded,
                      color: Colors.white, size: 20),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // 7. TRANSPARENCY NOTE
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFEDF2F7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.info_outline_rounded,
                    size: 18, color: AppColors.textMuted),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 11.5,
                        color: AppColors.textSecondary,
                        height: 1.4,
                      ),
                      children: [
                        TextSpan(
                          text: 'Catatan Transparansi: ',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        TextSpan(
                          text:
                              'Jawaban AI disederhanakan dari undang-undang resmi Indonesia (UU Ketenagakerjaan & Cipta Kerja) untuk panduan awal warga. Bukan pengganti penetapan hakim pengadilan.',
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
    );
  }
}

class _NumberedAdviceStep extends StatelessWidget {
  final String number;
  final String title;
  final String? body;
  final Widget? richBody;

  const _NumberedAdviceStep({
    required this.number,
    required this.title,
    this.body,
    this.richBody,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 26,
          height: 26,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.softBlueBadge,
            shape: BoxShape.circle,
          ),
          child: Text(
            number,
            style: const TextStyle(
              color: AppColors.primaryNavy,
              fontWeight: FontWeight.w800,
              fontSize: 12.5,
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
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryNavy,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 4),
              if (richBody != null)
                richBody!
              else
                Text(
                  body ?? '',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    height: 1.45,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FeedbackCircleBtn extends StatelessWidget {
  final IconData icon;
  final bool active;
  final VoidCallback onTap;

  const _FeedbackCircleBtn({
    required this.icon,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: active ? AppColors.primaryNavy : AppColors.softBlueBg,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 16,
          color: active ? Colors.white : AppColors.primaryNavy,
        ),
      ),
    );
  }
}