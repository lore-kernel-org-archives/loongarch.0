Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDAE219CBB
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584864; cv=none; b=VDKGnsq4nCITlGjyhsbu/6fzgMhEgfLuT6FkIPHeCXjjBPcCusnbfk2er5XOn6o3S5zMt2j9HGrtugmxyl3b624j1djUuufUskV9OmRkfqR+RiLwoiLScOhQXBPpKOVpGiY54LVBLbKD6492Pp+81GjK6D96SIzQQce0MhXNSsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584864; c=relaxed/simple;
	bh=Xp30Q5aCXuVbCuroW5D/p68jGCOUTPuU5mMuuixoyAE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=puIlmGdGz8TejKviMl8c/ZAlzHZhOZ/dFXaf8XeQZOaHf/KbY8v10wXbWTW/1iMsyRk1PXWcnwzV6VlRg/x/slbt8p4NhsEDjFqIhPg4Iuxw2OqtRPH3bdR9YAyNrHhdJIazuDZFQFWVBRRgD+XAz6Fusfwb+enzvH30tA7+Fbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yg3aXNSY; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yg3aXNSY"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-71e1ed58e9bso1479500b3a.0
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584862; x=1729189662; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=A6YyPrl/aVt4zvDZFXUjzF/Zy9evtaTkH7tjbHPMI5E=;
        b=yg3aXNSY1VijGqKulXsSq+iv/fseDxq8+GJlC0wrr2OIVJy/6Ge96HoMiAKzHAhSGq
         knXOsugsjbSV0sy32jX5+K1ToY/n2WiFvncZoKk+Wr3VkntghXcL+7wWzHeVE3WLK3Yq
         w57djH5kNQ5yGaFn1OLeXumDO5/QqPpAcCcNaD8tH/r0/zltxEzLgEuBLGNbusciIfUH
         HIXuvPz/ij/vSEvtgqtSLi9b0ElzqbCrxYTx1fMEtpohiz3qd6YCGV3jQAWp+B4YFyWk
         uTHoy7BWC6eCOv++qeOEuNWF+wgqKXemGO9VPdnNKcIUmfbilGZMQy20DYci9dVuUB2k
         LMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584862; x=1729189662;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6YyPrl/aVt4zvDZFXUjzF/Zy9evtaTkH7tjbHPMI5E=;
        b=Zkb9bG3AimxaDQ/b/w++phmr3EmZWlQjNbEHpxDSEhez3Inzg7Li88nx+HASXEOYR3
         bLEK2+VYoHGVDl3raqRearyi8Vea1gqbLd3O+B+oHbDmmB31+DHwDF5oHxHXPX558xVn
         2GValZnjl+yBnELb3LDUFIeD3/9NB34nMh/DoGmDP3s9pKgnJZM8HtLIy0nL4nrmui0U
         /hY0Ov+V8Hi5XSNqFYlMFZ7C8s0jl8P+xBA2PpZAXdcoJMW/58vYOGgxWgu49BE3wSTA
         Q0FJfG54pYII23J/4I6vSrW3IyCXuXDZu56488N3/PfdBxWtLHhlQJ/sGPFmo8o6zzAr
         5sJw==
X-Forwarded-Encrypted: i=1; AJvYcCUmm/eyUndxS0XHEM17yuvAPAvlSgaMzE7DFfdZ+68DGo7bb5VHRDzcc+HJGzeVwqswKHKzovL3tf0=@lists.linux.dev
X-Gm-Message-State: AOJu0YykmzIK8qz8jtqLyVE+ZPrvHfdMlZMcdX3ucAqnK9I05XOVvlie
	eFKlm1qafeCKrRLfSBx65CAGor4ivSOCbSI0WdEMC9BOsAE0mg4BkeR6C2Z7D24u7ZZBl/N+ZPQ
	hYQ==
X-Google-Smtp-Source: AGHT+IFRVsKTyvnlBUrQtNNg8zvYT0OU1qw5Av8a7Gq/P6vdrCxit4uLl8sEcLrSKXXTWA/vla3myJTtPpY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:9443:b0:71d:ff10:7c4 with SMTP id
 d2e1a72fcca58-71e1dbd1d0fmr15196b3a.4.1728584861919; Thu, 10 Oct 2024
 11:27:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:22 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-81-seanjc@google.com>
Subject: [PATCH v13 80/85] KVM: s390: Use kvm_release_page_dirty() to unpin
 "struct page" memory
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

Use kvm_release_page_dirty() when unpinning guest pages, as the pfn was
retrieved via pin_guest_page(), i.e. is guaranteed to be backed by struct
page memory.  This will allow dropping kvm_release_pfn_dirty() and
friends.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/vsie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kvm/vsie.c b/arch/s390/kvm/vsie.c
index 763a070f5955..e1fdf83879cf 100644
--- a/arch/s390/kvm/vsie.c
+++ b/arch/s390/kvm/vsie.c
@@ -670,7 +670,7 @@ static int pin_guest_page(struct kvm *kvm, gpa_t gpa, hpa_t *hpa)
 /* Unpins a page previously pinned via pin_guest_page, marking it as dirty. */
 static void unpin_guest_page(struct kvm *kvm, gpa_t gpa, hpa_t hpa)
 {
-	kvm_release_pfn_dirty(hpa >> PAGE_SHIFT);
+	kvm_release_page_dirty(pfn_to_page(hpa >> PAGE_SHIFT));
 	/* mark the page always as dirty for migration */
 	mark_page_dirty(kvm, gpa_to_gfn(gpa));
 }
-- 
2.47.0.rc1.288.g06298d1525-goog

