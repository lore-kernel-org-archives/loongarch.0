Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EED210C2D
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584846; cv=none; b=H5LYa8qOF5C02t7ktJtOxuAwoV5kgQg6ziWuNjtJEd0HDq98uDMxy4PVvkxK1R89gLI71DoCUsBtUCLaowRoEy6PxEjlaNRI2F6J4ZST96zxrtv8MIUgchccjkj7NI6vetSwmEKEtQSzpJXT9eHA24XsSVp0NJWHaCo/OyOCuJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584846; c=relaxed/simple;
	bh=Q0WfZXD0AwljsCbiw/O0WdULhXfIX1X/By/5X/lP1LI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LLFFS5LeNZDPMADxQif4N7lu2TfnUBfI5lGba9w7xHwGYzNtTUDHH4kr3YgRcv5J0vtgwfejt+ZdcK+FscsN81kD37X2lmLVUCv+Pd5tycJVxftbS2fTv015h8+Qpx2SYYM+6pJdC7K8OpU68MuwTuVL18pRF+9eZ78sJKC+qLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JvmfSPaP; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JvmfSPaP"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e17bb508bb9so1921046276.2
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584842; x=1729189642; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OZ/c8QPJoSxQXGCWT5aWp1nMy1t7EEzE7+N8fqq+BFY=;
        b=JvmfSPaP8jNp20a3Fl2D8EJQb2eyVbDOAlLJZrVdMxVeEPZEn9Ny0blAGNQ4CqNhiX
         Tp5SRoG4qqdcjYZJMI8p3A+iauImA+wOzv6rtX1dHsM/jAbsHXoTpWiabnFcCfgJPqNh
         tRGo2kuQV4LhQoz/LXr18B3q60kDKR74UsyHpfy3n9Z3Nq/j2kUz5WYQ6a/fjPKpCftB
         TN3mP/DLX1+et8NZJJO1OteGcLZzHLNyfuWbHNvYD5nHoxQhQEjCjOIwcKz5VjJhQK7W
         9HJvNgkioqKeygSkByzknPjrSCjf3RPgEB49jbsFA/6gAlz5AVkpPzAbtNKUmu2O80Qy
         eJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584842; x=1729189642;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZ/c8QPJoSxQXGCWT5aWp1nMy1t7EEzE7+N8fqq+BFY=;
        b=Xtns5R52BiUKHEsc8NcIqkJR83Vf25EP25hBU6vdPPmtkm/NElMA8CctqW6p65GVCF
         nV/RWhrs79p23HUJj5FXvuvtXH8Q3nZSSng4Dax5hIA8yU5qYz32YM7sbZ2aUz624uY3
         Cm56rc7EyRYnyMNWZ6s09+5P812W0d2m59XdNpyQJ6q6Hpta2vQ6utAMCpOJdY03YmGc
         jket8Zu6cbDSrkzWMlKiNFTsWpsq0tSPa/BIJBAJpJsxXLCHyJw8oypkZJQNq3q5dJYq
         Ct8e4W7EGSBR6zD8XEm0KeMMpSJ03anzksEBu/UUoKVSHlTucUbtGFpkKGa4pbNOwlo4
         k/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUgc//J9G17iBaqn7d/8IHpan30Z8fWygP8qY5yjTI/RZZ52lL71GMD66Y8DOFelttDqU579osjK+o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLLbtMtR/NIEI3VObIQ2lpw18QFKCFU5CIiaQLp4GuE4VSQFIV
	0zUJdElUzjgmtA66FuTu0mfLbMi/BL0hWxzIAMdkrkqHl0TRfeJadSPHAtJ8Q3ZzWAB4IFqxUgw
	9Mw==
X-Google-Smtp-Source: AGHT+IHhD+Vk6TwFIS5v8fA24SNPRWU4vCcQM+1g+zVw6L+6pfrMpIdoNti+PehtHCeQDGmk8Jps/9lQ5Ek=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:d30a:0:b0:e28:fe07:9cc1 with SMTP id
 3f1490d57ef6-e28fe4a3a81mr68085276.3.1728584842321; Thu, 10 Oct 2024 11:27:22
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:13 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-72-seanjc@google.com>
Subject: [PATCH v13 71/85] KVM: MIPS: Mark "struct page" pfns accessed prior
 to dropping mmu_lock
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

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that MIPS can convert to kvm_release_faultin_page() without tripping
its lockdep assertion on mmu_lock being held.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index f1e4b618ec6d..69463ab24d97 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -634,10 +634,9 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 
 	if (writeable)
 		kvm_set_pfn_dirty(pfn);
-
-	spin_unlock(&kvm->mmu_lock);
 	kvm_release_pfn_clean(pfn);
-	kvm_set_pfn_accessed(pfn);
+
+	spin_unlock(&kvm->mmu_lock);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	return err;
-- 
2.47.0.rc1.288.g06298d1525-goog

