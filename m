Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26C0488766
	for <loongarch@lists.linux.dev>; Wed, 19 Aug 2026 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787161669; cv=none; b=jPRAURPe+Obw06zUN2aYmVJub3rGPTw9uZT3zYK4BuQAF5D2D7KTQzO26Zf+LTU3WyE519t4ICgLcsOc4ds3rdNitYXlH2Fx7O2m+lP+DeR6FPxLCgTTtaKEkx76ir/1k6iItF7NlffGaS7Ud+f89sSsmzFttYYxfusyBXXQihI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787161669; c=relaxed/simple;
	bh=SS5H+iMDfeifALY3gIvFKddQqGF1AXHVAFj3yZy3WJo=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=d1VpFbt1WGXSMP2P7BQa/d7laIP+V2Lr841bcM67DI9+BFuo2dBZsoYvTlV2RyB8Dqcl8TVaHGshhwPRs3RBgDHOAuH0oA9gbxOCG7PxDyGeGSn59vlCkUpaxlVyBU5/DMjMh/x68NwfmQ3ObVVGPkxx665rmABvoyzaKXEEGOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dffeOz5t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dffeOz5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787161666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vmoIUhHXRYirfmXtPkyGTipOfc1IGodR0GKUD6MrhOE=;
	b=dffeOz5tPSO3hAaK50Lhk8HtHFIaX/dJgz6llXtexSz97Ntz35lnjve2P+EJ+xT1odmi7S
	ajxhl8c4QJfyvVRrULFU/KsWb9ifnLm2xqUoHcT4XKCeO8j3OzwBS/aAd3NftkUZebaECR
	OR1yZ1pf2Fk+JHpFXGvPGPDafmVGSAk=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-MQRq5_YDOBeZuE2P8tIzGw-1; Wed, 19 Aug 2026 13:47:45 -0400
X-MC-Unique: MQRq5_YDOBeZuE2P8tIzGw-1
X-Mimecast-MFC-AGG-ID: MQRq5_YDOBeZuE2P8tIzGw_1787161664
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso1735139a91.0
        for <loongarch@lists.linux.dev>; Wed, 19 Aug 2026 10:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787161664; x=1787766464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmoIUhHXRYirfmXtPkyGTipOfc1IGodR0GKUD6MrhOE=;
        b=mqK0+HOXLzuc0OvN3fTB7NhTB8SJbmfl08fOQ+Yc2luw6tSQW4IjAg9p++F7R0/4Pa
         nsP9sYcp3nhDnhNVzgPv8MB2ppDC385L3/Y8JVbevwckzSjp6ZYObCfqR4ebNYRfTgGx
         vV8/62exJdopJ/hYF5vDk2FQAti/GrOzjfdsUKcyIFrdHL/oeuqs/MK47jL/JukMV6Jl
         M6PWAK4zbirUH2/JAYWm/rLIgZcAFSglyBH3IZvHT0FdD9Ow7Vyig4H7K12T7I01NDD9
         h9IERQsvPYyP6kTLuaeZoYoaNrUWYUjUuVtzpm/6UO6HalmCHQh2XTgozaoY19CJFhbb
         ioxw==
X-Forwarded-Encrypted: i=1; AHgh+RpibKa+mh/uU3NfWgM0uUkGohlIIJQtJ6N6GspTKUt8nTAUvtntQQOkk2kNb8Mf+qsWhNHGy1MleJQ=@lists.linux.dev
X-Gm-Message-State: AFuF++l8x0Rf+17SkOe1K35qEmURguz2fYFxdCFdqgl4oGjXia7SDjmf
	dy9eVogpg0Qg/tjB8/XmsnP7C+ZIT7+XveusDJ58HQAyhjwcq/SdmwjwABZfM/0S6OJLwTR4hSv
	OA09H/8I9tN1pIOAApqcJgl+9eH12eDh27x2iCljT5FzXLmaYo2w9j5CG3acILA==
X-Gm-Gg: AR+sD11BBE4zHkrodVYOPvdrhSjbtiOQ8ZzqbqxBo/mbWX5qHNzuW9bHdmyjEBPNEjb
	xGQrCycbJUcEyUtEwYUW6cWHuRi1KaFhTX5L0JKowf9J8Oyror+EI6YhVCgMQtSL/5E/Yyt0mYf
	zyLEQGtlXvk+QFFbqBbWCDh+MPuJkqqT6P1vrLEup9/mNPike6bOnrDJBOTh4jYprwH5o8fCzP/
	eLf4ARDx6KAOu5BTAqBpjD7vLaS61mxxdptcLuNNckm3KeP66jWwUlLmIeG++3PKKlzkd5J8xg8
	r/51SstIjf6ojzxGudzPan/gliRujFReWk/P+SwCNmdCkTvWdhd/jL0fkp7Lfy6U+KMf/DBta/2
	1/qg2oFRvJtjMf+0UfO9A9pvbSZPZWIua
X-Received: by 2002:a17:90a:d604:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-3958127a5aamr12212211a91.13.1787161664054;
        Wed, 19 Aug 2026 10:47:44 -0700 (PDT)
