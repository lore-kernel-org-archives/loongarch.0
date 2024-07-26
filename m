Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5C214F133
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722037963; cv=none; b=dFMedZ2T8WX0NMznFTyxp8Qlkus8nj+Yyb+HBkTWW1QfgyNlCw6NgG/FSRtkTaDX/PeZBysyQNzPW3aZadM/6wNIUTQzB1lI4/MaAKKM2omPJXbpwDWy+RlQyZ+wlK1C6cJw+CkuyjmY5beuyfdH4xY+8J4li5YFr04VfbaVwX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722037963; c=relaxed/simple;
	bh=24lki3QCeS0kH+gNN4dUIYpp1e6lnIRlAVL0zCm0YAQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UFRQ+qFhMtAdJBAfBwzmv1/dEN2BZnU4ZGlYRpi8ik3ev4JsohSBiizUa92NHenxApYHXPLZSrfiZt1vbWYDo/QFeAC65ZE2CKcSRILDcVcPXfy5EHo6+KFrmcIHsYTxUVAQBHHNtk2QYeuXTnWez5MdJn+TI2WEofAc12tHbBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DQ2wIosC; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DQ2wIosC"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1fc5e61f0bbso13355045ad.1
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037960; x=1722642760; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=B44llYCZd4EZ9BiHApjJ5QQ8CK6GbkfpTxw4rYmbmqk=;
        b=DQ2wIosCtjWr3MSBrMh63dKyCKJSAHwvBVaUuLV03dEEoDYkCGjpSoELgW0bWQK/ap
         jsIVnlbu/TPQ/PQ+7mkrxQ47x1E1olnt0/gwshwAPijdME4c6b6ptZjzuZ3ahzneyY7A
         e4C94qYPvIfXpvNHFdDGN0/woYne4Xr6N/tusOJ6W9cweWcY2ZWahRDo9m1JNrSCAtj7
         d5Su3EzQ2ksv8m5x0xJSp/dF4UK/AjsSJe2jYi3MTEfTVmxfg4iLoUkPLJLQtkpSeSu/
         AY4EAlRwcEfMxVBHZupmAS7ugGIHbYqFFtVKIXyrJUcM3EhQZLwg5Effwg+XiCrq2S2f
         /jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037960; x=1722642760;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B44llYCZd4EZ9BiHApjJ5QQ8CK6GbkfpTxw4rYmbmqk=;
        b=X8BtMhHoUOZrj9xDdC7pgcxVxxN7e/ZCJqftyxRH4izQpduE3hY1MDWZ/ekv7oUcJQ
         l5GlAwfxEEsbL0o0c7K9h9jWF+lMgxiYYanw2tPDcgWZqwyhHVWSncKD5Kb3jpTrw8CZ
         F0vp0dFMuZ+JsEK94jQcRon1ngkCYX1N0hb5glJOd8f76KkU1n7oVTcdJ4424UxztSyn
         KfLFEpJnOceuyEx7BvAo1SbSPjPn9i0WA3Oh6JTr36dq0vEjtpK7Wpd9QrzrhdwFMipd
         4CmOXkRUsJBDPTJvDw58CfNngeEvYQ/hbjieHWFqAiemtwc3ZrJ+IjT3iZP2EEYhrxZf
         sP9w==
X-Forwarded-Encrypted: i=1; AJvYcCWuVKG4YoqsAGIUbzL4RGRY4OM0erlcnA4WNwiRXvHFTsMebk1mhro6H2tfitlRhCRsLD9gRNs2tocit4LpqcwPMpDu6Rwc/tiM
X-Gm-Message-State: AOJu0YxUBp48b1G/IoV33qYB42mCTsOcFgnXMyNjZOX7st7BsIcDO/1x
	zgUhZC+WQK6xEyGgFy+pBYNWiiIkFPW+Jv2BmRuBzqpRLCh97n8IZWn8HdB+sdhSUP+Xi74ys9q
	imA==
X-Google-Smtp-Source: AGHT+IEjG0ZQEVlDvyCmqtjyibvaIBPxkBHQDdDjj94pZYYC/xb/lJ2iSbTktb4rvu/gOGNYLlpIc1q2Vcw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2b0e:b0:1fd:7097:af5c with SMTP id
 d9443c01a7336-1ff048d8505mr410065ad.11.1722037959655; Fri, 26 Jul 2024
 16:52:39 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:10 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-2-seanjc@google.com>
Subject: [PATCH v12 01/84] KVM: arm64: Release pfn, i.e. put page, if copying
 MTE tags hits ZONE_DEVICE
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

Put the page reference acquired by gfn_to_pfn_prot() if
kvm_vm_ioctl_mte_copy_tags() runs into ZONE_DEVICE memory.  KVM's less-
than-stellar heuristics for dealing with pfn-mapped memory means that KVM
can get a page reference to ZONE_DEVICE memory.

Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/guest.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 11098eb7eb44..e1f0ff08836a 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -1059,6 +1059,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 		page = pfn_to_online_page(pfn);
 		if (!page) {
 			/* Reject ZONE_DEVICE memory */
+			kvm_release_pfn_clean(pfn);
 			ret = -EFAULT;
 			goto out;
 		}
-- 
2.46.0.rc1.232.g9752f9e123-goog

