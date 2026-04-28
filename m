Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABE32F12CE
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 07:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777362787; cv=none; b=cyHxvdkv3r5GexV2XGS4Wxzrj34H5i6aJwbpSMdY8mIS8ViSOd+gj3uBlmHqs8ulguBYlK8nv3OOLu3ESo/d0TtsD6hNXrjGWWz0A2MRLPVXXv0NxnYXdzzWIEnb1a5AGfW6phVWEvvzg1kQ4hmmhF+BDcCLx+DeGKdzhz2UiRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777362787; c=relaxed/simple;
	bh=CMbZ3UZ51wUt/OqkanNY1McjM1VKjd3VuGmjqOXa4xQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OHni3VlR6gEifo0oYLb5MiJSYxfGoIbaPpaXkgfggY8VMk5K8gwsAIY4lywVfYBzHzvkNqmEurxK4SrjTNA4yH3v2O3QGTof31aajFNv63jvf5vAKC7lDesFEn+HRDMEh6U6+cW0kRTaCn/ZCNh4vbqRjCSeOnsGs8HtbMYk3SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=D9xI5xfZ; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="D9xI5xfZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777362773;
	bh=hifZccl4UUVkokoQ7F+yfhjPArxUGpePQm29xbyRzmU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=D9xI5xfZ77zJqGtpbJVrcKSSr7LjzEJ4lzhts5efAHsgwuHX2m+eZ1zcIR41elJYS
	 utoRKlhgAdN9a6TXxboR9vvELsjWKbDjdWTod0TgJmzw+MqefrgLM6XyXG8O/zfXId
	 QtFDOixEFXWkDe5gxAXZx6g6rcEQX7Rmn8v4dlNo=
X-QQ-mid: esmtpsz16t1777362758t3fa55279
X-QQ-Originating-IP: ZbyGpVhXMTG02PSKDj1QpSCP9oHtrosoSlkbm90o7ug=
Received: from localhost.localdomain ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Apr 2026 15:52:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2831806909750899838
EX-QQ-RecipientCnt: 5
From: Qiang Ma <maqianga@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Qiang Ma <maqianga@uniontech.com>
Subject: [PATCH] LoongArch: Refactor the Features output in show_cpuinfo()
Date: Tue, 28 Apr 2026 15:52:31 +0800
Message-Id: <20260428075231.2283151-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MOJijf76Vc+i8OL7siTpBqPYF2W44WgEQcy2hld75AqJxOUgcj88NdVi
	+ElkZwJ4Q0LieKL2JHbcJdl6jl1vnGBIkfNNmDXQXKRD+wu4okEr7v/u+hTNRUur3/NiPbd
	0a5XQIhWlv7HKFvrff4x/ngIPkcoYZfSYEcUg8iLSu8F+JvRWIMMScwRy0LdLXNQ0o8pxE7
	PjPJKQRtqZUIS24e4VcDnJtORc105bnvf6aXGhBtkqqHBfnq3MyN5lsKKkdQCDYp4Y8MJFN
	9LmMLxz9sm6uWcFTtObne7+ZnCBw3PJSMIYx0x7ZKFc3qcANLh/QMwHkMAhKzAglM+4LReV
	PZ4LSUYyYeIjEHdnNtdh4S8kQninJqsA9x/2gIlF+JviomiQov+8itHdYt5WlXUVVBJkvo+
	ZDSQe0ztooMF/aF9qmhbR0YOvvGduWC2/5R+LfKCWTPrT318na7D/y0If7Z2DTD024zDSU1
	h9iUVao+wIfm6/TjWx4wvhb7+JmHMPH/tfi8x5jwbw/rT0OOfBPirzNSOYkWlT34VFNdJ5t
	66RLp/IzhSyi/SbMVHRJxkEK3hdzgoH6oXiGAb/mjh14WyemcVo/loLQRCVUnse+SEGxP1f
	tDBKhkYfH5e6IAKtVZKYscZQWghLbeCoSDdUWK6Oq4sJrNtq+PgfyOZDhGtUznEylf2koIh
	XLvJyCmZ6ZZnZADOkrYQ5jVUvyUUHanXRWO4wwccQfnr3OPFi8Okqu80jPjqBeur5jDMijP
	lY/c6ql5qKMOktXa8kn2mIGX+tzI6+/0hoxP+2K3M0VOdV31UqGADzC/be1d912o2peETIG
	t58ILk1OC1wNU4TRfGztGbSqaTkQbWuM/wULkATM7OBqCVVBeUtUi5kHf+SzUfqbd1KdYgM
	TgmYWp9IRBTNlU7WLHOmKGW5M8kmeENb6ryYB20K2p7hwRWxu+tfwaEUtD/XuYXP/3c9vC6
	MmwmeoSrKyyAGhWWYUfYzuoerxMRffPGJolWVisu5R71NK63taxxEMELA3s+NbCHZkuqHe2
	aCkUEhG3FXo5ZoL+0ifioTLEPkSq4ps0kyvyBtirSIDPtfYYv1uaT7sEgfc4eJc/H4O49q0
	g==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

