Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301172;
	b=YaimlWtnBQji+mSFnyqb3kGabMfLAe4xjqlfAlUKXFmnZtSAoX107/rGrZjYMy7PiBB9
	 ioMmZOC1qWufBKX74Rb9cOyL9YMawmuQ2+ljfBirgY/8KTNsIkktoDv2JUk4aIHqiFgqJ
	 h0y4gzS9eGG4ZZR9xP44/tV29Mem1pELxm+ny7gxZyGzjpr65Wc0DF4PJUu9SsteJGw3u
	 QKGOTOJtQfHkogK4Pd53KdFnpEKIr9+9vcKbNGzTz8b2cTRqlOQ61eBhqG6uy/WAGQFzp
	 iZFSOV/pFCeNebFRIMLao/QnHBKn+qfw23ieJ4kxMGu9HGbeEGwfCEYIjPu2g2JzqCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301172;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=UriPUrEKGMPcV1kTeVLDKkGMmTprVWESy8oG8aPSbZo=;
	b=PS+Nnwcv8P73rEx8niALe/EFslw/Sju1tKVx1ACOGxj4J8d4Pfp2Xbq3mlxjHcJ6EvKw
	 0bztGNTWmOM9VubI4YxrjfBIyMasLlQcu4OPRwar7e77+N0LchWDx4IHgxiJfpQ6Im9dj
	 /mjXca2YY120lnZ8g25AYqFlycrOd8PE6ud1IvrIV7GC1+lX0RaRswGWtj5h1vyRSedWD
	 DEO5Qm+fi1kKC15yBuyPE2P2ro7d9IDQvIijwv+YXtjsEq1E8Y/qQfMtcP2yEA5CVF3qx
	 UXZD2zO/aP/gIzq2INrvBa3yLUSmB8tz3/KTe+pb7R1EZ7JddqGi/CgyU6L0zGusjQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E538606A325
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 08:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E538606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.172])
	by gateway (Coremail) with SMTP id _____8AxS_Dx3PJquCAeAA--.21460S3;
	Tue, 10 Nov 2026 16:59:29 +0800 (CST)
Received: from ubuntu.loongson.cn (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJBxa87t3PJqCXQzAA--.20943S3;
	Tue, 10 Nov 2026 16:59:27 +0800 (CST)
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
Date: Tue, 10 Nov 2026 16:57:28 +0800
Message-Id: <20261110085729.2628009-2-wuqianhai@loongson.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110085729.2628009-1-wuqianhai@loongson.cn>
References: <20261110085729.2628009-1-wuqianhai@loongson.cn>
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
X-CM-TRANSID:qMiowJBxa87t3PJqCXQzAA--.20943S3
X-CM-SenderInfo: 5zxtxtpqkdxqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GF1fCFW5GrWxCFykWFWxuFX_yoWkCFgEya
	s8urZrWr4j9ryYgr4UKrWfuas0qay0qw1kZF92yrW3tw4jgwn5Ww4kXwn7CF13AryvkrZ8
	A3WDCF9xAr48tosvyTuYvTs0mTUanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbqAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jw0_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4U
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7IzuDU
	UUU

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

