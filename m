Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952E12E285C
	for <loongarch@lists.linux.dev>; Sat, 28 Feb 2026 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772274608; cv=none; b=cBxCJpZty8Y61vRP5Gsn3uizJJv2A+cIkx3ETMzYr1+UbDDAwhTis4OuZWQj3xVbhRDDl9KNIsGGnHmx6DD/sKu3bZDDkdoK6+Lrxc8eV15HXYolnd30VVYVNZmcPC/hpNnl9Lf7hGy4HbdAQ7OaZThjK6qVdYc0SQ1GAGJhUWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772274608; c=relaxed/simple;
	bh=AawrdwbBOMsHCqYB21J/92mvuB3GpzoxXU2ceO1vee4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H4akMXf/1dEh2Gn1VRnWCDJ1f76zLcLGny2DL01lI+Ohu4S5mxhnSOQZV+C2J0A2wMdMNwymYs/6P9xE6N10dzWMRgG4nhvuoHWP8Yw+T2vQilrOIH6v2rbG/ErrDAKLjE9ytAdHLRIcyGmavDsrp0APInKu3Xyh26OtYByKOzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IiAWs8/Q; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IiAWs8/Q"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772274594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oBiJOfFdr0HmL0Jncb/PQJIBHKyVVi1wurGB7AAqKSA=;
	b=IiAWs8/QrPhIaJEQsE7ZerwrnDxo9de2iMPgBlD1aQvwWlK4uHEC9EXHSx9Taygs5ZC5e+
	Ge9ePW9s3Yu+AGFa0QkBGIljocIu/FFtOyNLV+FTdSh82vb4EuRLaow6xeM+VgihkWFSj+
	Ys7vNffAFiD0wTXyDPl6fJl2oF2W5pg=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org,
	joe@perches.com
Cc: guodongtai@kylinos.cn,
	kernel@xen0n.name,
	hengqi.chen@gmail.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] LoongArch: proc: Simplify cpuinfo features output
Date: Sat, 28 Feb 2026 18:29:46 +0800
Message-ID: <20260228102946.4045-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

Introduce seq_cpu_feature() macro to eliminate repetitive if statements
in show_cpuinfo(). The macro expands to:
    do {
        if (cpu_has_##feature)
            seq_puts(m, " " #feature);
    } while (0)

This improves code readability and maintainability.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/kernel/proc.c | 56 ++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 32 deletions(-)

diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index a8127e83da65..4742bdfc3872 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -13,6 +13,12 @@
 #include <asm/processor.h>
 #include <asm/time.h>
 
+#define seq_cpu_feature(m, feature)		\
+do {						\
+	if (cpu_has_##feature)			\
+		seq_puts(m, " " #feature);	\
+} while (0)
+
 static int show_cpuinfo(struct seq_file *m, void *v)
 {
 	unsigned long n = (unsigned long) v - 1;
@@ -60,38 +66,24 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	seq_puts(m, "\n");
 
 	seq_puts(m, "Features\t\t:");
-	if (cpu_has_cpucfg)
-		seq_puts(m, " cpucfg");
-	if (cpu_has_lam)
-		seq_puts(m, " lam");
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
+
+	seq_cpu_feature(m, cpucfg);
+	seq_cpu_feature(m, lam);
+	seq_cpu_feature(m, scq);
+	seq_cpu_feature(m, ual);
+	seq_cpu_feature(m, fpu);
+	seq_cpu_feature(m, lsx);
+	seq_cpu_feature(m, lasx);
+	seq_cpu_feature(m, crc32);
+	seq_cpu_feature(m, complex);
+	seq_cpu_feature(m, crypto);
+	seq_cpu_feature(m, ptw);
+	seq_cpu_feature(m, lspw);
+	seq_cpu_feature(m, lvz);
+	seq_cpu_feature(m, lbt_x86);
+	seq_cpu_feature(m, lbt_arm);
+	seq_cpu_feature(m, lbt_mips);
+
 	seq_puts(m, "\n");
 
 	seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_watch));
-- 
2.34.1

