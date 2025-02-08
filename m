Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561D1149C41
	for <loongarch@lists.linux.dev>; Sat,  8 Feb 2025 08:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739001818; cv=none; b=uRiqkPIuZcGKlxFkRt1frH1iU1KRyT2q/g5BHNJRoWTMoCNL7fR/daNf8hWQ8Y3B2AEzMaCvYyVlz/puuJA7Zsx4G2jBrcdUrnvbmf0lSGZ64RcTIjhmgpxf8gV8Gl1U/io72I73LYGpURmU6CB8IgsLKJTXamFsbcYMN2i4b1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739001818; c=relaxed/simple;
	bh=XnQxfi1HtMXzYEYEIANATw67hI2nPp0tAzfEOkV/eU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K7Meeo+Kj9OwBCyoQe/zwKhOZ8BJEdeXbo9gPjftN2B4hH6RZM6iikCdEnFddXqsuvNF6ekUVVBdGUFOjxvSVgUMr1ItTbB15pQtVzKEhBlolAZnIQcWu2V76YnPgqIIjCx9N5MpHQfIh8GMjOcCbqXNk4eIW7KY9gGzedp26VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=YegZTmSf; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="YegZTmSf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739001785;
	bh=L6BZjLc12Oi4GpH872/qnfe/sVoBJ3bjEkckfmoYTdE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=YegZTmSfkgpBhtdcimuFZxeKqkWVB/pd57gotX6qCOcU8xcuc0FZFG+EsuRAZYzL6
	 uM8Cm/udKDX0A/UPPPnLepGrDvC6SGw3GGnGbQbUoLPDzhfxVSmCC5D5pxJJ6W5fkD
	 EIVJ7z+vblZcY56tCM612UOlqYTm7bUztJb+APcc=
X-QQ-mid: bizesmtpip2t1739001754tz7n3e3
X-QQ-Originating-IP: tmpZYue2nGAbTA78Y1flZ/X8EzJiNQC4Z0oIIomEOCY=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 08 Feb 2025 16:02:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15883365605376715984
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
Subject: [PATCH 2/3] LoongArch: Remove the deprecated notifier hook mechanism
Date: Sat,  8 Feb 2025 16:02:20 +0800
Message-ID: <33D4088EEA59F856+20250208080221.1083810-3-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250208080221.1083810-1-wangyuli@uniontech.com>
References: <20250208080221.1083810-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N4V4jCSdQ1uW87GCp6o5llFATgPTOmKq5FHY+u+S76lZ4MECcXMRY09e
	kTGvmIL76XxaqncjSdt64i8lzRFimh3JsACGpAxMJ4eT7tLF/0VJBqIMRTSu2ASzagqUjeN
	SmAGRR9MiGOHRZ3EAzegu9D8yNmQKOZ1X2AC5HtZLsWyQ1KVb0xeSIUYWohCiDuz1MvLPIe
	2O01fjcck97nxDTO6bzJ30vy3CnojyYlgQJkUWo+DtG9lmA9SiGCiBfNRjvZyXTo+82zwZv
	r+FWmfxmKT0xtHFd/Rgrf0TLqztzSZpOKMGrsl3X7rzbuRfwCfb0/12ow3Qbj91ndNyboY7
	qJDXWtylfZ8DQUXtPtbso8CJdKfWqMdl0+buidtx2RcgN7wupzmL8hxo871Qa5EB8TE6y7K
	tS57zgE89LDeFsRj6lY/nNyZCuSYmhlHjH35w4YgapE10yc06bT2OlP7JarFcc1vVs1Couv
	6pCpzXnodRqLJiFCb/msvPvAN9MgEN36cNudCBDBwZp7ukXtt80HZ8cS7+u5HoiReERpPss
	EWK4LxERI5iDBxjEhuKJGSfnvikqNMcNHtolb1odGogQPlF1TDqV5NG3p0TWa8ObQMWqMEn
	33ecKG2knNxKQE30ijN2BfgbdpFXPPcQ96E2tQmA13xD+417EsXi7ymZN50fSKaDHPyTb8p
	7QkAsXJSkBIvji8IZCb1STE1SHRsM5shCCnqpSpi8s55lakH0DE7nZknufLSoCVXH1Lj5J6
	Ga/bsNxfZM6I5kUP9b1XeZ2SNw4D/oZpv8e4ce2xbdpmlTd2xaMWbwAQnkwGX9k7JdEK7nc
	XeTHK68H2Y13CKvax0K6CzCyO5bF1XoAjHLvBbyqRumpyETlrBTPFgQ+UvGLN3WI9EdsQ/e
	SXAMsNk4c7hAnfxOfo+67PRuepu84OU8hW4sPpcDSBPUia0UwnKVTR/ZY15a0G2lCvkA+dr
	Lgs0ZqM82GSUzeBbsixA1W1s9Lhrf2nAM0zQyGOGd+RF8+QUDu8log4cchTgjyrDBG67wen
	hXfmFbnvriv0zeJWXKFkUW3WyPXTO6zUVNZn0D4IafB8zp1Clz
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
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
index 56a230238c9c..cea30768ae92 100644
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
@@ -97,12 +81,6 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		      cpu_data[n].watch_ireg_count, cpu_data[n].watch_dreg_count);
 	}
 
-	proc_cpuinfo_notifier_args.m = m;
-	proc_cpuinfo_notifier_args.n = n;
-
-	raw_notifier_call_chain(&proc_cpuinfo_chain, 0,
-				&proc_cpuinfo_notifier_args);
-
 	seq_printf(m, "\n\n");
 
 	return 0;
-- 
2.47.2

