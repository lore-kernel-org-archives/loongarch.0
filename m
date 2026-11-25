Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574404;
	b=HDRtG6h+QYf9VAedTwFTbD/1N37/C8O/uFJC3DyTzYUx0EbwZ/r0xb8vHsJLnNMBTI/I
	 6iuf46a3vMBjZ+z5dzCkIzSCWYYxZEn43cYhloVidqG8GfCEBkBcm9YQZA7oKk/LLfdsI
	 6Vm2vGF/sg13OzP9H9QUHPd+GlRJHvPzuq264cZwr67qgAkb3KA24DE7C8eFVPO5ZNYyH
	 E1NAAkNdYDmKiFJdsQ6rU4UjAs/GIxPc13s9HvRpWQMBC+KTElFKzkwkHUhmGp5/rqJp/
	 phtjpnPZDCKDiUfESlzeCmzOccQ6s9vOIr0yRP3yrBUfN9UEFcFsc/7PlFE8zUZnuPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574404;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=x9IONys28uxvQ48AVO1v+lm6hsIk1POMmg5EdVLd3Z8=;
	b=rt8pD9gktxQNsA7uV98w3wK3hK4CTucgQOBdjIdHfoM+oEmW3GE7q1OKlVp3J40XJWHh
	 hYW7NonLu1xxt9/07J35Sj3tobAlkxbK8v/VBfj70s4OZDMefZm0l4o2VtM6DkhXy98cx
	 6wDFO5Dvaqyw2TTCPiWUzKW5EG2+1h2Qncu6O54YUbYEQZkwsgsnc71AU5H/6fhfm13hl
	 nt00MQWdeeBmGo9fNOnATT7Lx//rd7ZLlAx1HIDNyPm5WlwT51mV8X7c77z/4S4J07BxZ
	 QyWBAnLviv0Am8SmqEa4KeKf5QryZ1ununKjKgFgIJVBrjREsvAJVlIT24XW4CGB8KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A65606A321
	for <loongarch@lists.linux.dev>; Wed, 25 Nov 2026 02:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37A65606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxytF_SgZr58ciAA--.32914S3;
	Wed, 25 Nov 2026 10:39:59 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCxf899SgZrUC43AA--.46328S2;
	Wed, 25 Nov 2026 10:39:58 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] LoongArch: Expose msgint and avecint in /proc/cpuinfo
Date: Wed, 25 Nov 2026 10:39:56 +0800
Message-ID: <20261125023956.26825-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxf899SgZrUC43AA--.46328S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jry5XrWUtF4kCw4fWr4DGFX_yoWDZwbE9F
	y7Gw1UGr48Gr4j9wn8K3W5Jry8A348tFnY93Z7uF1UZryYkr1aq398Z3WrAr1DKFZrtrZ5
	Aay8Jryvvw1a9osvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=

Expose the msgint (cpu_has_msgint) and avecint (cpu_has_avecint) feature
flags in the Features line of /proc/cpuinfo.

Having both flags visible in userspace makes it straightforward to check
whether the CPU hardware supports message interrupts versus whether AVEC
is actually enabled by firmware and exposed via IOCSR.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/proc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index 37e9b144ec09..df0ce4e4bdc2 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -98,6 +98,10 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_puts(m, " lbt_arm");
 	if (cpu_has_lbt_mips)
 		seq_puts(m, " lbt_mips");
+	if (cpu_has_msgint)
+		seq_puts(m, " msgint");
+	if (cpu_has_avecint)
+		seq_puts(m, " avecint");
 	seq_puts(m, "\n");
 
 	seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_watch));
-- 
2.42.0

