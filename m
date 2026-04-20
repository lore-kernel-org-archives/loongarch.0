Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2EB3D1713
	for <loongarch@lists.linux.dev>; Mon, 20 Apr 2026 21:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776720036; cv=none; b=C90kdfKm7KGkq0s7LIisd2wMU8hOKZgtFtnmv8rLb0AKz7+3B1yjkhVacaQ9gNPD9DfbJd5tJCDqSnPh3uFXt+yvyie9h91yjLap17b3NMKWj8pN/61++Eahec/1mi/t7P7q3Tw3QgMA7aXZ884PKO4l+vJZT64k9ZIR5HJR4LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776720036; c=relaxed/simple;
	bh=9g5xp+VSVzzv6BVD0W5JIfINJEacz+YIvlhMB3lgGVc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mCoU489/LaKxKV6GN3zLtswhnqythlw9U85+ZZwVQ++Ydq3iZiQfrMcjRJAYcoJtRTu58VHKHGnXkFX6IF2VyxmlzCcuyD8V0maus/Z8lFPPNkhU5SwHxTo65+1H9TdAT/S8OR3XNr9+B+jBBTqplHyITrS7WWVRtH8nDbkq/s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uvX/s7FF; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uvX/s7FF"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b24af7ca99so46505805ad.1
        for <loongarch@lists.linux.dev>; Mon, 20 Apr 2026 14:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776720033; x=1777324833; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nGTpsdZingcIJU13AR/rz9Q7jpP4FQBt7uSTt0uhGT8=;
        b=uvX/s7FFe9sx8ovjJn9Jqlj3p0b0g/Yf5Y1aPFBYrKWsom6X2Ket4jmFC+0dLLXUCt
         Ez3TKyFsn19i8Fj6IFgZXI3ljXoi3QOcCVGR6HuG3Ua8RNxqN9Fl4YJ9Q4P2wvjPkatZ
         ZSCGGZX2AdPKa3HWsfYFhdMRq1XdFz0guGqmEuRg/2eEfXndq2nO9YrNHYjwCQ+4V1Ko
         CrbIhTNmhp1bd6NAmr/KkwZBDEChjKlcZw/+7x7Bi2TVAiIRQLXzkK3VOFTNfgPM1RZk
         Tk2PE0DlFEpUe+ro9LIGvYrpL/VddEzAoE30Guk4jgS+f/e7uofCtgFswL33dl61/qbW
         kS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720033; x=1777324833;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGTpsdZingcIJU13AR/rz9Q7jpP4FQBt7uSTt0uhGT8=;
        b=aNBDn7phF9heoTjUJem1dOuXcBMXyMMRFoyORTekB03i1SLqLGGPbZGfx17Hu3w+WU
         rfxXsACYqos3JXFqNqD+5roIFHaV5wNF0UawjoWt7dyln8n/LkxWxghv7jPE6S9d/gmh
         G6TJeM51qUbiNGw6MrtNNOKOnXjq1aD/Z78Ih8svCKGd2eTdAc5C50hWbrbSAlOXmr1O
         /GTSWRcO9hawsR2qeDd2JwpB37Rped+QJ8S2Zioru5/sobjxMEawxLx+P+Wd6uuNVEHD
         fy6vYSMPfYX3i8nWe2kpOE+wWoU+B+5it1+K6U0VVMCsFyK/mTg7h9iRtA+HF8tHAf2r
         6jXw==
X-Forwarded-Encrypted: i=1; AFNElJ/rkqUTuHXD2+Ypia11NWLY+lhyJQpdmgiYYnQZd5YiFNx7zHruCqfdcBf9gJp2PEJGeBVfol/eLuM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVkxuZRHtn5TPKOkayvEj9oE9ZWKjV9EfIEopYzo+//bEaZVf/
	j4VazLvF7zeTs5zg9zljO4hjYwZx7y3jiYbcuZWdXG0f8Ee3TUIO9z+dOR3nDTJRFsdbPTemsSw
	+rP5IEA==
X-Received: from pldt14.prod.google.com ([2002:a17:903:40ce:b0:2b4:5ded:6ecb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d58a:b0:2b0:ac1e:9737
 with SMTP id d9443c01a7336-2b5f9ec5ea7mr159040275ad.12.1776720033096; Mon, 20
 Apr 2026 14:20:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 20 Apr 2026 14:19:59 -0700
In-Reply-To: <20260420212004.3938325-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260420212004.3938325-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260420212004.3938325-15-seanjc@google.com>
Subject: [PATCH v3 14/19] KVM: selftests: Rename translate_to_host_paddr() => translate_hva_to_hpa()
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
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename arm64's translate_to_host_paddr() to translate_hva_to_hpa() and
update variable names to match, as using "vaddr" and "paddr" terminology
is super confusing due to selftests using those exact names for *guest*
addresses.

Opportunisitically drop superfluous local page_addr and paddr variables.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arm64/sea_to_user.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/sea_to_user.c b/tools/testing/selftests/kvm/arm64/sea_to_user.c
index 7285eade4acf..fb06b9dcb3d9 100644
--- a/tools/testing/selftests/kvm/arm64/sea_to_user.c
+++ b/tools/testing/selftests/kvm/arm64/sea_to_user.c
@@ -56,13 +56,11 @@ static void *einj_hva;
 static u64 einj_hpa;
 static bool far_invalid;
 
-static u64 translate_to_host_paddr(unsigned long vaddr)
+static u64 translate_hva_to_hpa(unsigned long hva)
 {
 	u64 pinfo;
-	s64 offset = vaddr / getpagesize() * sizeof(pinfo);
+	s64 offset = hva / getpagesize() * sizeof(pinfo);
 	int fd;
-	u64 page_addr;
-	u64 paddr;
 
 	fd = open("/proc/self/pagemap", O_RDONLY);
 	if (fd < 0)
@@ -77,9 +75,8 @@ static u64 translate_to_host_paddr(unsigned long vaddr)
 	if ((pinfo & PAGE_PRESENT) == 0)
 		ksft_exit_fail_perror("Page not present");
 
-	page_addr = (pinfo & PAGE_PHYSICAL) << MIN_PAGE_SHIFT;
-	paddr = page_addr + (vaddr & (getpagesize() - 1));
-	return paddr;
+	return ((pinfo & PAGE_PHYSICAL) << MIN_PAGE_SHIFT) +
+	       (hva & (getpagesize() - 1));
 }
 
 static void write_einj_entry(const char *einj_path, u64 val)
@@ -303,7 +300,7 @@ static void vm_inject_memory_uer(struct kvm_vm *vm)
 	ksft_print_msg("Before EINJect: data=%#lx\n",
 		guest_data);
 
-	einj_hpa = translate_to_host_paddr((unsigned long)einj_hva);
+	einj_hpa = translate_hva_to_hpa((unsigned long)einj_hva);
 
 	ksft_print_msg("EINJ_GVA=%#lx, einj_gpa=%#lx, einj_hva=%p, einj_hpa=%#lx\n",
 		       EINJ_GVA, einj_gpa, einj_hva, einj_hpa);
-- 
2.54.0.rc1.555.g9c883467ad-goog

