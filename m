Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214187;
	b=F21rRxuXHdmx8Po8JzOyhyMdNhAEjAfYy7bIaTiLIok++YdgqS8vYTMd1O7UAmuOJk1o
	 wu2NxqGiMhbOsaaYETd4l6OMqNDmYRX5KKy0phUM7LDFUl2Key6MY9OSVBpltRoHgSW4y
	 WvzXA9x7j/CWMtT22IZUeWh6XQSghWgeC6xGnTiDVx8PJwb8s+loZvoaNwzPpsuxLEKMg
	 /9HedrPK6EUjnN5nbzfA9Rm49Rz+Z2+gAoenl0PFoJRC6sGuUEETo5Cz+c+jB+K8MwkMO
	 HiHWd+oWI2oU0dD67AoHGWaah6FMWlO4riVogCG/BgCwlS0wvuqU4efiZZfIpLWgLEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=RloCiG6ktfajfft7oZXWWlUR2yO2W/arq16CEWx06hk=;
	b=r4Ia5T05XqO0a4QeyHxt6yaWMMFRHgfyL23F7CnpnLXLmB6hufJyVfYN8Gxrg5Lva5Hj
	 1koB3KQ2KobRVuoH4Zvfy0ZZ+01c715NBBrDQithQPoirrNgD/eyns5C4Hb3+eDzqE5MU
	 7fBHLsDiwWA5VMWrTKgZ1aAZZAHAwSG7ncbt1uL9LD2qVC0JfzMF5lJer3P5vrPP8oBuj
	 bCL2nqtmJC0zxwSj4oLGwluI1e1OZPHD3/grHTOz9hKV84Hwg/1lM7sijfpAVF2/LXWlI
	 xErhunGkpgOiQzOJYIShNxDmR5m1HMcQCq5n6dkBc3FlKhEto6OgBNwWDjt1mNn5R+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jgOznClL;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9156C60A380B
	for <loongarch@lists.linux.dev>; Wed, 28 Oct 2026 19:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9156C60A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jgOznClL
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e95f8543c9so10026015ad.3
        for <loongarch@lists.linux.dev>; Wed, 28 Oct 2026 12:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214187; x=1793818987; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RloCiG6ktfajfft7oZXWWlUR2yO2W/arq16CEWx06hk=;
        b=jgOznClLJwgacVlChWeCXOkf6vNx2OifWn7Y4zHBhXsO106HbUUeLT4pFUpOaVLccM
         X2fthXMOFShqq6dp37AR7wO9X3QG0VwHPd9n1tKqCB/dOx00FPcsS7GWuWTpY1L4mYQu
         oVAUH/1NWiyfEFecCP7OLAU2wl/uFCm4pX0rC/Xi3f+/t/v1VXZLU/oEDPbsctPFf/CB
         Fd3+S2SR/VcLALJsufORjssatUex0KWkxxaMWZaRvW9U60DF90md5/xoGjk52uM57qdq
         C8YkNnYW4OYYOGIVmCSqve8GjqDgLJMsPzzt4vCfjHy5BwVSLGu9MpCGztGZzRvafMic
         PwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214187; x=1793818987;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RloCiG6ktfajfft7oZXWWlUR2yO2W/arq16CEWx06hk=;
        b=bmpNVoXnoE1KSb91zBh11FTMmcywhd+DI1rDgOga2BB24mzKE0NwvyRCBSIKvP9mq3
         OHZaJ8RZeFshyuE4njPrWibaomOG7C4lxU6fc/e5BRGnfXumWgCH6QEnFTocBN6U5Urm
         3kwNDfwANMJIN+RtS+GAOo0dpdueTA9TRkcTKB8o33J3EYBLhRIhUW7ceY4kEPRav9L6
         97wwj1Rn4G2G5ZozKb3tAyaA4J3wkE5fnMOsd9QNKxi5DVTYBI9nLTHB9/nCa4/TXwOY
         jVr2EVJmafAIXAefU95GRQipFFXN6X4gJ2OLnX+cDFyDo4OHBiCzJk+EuLBq6gpEdMr0
         U9Fg==
X-Forwarded-Encrypted: i=1; AKwUvBw3UqLzepRPntE1PhdS2cJOAS/On47fxYI+FS6H0DoA0MX/3BfPRnQRJEAwHsRakL639vIck9i4uGc=@lists.linux.dev
X-Gm-Message-State: AFq9FYIn4kK4KvYR+wzeH9YlYh8QoOaiOgnJunf3VuvO0u1hbiN0JzuQ
	zeLUAwxar12jxfu5y1uDVQBYOYuvh+4mpB5+xJjWfr5yWNesOGlKwjsSr/g3v4KPhLoRnCfHatE
	+E3dpUw==
X-Received: from plma18.prod.google.com ([2002:a17:902:7d92:b0:2e9:73da:58d6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d504:b0:2e8:3d48:4d92
 with SMTP id d9443c01a7336-2eb003bf1dfmr27738995ad.33.1793214186739; Wed, 28
 Oct 2026 12:03:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Oct 2026 12:02:56 -0700
In-Reply-To: <20261028190259.1819571-1-seanjc@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028190259.1819571-5-seanjc@google.com>
Subject: [PATCH 4/7] KVM: MIPS: Rework kvm_arch_vcpu_should_kick() to use
 standard implementation
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Rework MIPS' kvm_arch_vcpu_should_kick() to use the "standard" arch
implementation so that the arch hook can be dropped (MIPS is the only
arch other than PPC that implements a non-standard hook, and PPC uses the
recently added @force param when invoking __kvm_vcpu_kick() instead of
relying on kvm_arch_vcpu_should_kick()).

Convert MIPS to the standard implementation even though the code should be
unreachable (neither kvm_vcpu_kick() nor kvm_make_request_and_kick() are
used by MIPS or common KVM), so that there is a bisection point if the
code is somehow reachable.

No functional change intended (because the code is currently unreachable).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index a53abbba43ea..c37e212bc0a3 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -122,7 +122,7 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 {
-	return 1;
+	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
 }
 
 int kvm_arch_enable_virtualization_cpu(void)
-- 
2.56.0.313.g2479322e68-goog

