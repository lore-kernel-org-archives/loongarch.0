Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B676F15539D
	for <loongarch@lists.linux.dev>; Fri,  7 Feb 2025 06:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738911181; cv=none; b=nzFjljcnw3xb6T/D41KxJre2H9jb7qdrpjIlAABoMhInn2Aijlsgow51is7zyvwuCaeGJBoB2uucqno1P5cRbpKeRjZkXhK0Zz+v6fY5+UhhCODTZX8RJyI0gkTn77YqrXh0tCwlozGdQROLOihq2pg5THhOJdeCnMnJ4GP6lhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738911181; c=relaxed/simple;
	bh=fp3yNdV4dxXMRi80coUOwaKpOJz4Lwgnb74388pRDO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A/4t3Zk/7pm/Jtaokk2tGOHWHVG/0sjMv2iVwmbnsyCqqwY4NuIuolBv68kG++Goueiqi9kQm8oRVHcR1M80I3dimr1okOHXcYmnNI94TOGSxDgb9DXXALNH+9EDtgo1hlWWsVWNpA3yomAoMVvDgmWcLWP4c/9/Rhd5nc6XB1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=gfQ4/rhx; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="gfQ4/rhx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1738911142;
	bh=3TrnJ9Z/xHsuAJRQWEc2Y4wHAx1RLl4jmH7juixi/sY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gfQ4/rhxudhXSMxBFFlcFLRwUfteW9eXRKhuIV1bD4pJE1ObNTL0NV7K0nWSV4Y39
	 PrVpbDmQ9z3FmqgTQld/BDA4+INs8loZwEkhTq0h93UbUsk85hDZqCkYuyFumFjaNC
	 vFy/svFv/R9nJPAH6hZ1TW1bHz9knv8KN5U5Lbeo=
X-QQ-mid: bizesmtpip2t1738911130twu7d2b
X-QQ-Originating-IP: 2Ogc0sig6WvB+aX1FzWDHy5qpj/rqCpc0tfCtt62W14=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Feb 2025 14:52:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7797445353055566242
From: WangYuli <wangyuli@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	wangyuli@uniontech.com,
	jiaxun.yang@flygoat.com,
	guanwentao@uniontech.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	chenlinxuan@uniontech.com
Subject: [PATCH] LoongArch: kernel: proc: Use str_yes_no() helper function
Date: Fri,  7 Feb 2025 14:52:01 +0800
Message-ID: <FC3B31E885291324+20250207065201.191475-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: M8Li3la+wnbNwAjFOV2edtc8e4abS0veJgDFYMVpnSVwMs2ZDmQDQGNb
	MShBjLimIkad3XqPQwVOEOtcBmLnq6E7LvYaYHD/bx0Mxzq5xyqp9OyyB06SwQkjH2cq5EO
	jQ0WZ3JOfx6x7lHwfJ+ECFfi2S5PdU9pX6skNjOdCokfUAm3kiMqNRVJs6+5V52apiMMYfE
	ap6by6KZVouDLz31reFZMIIe+hzK7HzTUq37igZprzWSZhswHYHXGOxgeJu4ppXYwlCU0aF
	PPv2qpzYmtbH92NSTzH21Zc2MV+yw9n89h3TSAOvWRrFRdG+6kbbHmCW/J+SE4fgiEGYS8r
	5qjV4EAsvdqbQziqwyscHAIC2RsER2HYggQ9XfzRk3VNOLMfnRPdOK6eneFSkqVdazJxIQe
	rW7YUjI3fe2FJujXjoGt8zytewJV9bQe4i8+/8tZaMtoSl3rE8+lBgcLO52t/WDFKI/Zzz/
	+Ne3qBI+J7rdBbkY/0bBNqRue1EezHgWZprOFJowTt7aDm30HiQfM3pPOp31Cg0YzsF1XA7
	/FPaI4O6S4HemthifGWvtczWHWeWU4bx2RBGZEh1vAxALiLyHcwcWihIFp9725MEMO9RJcg
	UeJd3nNpDEqR3nGNvm6VOAcnAKexuFVxdW4pX/hkrZZPbqMcmb/XYTvZYB1s5WqpxtSQeAB
	SOAGP4DWYH1eOixUgc4nP8MFCe3guOvPsrmnBkotfolzH45t73sOTFmhij0uGlz0HfeYWGj
	Esghi7su5wl7plCvexK2cmKNqWM4XN0an8grgAq+YfIqvkIYGTLjcMU6JzsTIXQBiJHCNWp
	h9+vbmzWkLBP9V7aN+RkHvNEmPxqRW/qONRXcrZeJFHApA6c7Gy8AIA08HfwomUQ3rPhhiz
	uIUe3CY6qNOKq0QvOadRve1IchkQdPpT0CIITI/NHMqrjMrEshYgqSX34XS0lW6EIYGEtLx
	WSczAjBpRKrbXAx41yZSD+nyAf2lupD9EwrSxl6dpfxAbqjC53Blv6srrLpJ+zVy0xLYOYd
	NHUjjKYQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

Remove hard-coded strings by using the str_yes_no() helper function.

Similar to commit c4a0a4a45a45 ("MIPS: kernel: proc: Use str_yes_no()
helper function").

Co-developed-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
---
 arch/loongarch/kernel/proc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index 6ce46d92f1f1..56a230238c9c 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -91,10 +91,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	if (cpu_has_lbt_mips)	seq_printf(m, " lbt_mips");
 	seq_printf(m, "\n");
 
-	seq_printf(m, "Hardware Watchpoint\t: %s",
-		      cpu_has_watch ? "yes, " : "no\n");
+	seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_watch));
 	if (cpu_has_watch) {
-		seq_printf(m, "iwatch count: %d, dwatch count: %d\n",
+		seq_printf(m, ", iwatch count: %d, dwatch count: %d",
 		      cpu_data[n].watch_ireg_count, cpu_data[n].watch_dreg_count);
 	}
 
@@ -104,7 +103,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	raw_notifier_call_chain(&proc_cpuinfo_chain, 0,
 				&proc_cpuinfo_notifier_args);
 
-	seq_printf(m, "\n");
+	seq_printf(m, "\n\n");
 
 	return 0;
 }
-- 
2.47.2

