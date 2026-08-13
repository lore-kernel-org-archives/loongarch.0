Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE64A179A3
	for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 07:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604831; cv=none; b=eu3iS2qPsvH5ibpSGYYkRSXHgVyCNQ8XwfAvC3vhNbXxqCRzlyYE+mF/GGshTN/zkg8zK/Og/X+d+p5shsKu0qaQBV+nNoDPAN1iQKS1UBTdYRlfFATa9up8HcS4jAAhBRZaih9dtTqBYz6qqhTChmjMEAyjKHM3xPy+E2rRHPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604831; c=relaxed/simple;
	bh=wOyFqwRT3urixhQakJtAvzNxo0cbYKSUpRn7y74plxY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type; b=QkNTP4qizWL9qRBmFeCCC7aQ0jfhhZH5KHz267FDkV9Ma1xJY/X5d2BV/5YCLz/JNQuN3ORjwb+IXYXtocaaA6HGabxyQSLBCKsfxlKHwE6XDLTRCUKtyOOIgxiMKxwHXPK2/+faKvI9RwGwcS8No3xJAWSn+vQ5twXWeKh02FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IwbXggek; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IwbXggek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786604828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JiBEcYiE+KLh8+0hM55F9Ni/cU6OIiWXkgr39dKJ+1Q=;
	b=IwbXggek0Lx80Ce4b6zZqvM/5s28sUnK9oRlYD5dBlKd+pmEXd7hMPjLG7SLGvwxrp4+D8
	MzVgugu+Nu5yDbLfkcnLgakaLLsHqj2D3HGj9sKh25smDCEven4sJLkrpckkuUnmDzyzQS
	MMK47GsgPCtAMPfLQOsPILalJA4a88s=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-ZTeh5KptP8CEFTIbVaOyUQ-1; Thu, 13 Aug 2026 03:07:07 -0400
X-MC-Unique: ZTeh5KptP8CEFTIbVaOyUQ-1
X-Mimecast-MFC-AGG-ID: ZTeh5KptP8CEFTIbVaOyUQ_1786604827
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cccfa32670so6757825ad.2
        for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 00:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604826; x=1787209626;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JiBEcYiE+KLh8+0hM55F9Ni/cU6OIiWXkgr39dKJ+1Q=;
        b=ISjdRocQFz2dlOujtbnLI/XLy1HZaD2+HPYRPOjmlsYUgM7jhujBchX0sQW9eYDxJV
         E7Ey1qDN+lPPXg8Ii+rAurJ/xkklH/x6cYmhF1/sYY8NpRtEY+5YFsu8O7bTYZP18NAy
         7uyATilxKlBKf63YjqRlZUyDUNQe83VOxw3BoXCqgAMxTTQ7oMNxuXwiL49nEma1zY5U
         pi0HbX100pm7BMfvqV6tMKoYUvWX3BS4awmimDaEFSa+KLOF3bO4S05ORVEe2VNusVbT
         d4p4gdbOJ6CBBadJpa1oYXE3hKikSbN0HI8Vkcz7oq4LNf007vnQnlf85tpf4dxMKsHI
         SgEw==
X-Forwarded-Encrypted: i=1; AHgh+RrXfERMBATSlR2XscJy+mhVy/2VUOXk+apwCjSXE07X4cI8nSSNNVKLT6396P0oj36XPaVFLIOc46c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6tyapqHNgssvBMTooOuN23U3HG7rLEA37LAbj2oXmMNIdrArb
	POd+uvLrgcuadbEBRAcOr+jdNxn9fumXEIKkdyemklbHQLWDUJvOLbLhGzdxA5KqpmRgP2EL93K
	2WktohZadnfDNfYQsHTvwEwnLul44ivSb9XXUWy+VMpsbUMFL7GDqBObiBKsyDw==
X-Gm-Gg: AR+sD11yoMaqOBMC6YnkqNjTkDOHsQxF03qZmaYKISs0OicZk6AuzX9WK+VI7sgmUkG
	Amae/Li29GDYllsmjhWmgZ62OknkxazEfDCdM+paz1P6PPYh5VKWId2AOTtturtHj6AOH94uA43
	pY3ysfOS6fxBW3PS0tWjVPqYc7lfC3SsqCnqbPYfvl71aupWwH10niW5tO0/OVmnZxcqQvKyTQK
	7umAEwufP7x8n/NloSXOBsHWVmqYE6Zr4nLfghs8tz/n7EnrPJmU7zQIY0donXBCEejJ6u2m3Qw
	InTaU2i1g9GaSB7zZWEVdaqxmdp4+fHFevpmLUNfNa7MwXQOec4vsh5kBYjrMuwxCT0d58EX+uq
	CbQHoDIO3Y4P2LDkp
X-Received: by 2002:a17:903:234a:b0:2ca:d975:5bbd with SMTP id d9443c01a7336-2d37e8a4f49mr38123755ad.20.1786604826420;
        Thu, 13 Aug 2026 00:07:06 -0700 (PDT)
X-Received: by 2002:a17:903:234a:b0:2ca:d975:5bbd with SMTP id d9443c01a7336-2d37e8a4f49mr38123275ad.20.1786604825987;
        Thu, 13 Aug 2026 00:07:05 -0700 (PDT)
Received: from [127.0.0.1] ([115.110.157.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c48e438sm4877315ad.60.2026.08.13.00.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:07:05 -0700 (PDT)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Date: Thu, 13 Aug 2026 12:36:29 +0530
Subject: [PATCH] kexec: return -ENOEXEC from image probe functions on
 mismatch
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Nj3dyCzJzEvMxK3bS0JIPkZEujZGNDYyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQC+l4AzbAAAAA==
X-Change-ID: 20260813-mpilaniy-ffb0cc92c313
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
X-Mimecast-MFC-PROC-ID: qI1Mz-M7X-TmlO4PIjqMcPtEyqP717yBj9jM4VB8-F0_1786604827
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
---
branch: next-20260812
base commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
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

---
base-commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
change-id: 20260813-mpilaniy-ffb0cc92c313

Best regards,
--  
Mukesh Pilaniya <mpilaniy@redhat.com>

