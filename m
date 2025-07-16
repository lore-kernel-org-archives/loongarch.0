Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685912F5C24
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 16:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752685181; cv=none; b=hEuhzNY8i9EnIgumQJphv9teLsAxQptJzyfcKQwaCh8kOglg1PZaDGMAulSkUKPzOEErtEJmljAKGYN1o+syJJmTUHkAow3m40SgmnWmJQ328HSIz2A62YkM3y9F7OrJH+hMjZjlTEgJtdV+kBdCWL0wMb/lSElQNy2CRcyLkao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752685181; c=relaxed/simple;
	bh=jkQQvNZpPH/2J4kpelJXhxOtCO/DZFsC1y0v/zswi7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=axco5meBWmjMIfu0x8M3mXvDcdpnnOO29QENYmhyftXnQQH3A0o5OKXEURFth27I+V+EDBDURuoRQIOivy2gNEPmc2rYyVbMJuwU7h58UyHOOC+K+HXLECe3tgISe6MpQ0reBQrikbzlDn/UwXyM+4seMan8PatCYeSnyh7aFD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXkWvO5u; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXkWvO5u"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23508d30142so650055ad.0
        for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 09:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752685176; x=1753289976; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiTrVurstj4F40PIZ+iGX0tIb5qeeGwqEUAH7aRWxJ4=;
        b=KXkWvO5uvlTudNzGD/jR+1L+XYmG/7Sj+rjPnI6J0u4Shdl8G6oxy/xA4A0RYFUSsJ
         RGzq2nI0+ip7YECNGqjSKABcbqtAym5XlrKhhsrgbxad9BWX1eiRS9+AaC83WLOE/fnW
         8nJCn2z4j3J3rT9sQcV9zoS9QSrEVBqCBqodbz9Ol+qmX8gLlypL35dzjcLcE1fA8Btv
         HIDWEZWIQUhF+u2P8QH2mED5g3P8C/Eq9XDmHfWLgF+b09n0LYW3iH8lWaGfOuV3OjIR
         TYLWePWeuZMzmoNQS4rVF/5rXQQP/V4qoswrNBJZMBoL0uYPF7GfjPHQK76wZ4ZSI/Qh
         4xFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752685176; x=1753289976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiTrVurstj4F40PIZ+iGX0tIb5qeeGwqEUAH7aRWxJ4=;
        b=MnR3I3swY4PR0dgok28n6POykRWIWxidrstFg2KLOJ5tbCfM5ENvfglgoRObSG02KH
         mAqihXhW5mZmEH0feMS246H7Hbl8PFx9egwkE5Z8y/xsix9KscV2E/VbHEWv9uRFKiq4
         apd05hLc3BDOysZIuHYG8zVCJ1Neqv/XDb9MGCXo5ZicKzvhB4q4n1tvbe0ckpmn6LxN
         nzLoB2xC5RpRhoi2qGkcx0Zs0B4mplsJv2Uzwc8fByUSvhH2jciT73IuPNXOSzKoAn+M
         dEEE3tYWT5LYMkUUzk5ISru+JCgdS5l0rqZ1LkFOKot5NfsiyOb3Oh+s1vnBC4vComie
         XqLg==
X-Forwarded-Encrypted: i=1; AJvYcCW4DVSLlqnVplwvV4y8bEno8+wob4RhnRm72+jJSf2rP5U2PT3S6ys/r7Frt9GSk83rvIibhnLVAz8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwU2IqTNjGYu6b62YeBX6nUL7FGyru2KjMHLz4Nab9bHfv8PcCQ
	amMwOr1BVv7VdO3GWI3TLov6p9R1bnzgvcZYwmboFXN2zhsXLS17iWy7
