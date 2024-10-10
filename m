Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D22201243
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584774; cv=none; b=CAkHVZlUQqGbEww2fvCxjaEm8p6iUTD7/VF7ESDCk2OeDZfuZvSSKJTYTdI32A6KYPEZur190qmrw131m3/cFyTM0NRCQ7Z4xQCQtZAvosztRsl+hwsDf72temS02HLHGuw8Rizu6PBM+3KEvkk8lHaMQtHwjYoSARilsPc5GXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584774; c=relaxed/simple;
	bh=t32hhiDzmz/KF55Q/3vtmKLh+T++3xGW8zC+Y7mhAxY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WeTrhex4v0u1gPanCcL15a9ihylm50Ht28eSfd/mKFg7V5zgQielucb0DlS53qbWAyeXu1496fs0HaUZqpdXyZHsyqmrnJIPrdf864zqfsjUm9mZwZW7jDQI8ESWq3opKb70vXufSqGIvU3Oo5IQ/RZZuioEsT8xNBviZjmgRFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xXcF6s5i; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xXcF6s5i"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7ea38f581c9so1274181a12.0
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584772; x=1729189572; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQkfEcPm4BCGA2NCPxYbIcRTjXNaFQKnzNzKtIM0PSc=;
        b=xXcF6s5i4CazMN1f9c1RAKn4hx+gCARyfGcPnwc7Joh6SF/pzNuonwOGjyHUgM5zQx
         3fqXBxZG9L/i+TscCPL1AEbt8qCIPS4nrWAQprkfLhbx8TKoPP/KuDOPacDQPwIUvReD
         jgwYpEtMhXVQT5iA/jQy5KEa320ybmvTfA6/PwWv2KKpJvLaUMiT1n3HugzNIawtAv77
         RbL0dSXvVM9Y9Hh6zKaQFOxJJAsqX9MqKHNU7sqpNhbKjybcviy1aCpNVN8iJSgruxe9
         2E+RKvZumFYsLlvctllXay5C9b5rwzDTkeCSyDg6NuUB12lx2NaMQXtXunM3ZtHOTLPg
         CfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584772; x=1729189572;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UQkfEcPm4BCGA2NCPxYbIcRTjXNaFQKnzNzKtIM0PSc=;
        b=H3NUIdLyrL5VK4e6nnlDvPFCJI+eICqNR8kRtgLWiJUsRUBa3onr84ak6kusgCUCd2
         HN/xmeSSL2FUG2QzsuPO2NMga2eqDqnTLbp1f2tFnGmr5FWiuD1Fi3dVyYEvE1LfU8+W
         F8qSx6XaN1h+3sFXLuO7XOTiaooy4zcx0zf+BXk2gKQR9KTHjTaynXTKJKuOh2SMF7ld
         czPH6rCPemlqWeAU95ni5EIOsEhHfOcDAfUoUJZW1P+FLYIQ44FSMRy/4lW5PiuZt98W
         kqHss0keoHmpBLkGHCkzk8eIR7N3jcnLp7tZ4ovyX4QZQ9Pcb3HoN54LRmv2VziqypxE
         o2pA==
X-Forwarded-Encrypted: i=1; AJvYcCWZn2CprgAJmqrtfe+Bu8kM53kjEkUlC2X+SqmvM5Is6nGu7vhW0E3zQLeg4OJSqcjos4ngGO2iEbk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp1r3/aQDeG2lc/0w19N5bAhDZicM2zvP7TbhAAZJ/Q8PKroQ5
	OqDI4tf1B8jPXBmdy7DxFEweFfp58S3w00rvBA74oWV4UUTGEyV602w/Cp4Vh0pfsMvK81+/5n3
	7KA==
X-Google-Smtp-Source: AGHT+IHq9hr54ORGaKAudrJMY0Hy9bRYjmUvRYz8zAm0RAj3x+bD9YD3f2uWGLgDblXeQYOnnP141duUJXA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:1d03:0:b0:7db:539:893c with SMTP id
 41be03b00d2f7-7ea535a65c6mr17a12.9.1728584770873; Thu, 10 Oct 2024 11:26:10
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:40 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-39-seanjc@google.com>
Subject: [PATCH v13 38/85] KVM: x86/mmu: Put direct prefetched pages via kvm_release_page_clean()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Use kvm_release_page_clean() to put prefeteched pages instead of calling
put_page() directly.  This will allow de-duplicating the prefetch code
between indirect and direct MMUs.

Note, there's a small functional change as kvm_release_page_clean() marks
the page/folio as accessed.  While it's not strictly guaranteed that the
guest will access the page, KVM won't intercept guest accesses, i.e. won't
mark the page accessed if it _is_ accessed by the guest (unless A/D bits
are disabled, but running without A/D bits is effectively limited to
pre-HSW Intel CPUs).

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index e451e1b9a55a..62924f95a398 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2965,7 +2965,7 @@ static int direct_pte_prefetch_many(struct kvm_vcpu *=
vcpu,
 	for (i =3D 0; i < ret; i++, gfn++, start++) {
 		mmu_set_spte(vcpu, slot, start, access, gfn,
 			     page_to_pfn(pages[i]), NULL);
-		put_page(pages[i]);
+		kvm_release_page_clean(pages[i]);
 	}
=20
 	return 0;
--=20
2.47.0.rc1.288.g06298d1525-goog

