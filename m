Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301102;
	b=GD1ZTBEEsUwsqqZoipvikxN3M8FGjh7cjV077v+4S2hdx8vWnm9e9ZIn/UsKlLKbet06
	 P3fSlUp+Ugqh0er9wa/gw1qL5vfRvSTES9VekzT5DFfwCEjkasJ3Q65drTWQJfzg5p7S7
	 q//Py30O22vpssvncg1CwIBrhWVYxDfXeeNYeNf+6JuMBMIhwd+gDWL+uRsmwJUE/1VFQ
	 5lUVgyFT0FxYYPd/hOHearTsEmAKUdW/Rb48+G2PaT6X76kTHGB81OuZy++1CrVwQ4aQq
	 rNVfDhlW3xXYfdgv1MkRkperk5+AO9S1QSY9+9UHYxOhJCgO3Xw/N144ymTZ2JSK62g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301102;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=4dIt1AfgIDEeFJWlP0nlFpcsbLLfzKQxu18qQOXeU/w=;
	b=TKtT6uY1OzpzbzJwCS7rob7oglopHpdZy6qzzP3tESj24MC17rpJPOKHAjDT50vfjtzB
	 X28lThNADcnOcQnuTjv+MxH/ir7ij6m/mtMk0z+N2lEN+QIo07KTNKwZ/bwUrS/Y/+Wpt
	 QSABwaiPEKLrB/9zmLUZ8P/2QRRdWQpKexZw4HnwPfCHAOevcvItj+B+nCsCeDbYKriOP
	 C0G/ec6Mqx/SI080BpJ5vPJA2yP437N4SrFw/9KSR67G3RnojZb1LcAuN0b24/vx0NjBK
	 OtMzi4Fb3dVOst68BUEqIGgX2Ur5JLyQMki7DijRw73bDMSzgJ4EejC5aSi9pzXJg4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BEC1606A325
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 08:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BEC1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.172])
	by gateway (Coremail) with SMTP id _____8DxOvCq3PJqZiAeAA--.21672S3;
	Tue, 10 Nov 2026 16:58:18 +0800 (CST)
Received: from ubuntu.loongson.cn (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJBxrM6m3PJq83MzAA--.21431S3;
	Tue, 10 Nov 2026 16:58:17 +0800 (CST)
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
Subject: [PATCH v3 1/6] LoongArch: efi: Provide sysfb_primary_display for screen_info users
Date: Tue, 10 Nov 2026 16:56:12 +0800
Message-Id: <20261110085617.2626835-2-wuqianhai@loongson.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110085617.2626835-1-wuqianhai@loongson.cn>
References: <20261029033440.973077-1-wuqianhai@loongson.cn>
 <20261110085617.2626835-1-wuqianhai@loongson.cn>
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
X-CM-TRANSID:qMiowJBxrM6m3PJq83MzAA--.21431S3
X-CM-SenderInfo: 5zxtxtpqkdxqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uryfWF1ftrWDXrW7Ww18tFc_yoW8trW8p3
	srAF4ktr48GFs8Jryvy3s7urW5Gr95G342gFnxCa4rAw1qqr4kXr1ktryDXFyqqa1FkayF
	qF1rXa1avF4DCwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JM4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jwrc-UUUUU=

From: wuqianhai <wuqianhai@loongson.cn>

LoongArch defines and initializes sysfb_primary_display only when
CONFIG_SYSFB or CONFIG_EFI_EARLYCON is enabled.  The PCI VGA arbiter and
the framebuffer console need the firmware framebuffer information through
screen_info whenever CONFIG_SCREEN_INFO is enabled, even if neither of
those options is set.

Drop the guards so sysfb_primary_display is always defined and
initialized, and its EFI stub alias is always provided, mirroring x86.
This avoids selecting SYSFB just to obtain the symbol.

Signed-off-by: wuqianhai <wuqianhai@loongson.cn>
---
 arch/loongarch/kernel/efi.c        | 5 +----
 arch/loongarch/kernel/image-vars.h | 2 --
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
index 69dd83f8082f..e491a82b2e0d 100644
--- a/arch/loongarch/kernel/efi.c
+++ b/arch/loongarch/kernel/efi.c
@@ -74,10 +74,8 @@ bool efi_poweroff_required(void)
 
 unsigned long __initdata primary_display_table = EFI_INVALID_TABLE_ADDR;
 
-#if defined(CONFIG_SYSFB) || defined(CONFIG_EFI_EARLYCON)
 struct sysfb_display_info sysfb_primary_display __section(".data");
 EXPORT_SYMBOL_GPL(sysfb_primary_display);
-#endif
 
 static void __init init_primary_display(void)
 {
@@ -129,8 +127,7 @@ void __init efi_init(void)
 
 	set_bit(EFI_CONFIG_TABLES, &efi.flags);
 
-	if (IS_ENABLED(CONFIG_EFI_EARLYCON) || IS_ENABLED(CONFIG_SYSFB))
-		init_primary_display();
+	init_primary_display();
 
 	if (boot_memmap == EFI_INVALID_TABLE_ADDR)
 		return;
diff --git a/arch/loongarch/kernel/image-vars.h b/arch/loongarch/kernel/image-vars.h
index e557ebd46c2b..4d1d7978553a 100644
--- a/arch/loongarch/kernel/image-vars.h
+++ b/arch/loongarch/kernel/image-vars.h
@@ -11,9 +11,7 @@ __efistub_strcmp		= strcmp;
 __efistub_kernel_entry		= kernel_entry;
 __efistub_kernel_asize		= kernel_asize;
 __efistub_kernel_fsize		= kernel_fsize;
-#if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
 __efistub_sysfb_primary_display	= sysfb_primary_display;
-#endif
 
 #endif
 
-- 
2.34.1

