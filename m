Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302787;
	b=yuogD1ri/Z0STwksZHNZKqjvTMqg0MeXL2S66XGo4A2fAduYAdK+Vrz5hbr4FRgonFEf
	 xFngaF28ymtQOyCGfJVrVrzHhIoeMkvFe52mzRLd9G26rrkRvcQkRBVZ1Iw9k0HjK77aJ
	 4pvoTw3M9G+Fz7ueUwVsKcVvoUPaEYG5TGhIaH3v1lBNV0Q5/d4Wh/pUl53OUSpVjyD7M
	 q+w8IdyL4vPKuXxpDhZsnuqcKNVgTIGrL5caSk+m9cTzL56uIfHxScZh1cJx2gT9uop8z
	 fV4hh++3uRE3Zd0xLxWzfu/VCAadChpXB7uZGgzNYF5EAGUsWDhyss3dnPTG9l+a5LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302787;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=UriPUrEKGMPcV1kTeVLDKkGMmTprVWESy8oG8aPSbZo=;
	b=HtQQFKIzajlbuU0IzWETAgXv3dcsmudkfEXLHkiEY3mV8JCsQn9680YHQ5J54g+oWHIO
	 Hn1xBShztUpfFojq8WxLiMcRBHf45bvB4z+3ewr0clidSEuGvJPX+EVrOgMUozswmgzp3
	 Icb+nrV75G1/fs6XfERx0A3kEu7WtKOO2AskrogHqPHZXVHGFz8bJgiLaNFbHa5dzIigN
	 jQroAadZrFVTMUzEtEseCBeHs9zO7RP4zV/2SGvNQL4gvV7RqCpWiaClEiRgqkJUyqE0w
	 JuAPGQx1zpPujwnHLyRdPZPOCb160HqRlMTlfjsn0sCPyELsOMZ9J5lf6ckSsGbU3NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB90606B178
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 09:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBB90606B178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.172])
	by gateway (Coremail) with SMTP id _____8Bx69FA4_JqWiMeAA--.21162S3;
	Tue, 10 Nov 2026 17:26:24 +0800 (CST)
Received: from ubuntu.loongson.cn (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJDxSs494_Jql3UzAA--.21244S2;
	Tue, 10 Nov 2026 17:26:21 +0800 (CST)
From: wuqianhai@loongson.cn
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	tzimmermann@suse.de,
	deller@gmx.de,
	bhelgaas@google.com
Cc: ardb@kernel.org,
	ilias.apalodimas@linaro.org,
	javierm@redhat.com,
	loongarch@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-efi@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wuqianhai <wuqianhai@loongson.cn>
Subject: [PATCH v3 5/6] efi/libstub: Enable direct sysfb_primary_display access on LoongArch
Date: Tue, 10 Nov 2026 17:24:24 +0800
Message-Id: <20261110092424.2647921-1-wuqianhai@loongson.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110090203.2631481-1-wuqianhai@loongson.cn>
References: <20261110090203.2631481-1-wuqianhai@loongson.cn>
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
X-CM-TRANSID:qMiowJDxSs494_Jql3UzAA--.21244S2
X-CM-SenderInfo: 5zxtxtpqkdxqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GF1fCFW5GrWxCFykWFWxuFX_yoWkCFgEya
	s8urZrWr4j9ryYgr4UKrWfuas0qay0qw1kZF92yrW3tw4jgwn5Ww4kXwn7CF13AryvkrZ8
	A3WDCF9xAr48tosvyTuYvTs0mTUanT9S1TB71UUUU8UqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbBxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwACjcxG6xCI17CEII8vrVW3JVW8Jr1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v2
	6r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14
	v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
	sGvfC2KfnxnUUI43ZEXa7IUYsJ55UUUUU==

From: wuqianhai <wuqianhai@loongson.cn>

alloc_primary_display() returns NULL on LoongArch when neither
CONFIG_EFI_EARLYCON nor CONFIG_SYSFB is enabled, so the EFI stub does not
populate the core kernel's sysfb_primary_display.  Allow LoongArch to link
directly to sysfb_primary_display, like x86, so the firmware framebuffer
information is always available.

Signed-off-by: wuqianhai <wuqianhai@loongson.cn>
---
 drivers/firmware/efi/libstub/efi-stub-entry.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
index efa3ab8ad1c6..2ac22720675c 100644
--- a/drivers/firmware/efi/libstub/efi-stub-entry.c
+++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
@@ -20,6 +20,7 @@ struct sysfb_display_info *alloc_primary_display(void)
 		return __alloc_primary_display();
 
 	if (IS_ENABLED(CONFIG_X86) ||
+	    IS_ENABLED(CONFIG_LOONGARCH) ||
 	    IS_ENABLED(CONFIG_EFI_EARLYCON) ||
 	    IS_ENABLED(CONFIG_SYSFB))
 		return kernel_image_addr(&sysfb_primary_display);
-- 
2.34.1