X-Gm-Gg: ASbGnctX2jiGOfoiJRIqw0vot2JmahD41xCjB6sZj5nNh5HJPaxWrDyhaXRmuRU2WLH
	BeuhWPE1Lfe/flPd/oPmg1Kwny3EL1pTRpU4aj7MvCHk7E+J+Vm9ixX0vZ68AWFZBao/nopLs7V
	eXa+VuI4aXW5HG0Yj6RQ2wMa38u1cAUpAtOyHHXQSVJIU4/zhHp1riUS6aF87kxeHRY3MmpYO5R
	00n8dxE8ppW56d3q4pEtVMW1VUpjSZdN6JAZClr4orX4f+aXGLImxyqFP8rSeddAiULRZshRAVk
	SPi9jkgfn5EAMLU21OH1Y0gCLtSq1BI+7fuBMw9FOnpVuOD2UivTj7SRNKijzEIRz3GOAFlLylP
	nHouvw1UmkAT/EkZEkU2b6edopu6U5sxx
X-Google-Smtp-Source: AGHT+IHDYGJSrqWvIYrXwA07rTPdrVHz0PpU4aL14ZgPQu+1ebjCr22oq2dQrQ5tz6hMocZpkjvvZA==
X-Received: by 2002:a17:902:ef08:b0:23d:d9ae:3b56 with SMTP id d9443c01a7336-23e256b7467mr54372765ad.22.1752685175538;
        Wed, 16 Jul 2025 09:59:35 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de432278csm132614785ad.121.2025.07.16.09.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 09:59:35 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 1/2] LoongArch: KVM: rework kvm_send_pv_ipi()
Date: Wed, 16 Jul 2025 12:59:26 -0400
Message-ID: <20250716165929.22386-2-yury.norov@gmail.com>
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

The function in fact traverses a "bitmap" stored in GPR regs A1 and A2,
but does it in a non-obvious way by creating a single-word bitmap twice.

This patch switches the function to create a single 2-word bitmap, and
also employs for_each_set_bit() macro, as it helps to drop most of
housekeeping code.

While there, convert the function to return void to not confuse readers
with unchecked result.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 arch/loongarch/kvm/exit.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
index fa52251b3bf1..359afa909cee 100644
--- a/arch/loongarch/kvm/exit.c
+++ b/arch/loongarch/kvm/exit.c
@@ -821,32 +821,25 @@ static int kvm_handle_lbt_disabled(struct kvm_vcpu *vcpu, int ecode)
 	return RESUME_GUEST;
 }
 
-static int kvm_send_pv_ipi(struct kvm_vcpu *vcpu)
+static void kvm_send_pv_ipi(struct kvm_vcpu *vcpu)
 {
-	unsigned int min, cpu, i;
-	unsigned long ipi_bitmap;
+	DECLARE_BITMAP(ipi_bitmap, BITS_PER_LONG * 2) = {
+		kvm_read_reg(vcpu, LOONGARCH_GPR_A1),
+		kvm_read_reg(vcpu, LOONGARCH_GPR_A2)
+	};
+	unsigned int min, cpu;
 	struct kvm_vcpu *dest;
 
 	min = kvm_read_reg(vcpu, LOONGARCH_GPR_A3);
-	for (i = 0; i < 2; i++, min += BITS_PER_LONG) {
-		ipi_bitmap = kvm_read_reg(vcpu, LOONGARCH_GPR_A1 + i);
-		if (!ipi_bitmap)
+	for_each_set_bit(cpu, ipi_bitmap, BITS_PER_LONG * 2) {
+		dest = kvm_get_vcpu_by_cpuid(vcpu->kvm, cpu + min);
+		if (!dest)
 			continue;
 
-		cpu = find_first_bit((void *)&ipi_bitmap, BITS_PER_LONG);
-		while (cpu < BITS_PER_LONG) {
-			dest = kvm_get_vcpu_by_cpuid(vcpu->kvm, cpu + min);
-			cpu = find_next_bit((void *)&ipi_bitmap, BITS_PER_LONG, cpu + 1);
-			if (!dest)
-				continue;
-
-			/* Send SWI0 to dest vcpu to emulate IPI interrupt */
-			kvm_queue_irq(dest, INT_SWI0);
-			kvm_vcpu_kick(dest);
-		}
+		/* Send SWI0 to dest vcpu to emulate IPI interrupt */
+		kvm_queue_irq(dest, INT_SWI0);
+		kvm_vcpu_kick(dest);
 	}
-
-	return 0;
 }
 
 /*
-- 
2.43.0

