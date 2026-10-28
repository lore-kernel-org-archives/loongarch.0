Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214184;
	b=XxPHu4mUhQ3FYB198MCe/SVeLIkqelE6ExunC5nwHEtslcZanfEfqMMyZoVJrFYP6yyl
	 XPXCvBAr8IawLxB4IHVVz2CzkDvVOxPDHM+1mYPnDvEWrpeb8VpOkJYGIahk7btHivRck
	 lvcUgvDVJ3i1hqKYBjyD12be4wmxSa+p2GiAoA5cN/6o+c23lZ2dPvFKmf5dZUQ+gdAee
	 a/somO9NssCodt746L2Ng15k3CxArAKZlljOOVtZ23u46Et7AoOhIYHMKC3BlWZhMOsfP
	 spfDOrsmeNAuhcMpsrGcujNvv+IhZczSEDKe/MJWoPNhhHNW0JsjpOc/Vz/1IMdXQ2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=LaqWhYbOMD7sY9Ovf2nEN4IH4sn07uRJnSek/bjgEtY=;
	b=L8jF/wEitkE+zOnTxzI1qPy/hWNZPJqQfBGlpj7o6Y4lq6BvLdtTwfkulohsmAyKup84
	 Ok1SmIA7t5P6msxWIf7OYhoyA1rWjiBy7gcZ1XjRpPDt06ooeCeeztuHjPdSpbKYjYzWQ
	 pIMstcw4H/KkNtH2U5KXQG4MCQ4oOksvBeF+SsVL2UqtVQyVCCbMfoNNbmyV2aBbc97Td
	 KNZPvNXCXC9gaOXfKFM0wD1gm5Qbu+YJaVbJ45Q79vN18U43VDz8lx9l3wuvZzJdM6Nnd
	 KJNUnNQsUMwNygZnQZI/7vIzLWG82R+mjkSa+A+mCS6M6oHLKqkqga5E5rmYT287yPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SRelg7ym;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64C0606A33F
	for <loongarch@lists.linux.dev>; Wed, 28 Oct 2026 19:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B64C0606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SRelg7ym
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so1920901a91.2
        for <loongarch@lists.linux.dev>; Wed, 28 Oct 2026 12:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214183; x=1793818983; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LaqWhYbOMD7sY9Ovf2nEN4IH4sn07uRJnSek/bjgEtY=;
        b=SRelg7ym7xcHnKqSh95pRwfJN3CvpXWHSRuF3+HDzy9lkJHxi5kJvEJuJwFoqiX2r/
         uJupVzgCz7jJFbMyMpp1N4k3rmj9jJ9j6xZWCfr1PfGlahcc7AA53lwTWerAb7gKqgVP
         MrRIq4EoVKXt+Q7kibLMmKBJWK40SPCSWe6PkU0JhtUSXyMPbW3f4EHwlyevXgpxhT0a
         2XuFZHiHDD+rtdUwu0rMekg9PgSi/bblwBD0TnN2OZRhZfCZZyMICmoUp7qSqXm6j3iF
         kRvvRzyjpQDMhzjD6iF01OQ2T0LweMJWOA6vH03UOxfWrnD2+gwYkzt59ry5N2oOnaMo
         g/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214183; x=1793818983;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LaqWhYbOMD7sY9Ovf2nEN4IH4sn07uRJnSek/bjgEtY=;
        b=uh6nEhc2c7zXgIcyVqwnhi4xoLDdaUDnk15H2OCW4czzZFOzoRzX0pSSZaWfMxZh8v
         TBrEW0TjkWcRglmbm6mTXHvrlkmq/EvbXo0OZCZQ1Sb42CAkZ+m95yRDiHT7S+2N+h0B
         hluFaI1RRqEELv6k9fGIi9eiUR1n3lwmngtTu+lCJynu8BbQGftuI1bCdmuFysRCORPt
         inUzWaMtXEg3mv37eRy3TIL8QjuZdSdsfBSY1SAacP6oe3olsVqvusmIXo2fFAAHSz6V
         6GP7G7nOrwsCtCdcLNHLk6f9EDhS2EOJFf4T1WyzQDP4Qqr7rx0HbxNS5VKsjkGXrMv1
         +qAw==
X-Forwarded-Encrypted: i=1; AKwUvBwjYmFA3wvDoehqC3rILK+OfyDR0XlEhI4ReKLg4HfS/5KUtzERHL3MeSYj8gb+s6mZG0OsqKASl2E=@lists.linux.dev
X-Gm-Message-State: AFq9FYKkLVUKbPDJiJbbrcb0hO2D3DHlAJtV6iJGxQzM6HSHJxZIzloD
	kihkKohwMIjF9eLhJwAPhQ6Zh+4HTmgsO/A03wLrbc4Snq508Mga0EqWLJmAFd/j9kBwJJXTl+9
	uPMvNHA==
X-Received: from pjbmh6.prod.google.com ([2002:a17:90b:4ac6:b0:3aa:f38e:cb2d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:264d:b0:3ac:9d83:8856
 with SMTP id 98e67ed59e1d1-3ae57e3d6c1mr2423992a91.9.1793214182870; Wed, 28
 Oct 2026 12:03:02 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Oct 2026 12:02:53 -0700
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
Message-ID: <20261028190259.1819571-2-seanjc@google.com>
Subject: [PATCH 1/7] KVM: s390: Drop unused and unreachable kvm_arch_vcpu_should_kick()
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

Drop s390's kvm_arch_vcpu_should_kick() stub as the one and only call site
is wrapped with "#ifndef CONFIG_S390".

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/s390/s390.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/s390/kvm/s390/s390.c b/arch/s390/kvm/s390/s390.c
index 18fb200f854a..9900a1a1c148 100644
--- a/arch/s390/kvm/s390/s390.c
+++ b/arch/s390/kvm/s390/s390.c
@@ -3922,13 +3922,6 @@ bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
 	return false;
 }
 
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	/* kvm common code refers to this, but never calls it */
-	BUG();
-	return 0;
-}
-
 static int kvm_arch_vcpu_ioctl_get_one_reg(struct kvm_vcpu *vcpu,
 					   struct kvm_one_reg *reg)
 {
-- 
2.56.0.313.g2479322e68-goog

