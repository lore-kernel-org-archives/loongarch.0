Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6542F5C5A
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 16:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752685181; cv=none; b=VbbqPO/tpRYJw6kBzKnpHO8lwl+wKqnYtABUxmVD9wHb3zuBo5/R/pl7C5pKOYuwQdVnIiEIhw1EjsF7Q4G0X5McOcmu5jyMKNGsvcWnUDFGmcgk/Lwhee4h+wHdyhAnP5UnAZx+zuELNV/Lpr2ZnEKg9UZ55G73RbYnNtPLIAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752685181; c=relaxed/simple;
	bh=deNZy0gqTMsn1Sk/pOG5xml3B2QMrUmUO+2dpO3ZPv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LwUuvspDbmChwytuPIWgsmbgZ4ZDO7oM/9V9tQE8epefqjDSd+GLM9897mUHckJEqr2LoK3MbyumV53Rzx7oV2ra9NeNEsjB+QZrafuwqZgah5azwQhVH4WYixoFTRfvtaJyMXXFDzmh3/u2trRdEEpJZ9EufGx+84sJs1VPB1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXOLqwo7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXOLqwo7"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23694cec0feso250965ad.2
        for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 09:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752685179; x=1753289979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9i9Yeqsjy/MBvGhDry9fFhgb0aml5g6UAa/VUCvHos=;
        b=AXOLqwo7561Hif3oYgIheuW1M+ciLuWuxKTxdXb1xxA8XRgv+NH2vP0K5RnuS30m4B
         ceK1abNxWt0Wn8TLpJ+TnElqbFHZ//oTWLYcxSIWrDX+J1aueVeAsDBF99ktzxKJBdW8
         I110sy17/uizyF/5pTVEqfTZ/MqnWAbS5BeRh/hI8mdpg1j/VKgAScxzEGckBAdR2eju
         WXmOkKyHXfJa4yxuTKc7+tlSRkbZ1Jwr6ZmIlbHnlzYQjG8CB7AZcNkyWG466ILeHTqV
         NCVwr9fDSYcFd/7foOfK4wiu4u08QQSVHpAKJOz+OFLS4yJSNWz2+j4eRQ/JWvlWl/cf
         k0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752685179; x=1753289979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9i9Yeqsjy/MBvGhDry9fFhgb0aml5g6UAa/VUCvHos=;
        b=CagVeZvj0pkZ9yLTNLU9Cfp716zoDMxflzSxVbq3Ce2dBW2ZMQpKk+VvzTcq9gkePk
         kPnizraJZmSTJlQtCFvP9bOVAkwHqt7iR8Cx+XXU12wHBeeKEAqxu85naL/cH51rIfW6
         sZUvGhKGwqqiC1wFJMM5iXXAYz5VKLxy8UeuJn50aGFOFjD77Ryf6ZLQW4O6+YGsvaUr
         CBrtgq5GAuoTKYJ4VFbip2oOZA91c83uUi7xNlzNrwKDqrMGLkJc+wjqp+Q/9tEmJh41
         5dxADPvxBLEGhl1Md5bSiMmt0i3If6l4mtc43e5Mf1IGCagHB0Adc/rlk5p+fvylkYe3
         Su5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVfdwXo9EQbyX7c9BKUE3k7GRE5HAI44Np9KU/CJ4pzmE6BJcEyAL1d4iwroSfkNG0VrCsL56CCys=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgHCyk0FBpiNSDkN3DZXf23gW4I+8OJb0BOxWagPwoxUJ5vDaH
	jVyIaMtF9S2GTREVqb6xCA7DI4Gt7EX2r41NwXLJgB+vc40HvVgMYq8e
X-Gm-Gg: ASbGnctYdeZB1KAJ3VFP4Rn0ICfl3mMX8o50pTTtmqZicaW4xXM69KTRQveFceFTfsN
	Tk+YIKpXDw1OcmC8idIz3g9k6fe0YZw3yrCStk2nCZKq6AOHYdH0Iqns/fYOcvlrdW8hP9WiLy1
	RhEvbF5i3eLBERxwKw50bQxrRxhwqKaefR9Bjdrva3zsZDDOfmGJEs2KhT53mluMCMelahlpYO9
	jrsMNHBzi7cuJAB/zp+xn4IIDdPMfUDkNImlKFiI9Ank9IuxlWxCTiZtZZwcLT19IR1wHMAMdmf
	jWEFasf6X5OfTqxXgnDoo8rqXE2QK0A/+HL4zhWorJYd2pGyGCQebE4SSUHHwgLCf94LqFhIuwq
	Kl1xqJPfmJwStlb4GogO5GgNcKfqA0TeN
X-Google-Smtp-Source: AGHT+IFDKpvzgv7uLs+wBQtKXYWTaK3q+F2DNaQGyC1M1O4xIioma5k1pZH/BBkL+8lpjDhwWdQUPQ==
X-Received: by 2002:a17:902:ccc3:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-23e24e129d1mr60238965ad.0.1752685178720;
        Wed, 16 Jul 2025 09:59:38 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4359ddcsm126901705ad.207.2025.07.16.09.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 09:59:38 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 2/2] LoongArch: KVM:: simplify kvm_deliver_intr()
Date: Wed, 16 Jul 2025 12:59:27 -0400
Message-ID: <20250716165929.22386-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716165929.22386-1-yury.norov@gmail.com>
References: <20250716165929.22386-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>

The function opencodes for_each_set_bit() macro, which makes it bulky.
Using the proper API makes all the housekeeping code going away.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 arch/loongarch/kvm/interrupt.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/arch/loongarch/kvm/interrupt.c b/arch/loongarch/kvm/interrupt.c
index 4c3f22de4b40..8462083f0301 100644
--- a/arch/loongarch/kvm/interrupt.c
+++ b/arch/loongarch/kvm/interrupt.c
@@ -83,28 +83,11 @@ void kvm_deliver_intr(struct kvm_vcpu *vcpu)
 	unsigned long *pending = &vcpu->arch.irq_pending;
 	unsigned long *pending_clr = &vcpu->arch.irq_clear;
 
-	if (!(*pending) && !(*pending_clr))
-		return;
-
-	if (*pending_clr) {
-		priority = __ffs(*pending_clr);
-		while (priority <= INT_IPI) {
-			kvm_irq_clear(vcpu, priority);
-			priority = find_next_bit(pending_clr,
-					BITS_PER_BYTE * sizeof(*pending_clr),
-					priority + 1);
-		}
-	}
+	for_each_set_bit(priority, pending_clr, INT_IPI + 1)
+		kvm_irq_clear(vcpu, priority);
 
-	if (*pending) {
-		priority = __ffs(*pending);
-		while (priority <= INT_IPI) {
-			kvm_irq_deliver(vcpu, priority);
-			priority = find_next_bit(pending,
-					BITS_PER_BYTE * sizeof(*pending),
-					priority + 1);
-		}
-	}
+	for_each_set_bit(priority, pending, INT_IPI + 1)
+		kvm_irq_deliver(vcpu, priority);
 }
 
 int kvm_pending_timer(struct kvm_vcpu *vcpu)
-- 
2.43.0

