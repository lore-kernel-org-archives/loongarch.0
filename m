Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6417125D6
	for <loongarch@lists.linux.dev>; Sat,  8 Feb 2025 01:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738978623; cv=none; b=QAvwko4lsUsAY9K5tPkU2FLaglGXgK5dDmSTD+oaestIcA2i9eWvkBD2Yxd5Kn4Wyh4b5h0KzjNJ286yUDZ7xVh4Zpj3Odk95hl39nCvhNb/OJqZS1dugjjDm0pzeE5OUf9a7Ynt53dwRVMWKQ8WYBtPTA8/E/qUHb1JocIiZ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738978623; c=relaxed/simple;
	bh=FCnIGEA1W8Gdi6HLs/8CaOG461ny2CkaCwENpo878EY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fm0DFiDwCg52pSqUSI0IakInlqAdXR2Eakvql7QwPmQK4lbP7mm1Jb2+216bScm3nP7elAq1OxYwXwvAgdIya56IzilUIQ7SYLAksrKiziS3ZPUMbf5sM6nYCEc5a/rjuJHy+/FmMV7Ydh483HBiKZUfKv4TceBm4ZC1XJnPEg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Gw0/u4rC; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Gw0/u4rC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1738978612;
	bh=e/xqHLyJ/T5Q7z8TKyFjea3+EClW7YemhkJ0zAILeKg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Gw0/u4rClutDWzH1Dgk7TxGQqzha19AZytu7sc/B0KTe8XVGEYt5nTEW0Ut/LCF7r
	 Lte85U97/Qyve8ZaE/KcDGrL3P/Wbw2UFWdGg1RTwyqacl+a/pXhhUJFrcxs8CXkMR
	 7khae18IQ7Igs9f4HkK7e0NeDm8DMq1CBs3YPx5U=
X-QQ-mid: bizesmtpip4t1738978440tudhzwp
X-QQ-Originating-IP: NG0u61HUQbT6bj9uCV2n+irMw7n/LpjlyEUkegcep9U=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 08 Feb 2025 09:33:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 581403337225196444
From: WangYuli <wangyuli@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	guanwentao@uniontech.com,
	jiaxun.yang@flygoat.com,
	wangyuli@uniontech.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanjun@unionetch.com,
	chenlinxuan@uniontech.com
Subject: [PATCH] LoongArch: Remove the deprecated notifier hook mechanism
Date: Sat,  8 Feb 2025 09:33:55 +0800
Message-ID: <3CA1F6E1F2943EAA+20250208013355.401050-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MyhNtuNETreedm+xZJ4RSDU9y8ViRlonCd70vW8M+/HFTZzQCg3T9rl9
	MmR50H5a/qdNsMHU1GAEz3pT/N/KClLttUr9YO/ZSLpGgIFAldjRhNGO0ZlPQsm7DRMhZZX
	POOaamrsl8X5TrIhGlcjaeNRoA6pqL+CWFAL/mzOnXH0/q2otjJa+0XFSN/La61ukEWDefQ
	DLRt7U1Jyj3Jiq0v3h3u50ClDJkmJRGLWPFhbSsUhfB7onNmNHxhLa2gDTpMi7QZvAsLI/s
	/PW/4P20/jVxBhMkcNfHy3kOe5y7QU5xTsDAUvkxe+iSuETWD333mMUyTEPL1H/hWM6TkG1
	PHqyybKfYtQg9j8FEwgk47xQdVVSRyCWlTD3z+TfemzQI8ENHIP+bAmN9p3/5QFHuCLGkEp
	v08B2mKQ43l9vbxtyscW0x71V7tMnNdvy4jVJdbZOuWR0wDU5er7aB+eDC7LGqWvnvUbKCx
	1kSnIeKlWgDQGPpEy+/m7TmXE8K71uI+xP1ehlg0T2pYJn5Obm/4M7NTqiwNWSwXgI011ke
	2CXW4QMQYWBvFsG/Ey0+u4Hu/fscJnP+wApgCzk2g7fDP3thy0f+ug1v3Q59MYPEpkCukQF
	15MVpxoJuwKmC3Ea4ZX7miuSZ0jwvHybOfoHHNWLn13fgw5qlMbLpH+FZwR3g3vZvYhlpVv
	UFh9VpxufwQXGs4JHBsH8t/4Xy9dfPAOPFLGABGvjO7Cpn9cehcnOVHYkVIAnCZwn4zxiVk
	0Oqvt53pKRmAdWbPXUeLuVyMmV1MEypEHrOsWWq4x4Y9+pFEK/BbyTtwwIQjPuckw2TnNPn
	ZR0yIV9PEPZIFlsmWKwdcaEUk7rhF6OlWnpBh/3u4UL8Tr8PM1Bwgs26l2yHqd9ZAA7muZM
	H6rwaWwS3j4MJQaFstJF5Nbx3BjbGVHAR5R/5C8g7N75kcWAtzp4XHC47O0RynQtuxGU/qV
	1BzlleDqe9YjhgannOXkhz0o4jQLuvGPbCz2Vja9SeDLOJw==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

