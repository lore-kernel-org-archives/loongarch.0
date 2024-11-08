Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F53192D98
	for <loongarch@lists.linux.dev>; Fri,  8 Nov 2024 16:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731082862; cv=none; b=AyAi/VPaOm3vPxmiO0x7eoXdbJSCiPIS8NHdrtuOi9qWe91ehzh5kFUwEYaa4ygvo+n4boOjqL/JvlnMyXUTZToJuRuVak9SotF+kuYTWVCVvDzERazhFCrQBB1NF2UbnQi2Lq/HIteFjQNZQ0j02RS3FQrq3ZZqMzsjqyr5Ag4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731082862; c=relaxed/simple;
	bh=Bd+TUK4jz9A3YQIdOxj4+9I78h9QD7+nXTF+gfDrJxI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t/qnYmcjdPV8PdRqeOlx+aRGau9JEKnA/dUAhn3PqKqi8PiZU/aua75QwDSE5eMb314op8C26tp3zL3Ugdh/Wlvww6OWpqPZvJhpoqx5Tc+lJpJSeoR+hoVs0JI976nrfBb6z/Zvt0GHC8H/XXqacOtFFcxyFXdUSIc/g9BPXuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Dam6bVcg; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Dam6bVcg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=IiDZF
	yh1EQZBh7jKSHMO3jQrieFZ3EcpNlJmRc++uVw=; b=Dam6bVcgpoewp2sIgK0qu
	SKtlWmX2YgoqGQdfDbSsDLeWgo6wSdZuUA/Q9f2vzKgFFrGrTzJzT3o8qX6Gfo+F
	ZL7J6FRricNf2W78TH3VuivpEtKkyhXdpXOxXaISoGs8QSYtzhweSRV1avEASPoC
	a0E7CPpRAc+cPcLiVQ/lCg=
Received: from localhost.localdomain (unknown [111.35.191.191])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wC33etZOi5ney_tBA--.59238S4;
	Sat, 09 Nov 2024 00:20:47 +0800 (CST)
From: David Wang <00107082@163.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	David Wang <00107082@163.com>
Subject: [PATCH 09/13] loongarch/irq: use seq_put_decimal_ull_width() for decimal values
Date: Sat,  9 Nov 2024 00:20:39 +0800
Message-Id: <20241108162039.9818-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC33etZOi5ney_tBA--.59238S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gry5Cw1DGrWUJr1xAF1UJrb_yoW3tFX_WF
	Z7A3Z5GrW5Jayjva4q9a4fJ34qv34FvF9Yya4kuFW2yr15Jr45Ja98C3W5Zw1vqFn8XrZx
	XayrKr4qvr17KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_qjqJUUUUU==
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqQSRqmcuNe9JFAAAsY

Performance improvement for reading /proc/interrupts on arch loongarch

Signed-off-by: David Wang <00107082@163.com>
---
 arch/loongarch/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index 9afc2d8b3414..86664adfb3cf 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -82,7 +82,7 @@ void show_ipi_list(struct seq_file *p, int prec)
 	for (i = 0; i < NR_IPI; i++) {
 		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i, prec >= 4 ? " " : "");
 		for_each_online_cpu(cpu)
-			seq_printf(p, "%10u ", per_cpu(irq_stat, cpu).ipi_irqs[i]);
+			seq_put_decimal_ull_width(p, " ", per_cpu(irq_stat, cpu).ipi_irqs[i], 10);
 		seq_printf(p, " LoongArch  %d  %s\n", i + 1, ipi_types[i]);
 	}
 }
-- 
2.39.2

