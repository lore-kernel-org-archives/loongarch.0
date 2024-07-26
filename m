Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF2717F4E7
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038026; cv=none; b=O1Gtqt8Y5kDv/hfnNsH5aH1mYNImTDwwoaTcl4gdy5NSuVV6ShWFF7KUFNecu/kXVs9TLVrIY4IABsSiWhW/V80wneXLMurp1zzvrsX53trepmV1hTqrd+eehXml8it5Ue8CwHAnVeR43Gq+nOF3KmnxPpkPQrDY87emlhq6kK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038026; c=relaxed/simple;
	bh=uf9ms+u2NfXkgc6o314wQs4yJxndrotou5MTD6pjg7g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GfBEXzX0mnZoamSjVJwQFeet6WDHE2OPHDhU97io2/M5hozJ0kICmUG9Rn6/KNMeu4AY3/t11p07XUXgmouDveLe+5sSKgtHNAJC/h42910Ck4PfBdOnpb6cMEqaW+jLG8fvtyQwg8ayC0+5u7XD5jntpw5aZY8SJst6RdqSJjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l21dYVtt; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l21dYVtt"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e0879957a99so416343276.1
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038024; x=1722642824; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=bC28fbRseb42Ch2zMqBFWEix5TOk22ZdgToO+ip0K/0=;
        b=l21dYVttetvCz4UMPod5XKROMFtpJhnQ0ryZQFqATLz2l7sm4zFfK8YucYd/R4mPOG
         MKU8BtNd9Gf4sM5cwkgOI40RNPngBuq/1l7LmfSiV2WRCp8lTMk687qcWqVHmibp3fxu
         Mkt8ZmSXB78+PtD3iSEYbFohrGf3mVaNVag+ira/92YFWRhH00ScmrxHIYlvM7niKZhT
         tcjtCr1kHLUuOS17wLiVUEHP+6j9EKk8rXuGsigwFM86lETKwFdVIn4c+EV6AKwmFl32
         MbczOaHlqQUjEliWU3Q4Ux0v2l7hhOuQqbixMxq8/nkHOBERhiA56ngJwanzjnhH4Qjm
         BuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038024; x=1722642824;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC28fbRseb42Ch2zMqBFWEix5TOk22ZdgToO+ip0K/0=;
        b=n5lX62EJCV81FK+u2YPdGVhl/stMKiPJ9kl0saQSqGIHt5VtMsNoVPdvWcclI7+LID
         xymD2x6j2wWEPw/ERV57ETRK0PHovuKHJtke8KHnzZMst1bWiFPrtbahqrLiHqpMFZJS
         pjXCsweY5pgp3kDO016ApaKOB08yvUR0c+G77tjacjpF+xIrcDqRfE07U1z34VzjhVOE
         CD2tnVwzkT//EZzW/cKlAqsxPmDoQZygimmvsC9fPH9LbbtNow4tuC5XasVUotZb6C+I
         Fp+0SflnoRm/ZmE61UCN1bcDGKb0NHeKKmqx0fLf+AEtq7PZ6zvLc+/WTqh1TFOW52ii
         H5Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXEQB8T/xD1hTaMFmcRBUWVmupVSCPrnhBddXLtc4BJxTFUXSJKDGt/36n50bvrRZjsHxW8q96mFvePYLKDKF+F8nChxfxaB8Tg
X-Gm-Message-State: AOJu0YxA1NbGG+2HO2qZyOTqK+7bpkZ7AsioIq2sSE6opseDo9cxLODq
	SbOZx5JyhQnXQLsgCYMEVE+05G2zCXMR+CiiIfYY9JAJkEoj1LqLRybNnfdUFQvmOXHwi7qabzB
	MqQ==
X-Google-Smtp-Source: AGHT+IFe6CawsiHghHJz6goDA5MI5OiaYSIvtgnV/oY+y/tLOOW/H4O66kyosfEcqs3UQ2nQeG3uHH/jimU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:181d:b0:e03:5144:1d48 with SMTP id
 3f1490d57ef6-e0b5452490amr2050276.11.1722038023813; Fri, 26 Jul 2024 16:53:43
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:41 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-33-seanjc@google.com>
Subject: [PATCH v12 32/84] KVM: Get writable mapping for __kvm_vcpu_map() only
 when necessary
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
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="UTF-8"

When creating a memory map for read, don't request a writable pfn from the
primary MMU.  While creating read-only mappings can be theoretically slower,
as they don't play nice with fast GUP due to the need to break CoW before
mapping the underlying PFN, practically speaking, creating a mapping isn't
a super hot path, and getting a writable mapping for reading is weird and
confusing.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a46c7bf1f902..a28479629488 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3142,7 +3142,7 @@ int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map,
 	struct kvm_follow_pfn kfp = {
 		.slot = gfn_to_memslot(vcpu->kvm, gfn),
 		.gfn = gfn,
-		.flags = FOLL_WRITE,
+		.flags = writable ? FOLL_WRITE : 0,
 		.refcounted_page = &map->pinned_page,
 		.pin = true,
 	};
-- 
2.46.0.rc1.232.g9752f9e123-goog

