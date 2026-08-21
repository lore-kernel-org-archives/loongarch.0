Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1E8495500
	for <loongarch@lists.linux.dev>; Fri, 21 Aug 2026 13:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320226; cv=none; b=mUZN0Fme6nSW8LU+oMXwd0+mObNBuKtWwT5wYPcvJ8BhrjGOIeV6h3J+HGQ1teD9EDzEK6Ob4ox1ef7rS3jTWXkd6vP0UubFuj73/cSizl7pq05gdRjd4IlJV9zCJjB0N+2J6BL6uxFj8EQ09SqRdj4KkOuWHfU4m7LBF5MJVgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320226; c=relaxed/simple;
	bh=AjWp1TjMRLUGqxdS72hdqYmC5bBQJLPPnhM97ee5Dh8=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=tiuvJloyJ/ti8UJ8AIOCUEOeoy68/ayZJ7daclI7nazeFCkqmF7E+DqnsFfxKppGGjnz8Fni5G+eMSj8huofJbsqYu5cw41wBNHcUpovtvUK1a8hXi4NWc7lyC/9wo4m90gcZDG3KqV83oTQh2GFVh31gV0gB2khi1m8L1y0YjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N4cT5YSi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N4cT5YSi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787320224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BpYJaQfkL/fXy91zs4mgPaYnWE9uvAuTxt0XGGUcMwU=;
	b=N4cT5YSi54d0WaPOkOQ9bigNNc3SdHIDhXvYF+jRio2Q6CMvou/sYLIiOH2dcFD5OZ2CuZ
	PioMTaoAUlawczLN1kQxZ8zIIERaG1kMg44JR1W3YsERoSLKAKw9ybK4EQj8kBt8oIkSON
	jVPC5PVwziTUB3kGnPYgcCqKb4UH2xU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-7EwUUIvOOJaS3YWkMYLgNQ-1; Fri, 21 Aug 2026 09:50:23 -0400
X-MC-Unique: 7EwUUIvOOJaS3YWkMYLgNQ-1
X-Mimecast-MFC-AGG-ID: 7EwUUIvOOJaS3YWkMYLgNQ_1787320222
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso1168688a91.2
        for <loongarch@lists.linux.dev>; Fri, 21 Aug 2026 06:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320222; x=1787925022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BpYJaQfkL/fXy91zs4mgPaYnWE9uvAuTxt0XGGUcMwU=;
        b=jW+rZErl7mKzLzm9VBz2/nlblR0fr94Fdz+XNyQ948cWy2fTo63+hADXwsxiDSDJFy
         4+n6ftEY3T1cM7ccdNMRMbiD1W+PFZ3dYOEmYaAm/Y2HqI6NU6yg7XJnDDT1jji+iifs
         MFVCudvW3PA1EboiVK6f2M43ru8DX3qo8jAdjoNt4vUc1M+v1932Kf8WZmh4fenHL4on
         j519mafzVgMBJl7POox4vR8f6MS1XZdVVUkFrIEZFTD9kipbZ0iZLiEkyFLAyU7N9kdn
         QcNO6ThWUTtZz3X9u/viXgDMwdpXIf8tclVh/NPEwXr3Xm7NcIBrx4QOQmRYptkWrxCW
         p2CQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHiVBhTdcRo7o/W2p9QXCl/0oF2KPznNTOcWjbUPYWK6G4Xsn9qq7dkDWeo9Y8CJo6DDB752qbUK0=@lists.linux.dev
X-Gm-Message-State: AFuF++kNSHdQSEMGNvQRiP4X4s5TrodwQlpDQyyp6RChn3VXgs9r8b0B
	wyaeNKgjtlzzlf0IAmt3jqg+y203wDE7aVd/h4nHC5uLhqDZWDLpblLHdBiJ0xKto0s22GMpUB6
	k/gj9IzWzzZ+IlqugoaKMFadt+PbwNxP4C6j94Q0Mw3IhFloh0bZTGsvht2pr3w==
X-Gm-Gg: AR+sD10v3X2EIr8k3+2j7L/YU5Ij4m+daNDegjPGve1QGJPLd9guC64Wepo2ZIR4+vf
	+qJ2S9qfwgqivNz4PRx8/XCAbO6DYNmWt69gqnXg8iIpNc6bJYmnNLLU+5iqwf+W/HUKyUoutjf
	Zg2gS+vcvr0GPf5C+GLoFA/T0hbx18ZR1BSR66saZPjnQe3iuSqG97xxycUIzrLkiqPJID/5P7F
	/gyU1HaFbQqv1yne9jxonwVM3xF+xLTA3MLJQNVoARzJ62VfK0AqgVrdn6d1pmmDADmV3KbTvei
	UpDGBS7P7SavHroEoSE5eYZxTesD+ZJfo9g5MpwovIDQvyYkwEqtrqt434gNVaeZcKa7a4LhxAz
	XN081E20Wdj+tTCiiboBupNwwKGyGHahK
X-Received: by 2002:a17:90b:384d:b0:393:19a3:4e5 with SMTP id 98e67ed59e1d1-395c386a056mr10527515a91.16.1787320221499;
        Fri, 21 Aug 2026 06:50:21 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:393:19a3:4e5 with SMTP id 98e67ed59e1d1-395c386a056mr10527444a91.16.1787320220942;
        Fri, 21 Aug 2026 06:50:20 -0700 (PDT)
Received: from mpilaniy-mac.redhat.corp ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c194d2sm3300502a91.15.2026.08.21.06.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:50:20 -0700 (PDT)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Date: Fri, 21 Aug 2026 19:19:57 +0530
Subject: [PATCH v3 1/2] kexec: return -ENOEXEC from image probe functions
 on mismatch
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260821-mpilaniy-v3-1-76b355399d2e@redhat.com>
References: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
In-Reply-To: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
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
 kexec@lists.infradead.org, Mukesh Pilaniya <mpilaniy@redhat.com>, 
 Bradley Morgan <include@grrlz.net>
X-Mailer: b4 0.15.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CC5UquJaDp4liPpvcHg288Fm0N65PtqkcWrZV7EjEWo_1787320222
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
Reviewed-by: Bradley Morgan <include@grrlz.net>
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