1. Adds an hwcap_str[] mapping table, using KERNEL_HWCAP(x)
(i.e., const_ilog2(HWCAP_LOONGARCH_x)) to map HWCAP bits
to corresponding strings;
2. In show_cpuinfo(), iterates through hwcap_str in a loop,
checks the bitmap of elf_hwcap, and prints the corresponding
feature names;
3. Maintains the original output semantics (still printing
the same feature names) to facilitate adding new CPU features
in the future.

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
---
 arch/loongarch/kernel/proc.c | 60 ++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 34 deletions(-)

diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index d4ce5b585453..1188bffd66b6 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -12,9 +12,32 @@
 #include <asm/idle.h>
 #include <asm/processor.h>
 #include <asm/time.h>
+#include <asm/cpufeature.h>
+
+#define KERNEL_HWCAP(x)  const_ilog2(HWCAP_LOONGARCH_ ## x)
+static const char *const hwcap_str[] = {
+	[KERNEL_HWCAP(CPUCFG)]		= "cpucfg",
+	[KERNEL_HWCAP(LAM)]		= "lam",
+	[KERNEL_HWCAP(LAM_BH)]		= "lam_bh",
+	[KERNEL_HWCAP(UAL)]		= "ual",
+	[KERNEL_HWCAP(FPU)]		= "fpu",
+	[KERNEL_HWCAP(LSX)]		= "lsx",
+	[KERNEL_HWCAP(LASX)]		= "lasx",
+	[KERNEL_HWCAP(CRC32)]		= "crc32",
+	[KERNEL_HWCAP(COMPLEX)]		= "complex",
+	[KERNEL_HWCAP(CRYPTO)]		= "crypto",
+	[KERNEL_HWCAP(LVZ)]		= "lvz",
+	[KERNEL_HWCAP(LBT_X86)]		= "lbt_x86",
+	[KERNEL_HWCAP(LBT_ARM)]		= "lbt_arm",
+	[KERNEL_HWCAP(LBT_MIPS)]	= "lbt_mips",
+	[KERNEL_HWCAP(PTW)]		= "ptw",
+	[KERNEL_HWCAP(LSPW)]		= "lspw",
+	[KERNEL_HWCAP(SCQ)]		= "scq",
+};
 
 static int show_cpuinfo(struct seq_file *m, void *v)
 {
+	unsigned int i;
 	unsigned long n = (unsigned long) v - 1;
 	unsigned int isa = cpu_data[n].isa_level;
 	unsigned int prid = cpu_data[n].processor_id;
@@ -60,40 +83,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	seq_puts(m, "\n");
 
 	seq_puts(m, "Features\t\t:");
-	if (cpu_has_cpucfg)
-		seq_puts(m, " cpucfg");
-	if (cpu_has_lam)
-		seq_puts(m, " lam");
-	if (cpu_has_lam_bh)
-		seq_puts(m, " lam_bh");
-	if (cpu_has_scq)
-		seq_puts(m, " scq");
-	if (cpu_has_ual)
-		seq_puts(m, " ual");
-	if (cpu_has_fpu)
-		seq_puts(m, " fpu");
-	if (cpu_has_lsx)
-		seq_puts(m, " lsx");
-	if (cpu_has_lasx)
-		seq_puts(m, " lasx");
-	if (cpu_has_crc32)
-		seq_puts(m, " crc32");
-	if (cpu_has_complex)
-		seq_puts(m, " complex");
-	if (cpu_has_crypto)
-		seq_puts(m, " crypto");
-	if (cpu_has_ptw)
-		seq_puts(m, " ptw");
-	if (cpu_has_lspw)
-		seq_puts(m, " lspw");
-	if (cpu_has_lvz)
-		seq_puts(m, " lvz");
-	if (cpu_has_lbt_x86)
-		seq_puts(m, " lbt_x86");
-	if (cpu_has_lbt_arm)
-		seq_puts(m, " lbt_arm");
-	if (cpu_has_lbt_mips)
-		seq_puts(m, " lbt_mips");
+	for (i = 0; i < ARRAY_SIZE(hwcap_str); i++)
+		if (elf_hwcap & (1 << i))
+			seq_printf(m, " %s", hwcap_str[i]);
 	seq_puts(m, "\n");
 
 	seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_watch));
-- 
2.20.1