The notifier hook mechanism in proc and cpuinfo is actually unnecessary
for LoongArch because it's not used anywhere.

It was originally added to the MIPS code in commit d6d3c9afaab4 ("MIPS:
MT: proc: Add support for printing VPE and TC ids"), and LoongArch
then inherited it.

But as the kernel code stands now, this notifier hook mechanism doesn't
really make sense for either LoongArch or MIPS.

Co-developed-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
---
 arch/loongarch/include/asm/cpu-info.h | 19 -------------------
 arch/loongarch/kernel/proc.c          | 22 ----------------------
 2 files changed, 41 deletions(-)

diff --git a/arch/loongarch/include/asm/cpu-info.h b/arch/loongarch/include/asm/cpu-info.h
index 35e0a230a484..48217f07d37e 100644
--- a/arch/loongarch/include/asm/cpu-info.h
+++ b/arch/loongarch/include/asm/cpu-info.h
@@ -77,25 +77,6 @@ extern const char *__cpu_full_name[];
 #define cpu_full_name_string()	__cpu_full_name[raw_smp_processor_id()]
 
 struct seq_file;
-struct notifier_block;
-
-extern int register_proc_cpuinfo_notifier(struct notifier_block *nb);
-extern int proc_cpuinfo_notifier_call_chain(unsigned long val, void *v);
-
-#define proc_cpuinfo_notifier(fn, pri)					\
-({									\
-	static struct notifier_block fn##_nb = {			\
-		.notifier_call = fn,					\
-		.priority = pri						\
-	};								\
-									\
-	register_proc_cpuinfo_notifier(&fn##_nb);			\
-})
-
-struct proc_cpuinfo_notifier_args {
-	struct seq_file *m;
-	unsigned long n;
-};
 
 static inline bool cpus_are_siblings(int cpua, int cpub)
 {
diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index 6ce46d92f1f1..004f494bf43f 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -13,28 +13,12 @@
 #include <asm/processor.h>
 #include <asm/time.h>
 
-/*
- * No lock; only written during early bootup by CPU 0.
- */
-static RAW_NOTIFIER_HEAD(proc_cpuinfo_chain);
-
-int __ref register_proc_cpuinfo_notifier(struct notifier_block *nb)
-{
-	return raw_notifier_chain_register(&proc_cpuinfo_chain, nb);
-}
-
-int proc_cpuinfo_notifier_call_chain(unsigned long val, void *v)
-{
-	return raw_notifier_call_chain(&proc_cpuinfo_chain, val, v);
-}
-
 static int show_cpuinfo(struct seq_file *m, void *v)
 {
 	unsigned long n = (unsigned long) v - 1;
 	unsigned int isa = cpu_data[n].isa_level;
 	unsigned int version = cpu_data[n].processor_id & 0xff;
 	unsigned int fp_version = cpu_data[n].fpu_vers;
-	struct proc_cpuinfo_notifier_args proc_cpuinfo_notifier_args;
 
 #ifdef CONFIG_SMP
 	if (!cpu_online(n))
@@ -98,12 +82,6 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		      cpu_data[n].watch_ireg_count, cpu_data[n].watch_dreg_count);
 	}
 
-	proc_cpuinfo_notifier_args.m = m;
-	proc_cpuinfo_notifier_args.n = n;
-
-	raw_notifier_call_chain(&proc_cpuinfo_chain, 0,
-				&proc_cpuinfo_notifier_args);
-
 	seq_printf(m, "\n");
 
 	return 0;
-- 
2.47.2

