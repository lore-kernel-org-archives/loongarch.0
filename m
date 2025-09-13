Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD9729D05
	for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 00:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757723353; cv=none; b=a2Oe8vkIuYudLK5aBIo/DQBXlu7BXHY+NfpylyljBHY+pealt8WMvOwQOLc7jCXm9diiOr76ucaVPfcxRW+AqfChCO9y8SRN1JKAUcQiJ70bUVkPXF3ayX0OA+r7+O2n/aXeeVfGdz2PGikUPN6cplQLNg059tzblLC0AckstCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757723353; c=relaxed/simple;
	bh=o/2/1rLuGad7KFL3fjUL65woyzwOsWRQ8y/k/9zJK20=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=eiX+0JnL76T7ziRhi3hQrEF5M1N6MD9su1G7aCGe7L0Gb/mtJcT0MZ3+e6tir/OmoS5DJFxc3OUk8rtfVw9JZSaNqIDvyyM8fpG1oMS66JhK5g87SRE+ESP+tgA99iqE8tGZzNCYs3xYd9gUh5ehVLgRgnySBnixxZEin5q3p54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eV6eB74K; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eV6eB74K"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-ea3c9376d90so2372567276.1
        for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 17:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757723351; x=1758328151; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CmOJuo57ImQUiYUwmR7+IFwJm/0Fqs9h33y3GCq+M5c=;
        b=eV6eB74Kux6VU5iBU3xZ/4RBAGNm/9SBVgst9TvficdKmbyI7x9beVuUdhlxUnpaMc
         yAolMwMJ3+rQ3KlOwKdQTCMl1Z8sgJ0NSCLsR7Yg0SpHw1U9GJldw/8It0LxVu4lb7TO
         gz7XuoSten6dOyXcv1RyCceUvFguOCjmGoMHJHoGnPdrHBRs82VAmQwFfhc/mGzklGM4
         rBe/OwzQ8zJCyRMmOajEKadQ0y9kyIOTfxrVrIETZTMHWg1jwrU16T3dlik8NDqGzxfg
         xqo6eYsIWPgF+eeQGHpEzHGatYmAhsfKyupRXEYf1RyATyQXOQFk5oCOZSAafgHoQU1l
         ZJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757723351; x=1758328151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmOJuo57ImQUiYUwmR7+IFwJm/0Fqs9h33y3GCq+M5c=;
        b=phtKEia3IStTKMi37xdmkAAYNwoo9IPHsprVa4dJg9nxdEmZEORurJXAwauxcfw9UJ
         MWvBT4eqSi5QlgxDnip4WxWARHdx9lJac06uggCLDzO5qP19n4aYQtRseNK3Eo65LRCY
         8gRPIwosGEodG/d1RtyhZDgWBH3GrDGZonhJ3tAKhD90IsfYncfbWzzsVvzJlxM8TIbW
         Ym5ZAdnwVX3SNVO78t+C59Ta/q64fykrZjiJQRmnNT4bPuDxVTqIwOlno47+2tmZvvD+
         bIRvRdFdfeZ7X1F9zaXn2wJSQF5YkF4f5+LkoCeHUBKH0OVjII/rnwLAl1/EGw4CwaC7
         FPgg==
X-Forwarded-Encrypted: i=1; AJvYcCVwfJKIAbyLIZpUVMpI8sqYYtJSpsdcH2KJD6Fs8Mj0QPiy0XfJAHqPEi00GP5Kqb4BinOVGW343bQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRht9VENwkyDDPFJIbK01uF/48OSRUEcmLa/pZqeFwc2OAetTO
	C9nkMjK9eAEcSQJ1AyrtT8BvnKoyNiqiGIYvsHtvJspCi+DShUEL1/nq
X-Gm-Gg: ASbGnct1BUOSfXlVPCPj0wm5FDymvILOG2rQfx9k6K7OR5hGxunMjcqPGn+abp+Sjwc
	0Q2wB3C+Wf4EPMKMs0+XbegqRgrZunuTmKwqSLgH6qMBmh/f8sbPr1ALV6Ex+8jBICqFjbdkwW5
	O22hF/01y2gF6Unq03dFV0V+WOZft8HCOFuxzwWiKbXl+ztt54xqh8H6ZO0AafA1ue74se2n3HL
	a27FOGKqCiLX0U85U1eUgoHIWe+iywUNS3GrjafzOKLr+AUFxE/SnL2CodaJkr5sogQqniz3kwW
	PdX93AglK5HkMtq2bid1FyiwGUeh3Do5uxfIgXD1YyuJc3+sMOAhpyK02x7mrqQpModb1O3EDtV
	b6ri/BK9TWJu2SCXqj+eAIk/DbneEfki3nqay8mIaxI6UVo5y3ToYsLlXWOM1itltUAMw
X-Google-Smtp-Source: AGHT+IEtdwnNl1zhwm0zJTMTaAzTVGehCEQNymipUs87iXcurGE3yl/I9Hy29mFJtQZMSLEbg45DmA==
X-Received: by 2002:a53:c541:0:b0:622:6078:42bf with SMTP id 956f58d0204a3-623389c38c0mr6011595d50.5.1757723351254;
        Fri, 12 Sep 2025 17:29:11 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-ea3cf211a04sm1793439276.20.2025.09.12.17.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 17:29:09 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Xianglai Li <lixianglai@loongson.cn>,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: KVM: rework pch_pic_update_batch_irqs()
Date: Fri, 12 Sep 2025 20:29:07 -0400
Message-ID: <20250913002907.69703-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use proper bitmap API and drop all the housekeeping code.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 arch/loongarch/kvm/intc/pch_pic.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
index 119290bcea79..57e13ae51d24 100644
--- a/arch/loongarch/kvm/intc/pch_pic.c
+++ b/arch/loongarch/kvm/intc/pch_pic.c
@@ -35,16 +35,11 @@ static void pch_pic_update_irq(struct loongarch_pch_pic *s, int irq, int level)
 /* update batch irqs, the irq_mask is a bitmap of irqs */
 static void pch_pic_update_batch_irqs(struct loongarch_pch_pic *s, u64 irq_mask, int level)
 {
-	int irq, bits;
+	DECLARE_BITMAP(irqs, 64) = { BITMAP_FROM_U64(irq_mask) };
+	unsigned int irq;
 
-	/* find each irq by irqs bitmap and update each irq */
-	bits = sizeof(irq_mask) * 8;
-	irq = find_first_bit((void *)&irq_mask, bits);
-	while (irq < bits) {
+	for_each_set_bit(irq, irqs, 64)
 		pch_pic_update_irq(s, irq, level);
-		bitmap_clear((void *)&irq_mask, irq, 1);
-		irq = find_first_bit((void *)&irq_mask, bits);
-	}
 }
 
 /* called when a irq is triggered in pch pic */
-- 
2.43.0