X-Received: by 2002:a17:90a:d604:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-3958127a5aamr12212103a91.13.1787161663548;
        Wed, 19 Aug 2026 10:47:43 -0700 (PDT)
Received: from mpilaniy-mac.redhat.corp ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f96ca41sm3319861a91.4.2026.08.19.10.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 10:47:43 -0700 (PDT)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Date: Wed, 19 Aug 2026 23:17:22 +0530
Subject: [PATCH v2 1/2] kexec: return -ENOEXEC from image probe functions
 on mismatch
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260819-mpilaniy-v2-1-95e929ede0e5@redhat.com>
References: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
In-Reply-To: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>, 
 Philipp Rudo <prudo@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
 kexec@lists.infradead.org, Mukesh Pilaniya <mpilaniy@redhat.com>
X-Mailer: b4 0.15.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2QzXSzOj3tfTALN08bsk6GItM2VunNlc9tCWNuGm9Kg_1787161664
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Several kexec_file_load() image probe functions return -EINVAL when
they do not recognize the image format.  A probe function that rejects
an image should return -ENOEXEC to indicate that the image is not a
recognized executable format.  -EINVAL implies a problem with the
syscall parameters, not with image recognition.

kexec_image_probe_default() iterates through registered loaders and
returns the last probe's error code to the caller.  That error
propagates as the kexec_file_load() return value to userspace.
Returning -EINVAL from a probe when no loader matches is semantically
incorrect and misleads userspace about the nature of the failure.

Return -ENOEXEC from all probe functions and their helpers when the
image format is not recognized.

Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
Reviewed-by: Philipp Rudo <prudo@redhat.com>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
---
 arch/arm64/kernel/kexec_image.c   | 4 ++--
 arch/loongarch/kernel/kexec_efi.c | 4 ++--
 arch/riscv/kernel/kexec_image.c   | 4 ++--
 kernel/kexec_elf.c                | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index b70f4df15a1a..101259874d44 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -25,10 +25,10 @@ static int image_probe(const char *kernel_buf, unsigned long kernel_len)
 		(const struct arm64_image_header *)(kernel_buf);
 
 	if (!h || (kernel_len < sizeof(*h)))
-		return -EINVAL;
+		return -ENOEXEC;
 
 	if (memcmp(&h->magic, ARM64_IMAGE_MAGIC, sizeof(h->magic)))
-		return -EINVAL;
+		return -ENOEXEC;
 
 	return 0;
 }
diff --git a/arch/loongarch/kernel/kexec_efi.c b/arch/loongarch/kernel/kexec_efi.c
index 5ee78ebb1546..28a1d0420ba3 100644
--- a/arch/loongarch/kernel/kexec_efi.c
+++ b/arch/loongarch/kernel/kexec_efi.c
@@ -24,12 +24,12 @@ static int efi_kexec_probe(const char *kernel_buf, unsigned long kernel_len)
 
 	if (!h || (kernel_len < sizeof(*h))) {
 		kexec_dprintk("No LoongArch image header.\n");
-		return -EINVAL;
+		return -ENOEXEC;
 	}
 
 	if (!loongarch_header_check_dos_sig(h)) {
 		kexec_dprintk("No LoongArch PE image header.\n");
-		return -EINVAL;
+		return -ENOEXEC;
 	}
 
 	return 0;
diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_image.c
index 51dc89259f16..963a25f5b55b 100644
--- a/arch/riscv/kernel/kexec_image.c
+++ b/arch/riscv/kernel/kexec_image.c
@@ -20,7 +20,7 @@ static int image_probe(const char *kernel_buf, unsigned long kernel_len)
 	const struct riscv_image_header *h = (const struct riscv_image_header *)kernel_buf;
 
 	if (!h || kernel_len < sizeof(*h))
-		return -EINVAL;
+		return -ENOEXEC;
 
 	/* According to Documentation/arch/riscv/boot-image-header.rst,
 	 * use "magic2" field to check when version >= 0.2.
@@ -28,7 +28,7 @@ static int image_probe(const char *kernel_buf, unsigned long kernel_len)
 
 	if (h->version >= RISCV_HEADER_VERSION &&
 	    memcmp(&h->magic2, RISCV_IMAGE_MAGIC2, sizeof(h->magic2)))
-		return -EINVAL;
+		return -ENOEXEC;
 
 	return 0;
 }
diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
index 3a5c25b2adc9..89a444a00693 100644
--- a/kernel/kexec_elf.c
+++ b/kernel/kexec_elf.c
@@ -172,7 +172,7 @@ static int elf_read_ehdr(const char *buf, size_t len, struct elfhdr *ehdr)
 
 	default:
 		pr_debug("Unknown ELF class.\n");
-		return -EINVAL;
+		return -ENOEXEC;
 	}
 
 	return elf_is_ehdr_sane(ehdr, len) ? 0 : -ENOEXEC;
@@ -236,7 +236,7 @@ static int elf_read_phdr(const char *buf, size_t len,
 
 	default:
 		pr_debug("Unknown ELF class.\n");
-		return -EINVAL;
+		return -ENOEXEC;
 	}
 
 	return elf_is_phdr_sane(phdr, len) ? 0 : -ENOEXEC;

-- 
Git-155)

