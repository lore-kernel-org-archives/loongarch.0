Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C5E2264AA
	for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 23:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767135716; cv=none; b=CafcVd/qdmveclXkiaoml1EcHJsY7vELMYK3LG2wBtUtaf8Sghy2Cdg2JqcdENFjiz5vMhTugHZNpexrfzn8xcCLMo904aAspmmruJONYDV1LJE0eCSVasnxi0XxnVNu+R4sM+eDiAe07EcnOoD42iGrE0/KpsVHMQKtL2JxGUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767135716; c=relaxed/simple;
	bh=Kg4SWKOUtIjisFIyNIjWRo8qDsjuJqrQPq7nPM7bE2k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Clq7+K3yrjR3cdYNJvWa9G7bPQ8wGoQIS3Uvv5FnjPowI0MojRaVvsky+++ZP0jMXp90yVFSkaGEjAP9HvPQRNDiEOhvkyYA3dWCZc290vT1ADXBc1bk0kSqwvFAG+ZgGbwmltL17qH6dzFHd+ZjgFgC6c5szQTDTGusAf4L1JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nPo6jguC; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nPo6jguC"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ed2so10826334a91.0
        for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 15:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135714; x=1767740514; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=DRWkfiIT0OBRt/HR5AGE/0OZHtoELcBJ5J9uDz4mIeY=;
        b=nPo6jguC6ScZRRIzwty0upfLyTQcqCJOhkRMbBUovTgx4FBE7R1GJoUqjZ8dKCKjc/
         YDBiIt3UvOLB9cMU5V2T/n1W3n3UlcrUB9pci+x2jbdIJJPvvLAMr3orSj5fzRSpWZDN
         WHt44pkFlqH/IpTYSKIxgfXJ/Rb7DjwrYcdWlZGUjZEOgZ8ZkhOao2TKfga25MalFGWf
         MMJG6OZqQpQh0dfCU2ZISdfT5ufHeOH1IkEzBdoOpHWod3wvU3LrvaS/cS/p1nN4/NEA
         eJVlkecQm+45PEtKBmTRxcF928LmQvVUnSXNRKrXfrzWFzz27/U9fz9otjygsjAFVDL7
         6DwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135714; x=1767740514;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRWkfiIT0OBRt/HR5AGE/0OZHtoELcBJ5J9uDz4mIeY=;
        b=jmsijryEdP/TRblpXJdUa+j0pg66ATI4qdHfpmN2zMyyNeQ3T40mxvWVzwRXnOzuNE
         hGYNFff80ic3m/PrvLQxe3Z9Pv0v7ufgYZlL8O2MV05omDmsy3XiudPRIWz+ERJB7xs0
         LAwxtu/dKfYXeI23jItpsXxUzssMgP1LIP6XSVzoEuIq+51o8wh2juY631QoDK7vv78e
         ss09lR0cAmm0MvrkyMnN1WgTXU7wmrNSX8VI3Mntm5AUYvtaqxTO5ReXnCTRq0X3Nd2M
         e3WoqufOpFz5YQKRRRNGTG9GtLQ6+X33GEoWQPFKC/aHxbJLRerTdHeISHeDeXa2mFyO
         93XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFw21S6qqPl052cFonpryZsPa32X4HyzsTVGx6eHr27Z9QOAJ9xYN9wgDdtw2JeST3P8rN2YbL8KE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBmRhKcwBz+QNJNGKAKtZrm62DO8QsTwpyJUxViFkUCaEuGBY0
	YfyT8XW5mFwDzylNSMeIbL7H3c8a5mwRpC/opZP9YYNnYn2/CW6nI2atH++vhHksEsDhvMam8GV
	gwp8qCA==
X-Google-Smtp-Source: AGHT+IFqovkU/eUlOykY6HWolLjXCahq1FJtAZ+GEK7lClBpAjuVhdcXVPtQL/MTMKhhYaxAhrGpJ6Ohw/A=
X-Received: from pjmm16.prod.google.com ([2002:a17:90b:5810:b0:34b:fe89:512c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f47:b0:34c:3501:d118
 with SMTP id 98e67ed59e1d1-34e9211d455mr26888073a91.1.1767135714342; Tue, 30
 Dec 2025 15:01:54 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 30 Dec 2025 15:01:30 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-2-seanjc@google.com>
Subject: [PATCH v4 01/21] KVM: selftests: Make __vm_get_page_table_entry() static
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"

From: Yosry Ahmed <yosry.ahmed@linux.dev>

The function is only used in processor.c, drop the declaration in
processor.h and make it static.

No functional change intended.

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/x86/processor.h | 2 --
 tools/testing/selftests/kvm/lib/x86/processor.c     | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 57d62a425109..c00c0fbe62cd 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1367,8 +1367,6 @@ static inline bool kvm_is_ignore_msrs(void)
 	return get_kvm_param_bool("ignore_msrs");
 }
 
-uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
-				    int *level);
 uint64_t *vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr);
 
 uint64_t kvm_hypercall(uint64_t nr, uint64_t a0, uint64_t a1, uint64_t a2,
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 36104d27f3d9..c14bf2b5f28f 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -306,8 +306,8 @@ static bool vm_is_target_pte(uint64_t *pte, int *level, int current_level)
 	return *level == current_level;
 }
 
-uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
-				    int *level)
+static uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
+					   int *level)
 {
 	int va_width = 12 + (vm->pgtable_levels) * 9;
 	uint64_t *pte = &vm->pgd;
-- 
2.52.0.351.gbe84eed79e-goog

