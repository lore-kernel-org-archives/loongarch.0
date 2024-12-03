Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FE82B9A2
	for <loongarch@lists.linux.dev>; Tue,  3 Dec 2024 06:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733208648; cv=none; b=tuBfA6zslPhF4ggYHG/nNyZ9FCvRYmnV3pmGJbEAH/Z37DYXphgB8D9NNE6GZvDHKuvVoG0TV/hr+zx2gcDhdchYGlo0bAEg3vsi3i8kRYFiOIZcdQ5oE+Znpte9Sj/KK3TyIyyf/HBXNYAn4rZ3GGmvlbdMPzuxQTQFJL1PGIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733208648; c=relaxed/simple;
	bh=vK3nHiRvsYyzZ2ySFUO1HZaxlOSxOdjetDSxes1tMI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gIXc8d3OdA4MKO/POrFCKP+KwWcRTjgL5nH094vpGJT7yZ43vVKpyll407BncsJ7VeUpxwxiIeSpbrIS7zE3Fl8xLtu6uZF6S5mDv9LuHpVXlw2RuhtKRG1Co4IEN+EWBgo1DfvAaUWQP/f/jw2q1TLqYj6JqMs5aE3FOn7d3Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.38])
	by gateway (Coremail) with SMTP id _____8DxmeA2qk5nBntPAA--.23677S3;
	Tue, 03 Dec 2024 14:50:30 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.38])
	by front1 (Coremail) with SMTP id qMiowMCx+8Evqk5nVnpzAA--.9933S2;
	Tue, 03 Dec 2024 14:50:28 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>,
	Xuefeng Zhao <zhaoxuefeng@loongson.cn>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH] LoongArch: Fix reserving screen info memory for above-4G firmware
Date: Tue,  3 Dec 2024 14:50:10 +0800
Message-ID: <20241203065010.4164506-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCx+8Evqk5nVnpzAA--.9933S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKF4kJrW5Kr13urWfGFyrXwc_yoWkXrg_WF
	WxWa1kKr18Aay093yjqa15Jr10vw40van3C3Z7Xwn8Jw1YvF9xJF1xW3s3ZrnxWrWUWrs8
	Aay2qF9akr12vosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

Since screen_info.lfb_base is a __u32 type, an above-4G address need an
ext_lfb_base to present its higher 32bits. In init_screen_info() we can
use __screen_info_lfb_base() to handle this case for reserving screen
info memory.

Signed-off-by: Xuefeng Zhao <zhaoxuefeng@loongson.cn>
Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/efi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
index 2bf86aeda874..de21e72759ee 100644
--- a/arch/loongarch/kernel/efi.c
+++ b/arch/loongarch/kernel/efi.c
@@ -95,7 +95,7 @@ static void __init init_screen_info(void)
 	memset(si, 0, sizeof(*si));
 	early_memunmap(si, sizeof(*si));
 
-	memblock_reserve(screen_info.lfb_base, screen_info.lfb_size);
+	memblock_reserve(__screen_info_lfb_base(&screen_info), screen_info.lfb_size);
 }
 
 void __init efi_init(void)
-- 
2.43.5

