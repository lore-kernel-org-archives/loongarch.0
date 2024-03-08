Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248AB4F5E6
	for <loongarch@lists.linux.dev>; Fri,  8 Mar 2024 07:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709883973; cv=none; b=X3Wts9hbjpvCzRIY+Vk0J/9/FAt7XogwwPz35E+9tMSoJQ47HNgVa1W5XbVYGAA/fILMMNXKMDFm74IkyZxZEP6m22oxZXcvGmwnwSpi7zNAyxYUCo3w9CMSuEAPi/3ZgajIMcS0Amz/SdlpuJUu/NdUMXElP+O0a2yg6WJUyP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709883973; c=relaxed/simple;
	bh=qYxU7vhVFFHlVFqvJ2Oik7p3vX515hPOju269hebVfc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d/0zWC95Wv1uxir/A2c+MF0JabsRHQzPdU+OnbpO3asukPM19Fwko1DtXGSotaqwFmA5lExIkpChe8FXo31kQ5OagSLaumdP8T0yjyXwPbmBEAAR2eZVM/TjR8ARQeP2oJEAuaT5rQENZwiCvpVx8K1wEvu1qXHpoMSRdwdnCL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=UfUrAA+P; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="UfUrAA+P"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so256080766b.2
        for <loongarch@lists.linux.dev>; Thu, 07 Mar 2024 23:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1709883969; x=1710488769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=40cCzbisoVSkufWvb0+W2WVn4MdIoueSCxQxubT81k8=;
        b=UfUrAA+PUYGIaVf2HPIuJSNu2igYcKjTMSAqA6YuWjSFfDMYj4jXrFvbLYTLt1OyXj
         s44Bkkg5ZWwXNXNRTUQaavft8MkTkh9VBQguqbld7P3/ehxThaEIZt+Q4vVU/EY/W/Jf
         YrUs5UCZA9rwWNwO/RrkC/uMeh2IJP0Uk0uobI8x1cXfF00FH/L0mcQObKZZtrhD7AfX
         TQfAaHpBa9WoMFeeeVvz057xIQ+05n3MYu38tijOmzdi77rrOJytDMaJP85XdePKuP13
         YbgY2S0RiUxslxjIl446l4qgTI00sf1j/PkRrySO3u8pnZxGhSpdPAcEA1g4EZXY5bwU
         mHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709883969; x=1710488769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40cCzbisoVSkufWvb0+W2WVn4MdIoueSCxQxubT81k8=;
        b=B4IaTpLOBSrY9ACDfm3G9xqVEQPU/cfzTpoCpps3l4eoezVvio88jz5P4UEGk3a93v
         I2wCbbDJwj/Y7ux7oLTfFuQSQpWarOu45NeFSdf67sD37NGj/MlIQUZHqCXOqlx/Mokf
         ndMNunTzm8sh+sV8eF53dQqSRwy30LJN50OX3LoYpgzdjnxgtmGl668k8hAX3pDHbOwp
         riWww4eOt+bPGthC8qC7KfIc8AgslHT+BbvZjauPLhILYHMgNoLCHuF9HFokEHk8ueg0
         uThh9RxvI7YWC8vF4ozOjSPRPHJ8++V45td8Ae+BDHrr63c8DF78J9UQl8aGIlrICjX2
         kwuw==
X-Forwarded-Encrypted: i=1; AJvYcCUKH5v+EbhBhWcSCKT5cotcZCJivhOsw8YgPdpH9It8uYVnaxttbYZzF2Zs7LrVKQ9EtMvRKWaOX41V7M28YlLtMmfSsINbLQMq
X-Gm-Message-State: AOJu0YwwdkTplaKVSaB91MpbzyCGMUuf5SOH+kb6jWUTN9rH3xkZ9+KB
	Ufk68SKZbxo8vCVc8Sq0XjLaMMzYh2x5pFiYXdVqLTuyDobq0A04AJfsNfTjt0E=
X-Google-Smtp-Source: AGHT+IFxqxzhFl5fls7nuPQ3N6O0+2LnS2lPOt/oJpZRwzM4JKXx8cqtXXb20+EoKTDV9oeuAPfRTQ==
X-Received: by 2002:a17:906:2b52:b0:a45:bdbd:5a1b with SMTP id b18-20020a1709062b5200b00a45bdbd5a1bmr4570721ejg.42.1709883969480;
        Thu, 07 Mar 2024 23:46:09 -0800 (PST)
Received: from raven.blarg.de (p200300dc6f010900023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f01:900:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id zh14-20020a170906880e00b00a456573f9c5sm4915505ejb.0.2024.03.07.23.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 23:46:09 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	lienze@kylinos.cn,
	yangtiezhu@loongson.cn,
	tglx@linutronix.de,
	arnd@arndb.de,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] loongarch/pgtable.h: move {dmw,tlb}_virt_to_page() to page.h
Date: Fri,  8 Mar 2024 08:46:00 +0100
Message-Id: <20240308074600.3294338-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These functions are implemented in pgtable.c, and they are needed only
by the virt_to_pfn() macro in page.h.  Having the prototypes in
pgtable.h causes a circular dependency between page.h and pgtable.h,
because page.h's virt_to_pfn() needs pgtable.h for these two
functions, and pgtable.h needs various definitions from page.h
(e.g. pte_t and pgt_t).

I suggest avoiding this circular dependency by moving the function
prototypes to page.h, even though that is slightly incorrect, because
they are not implemented in page.c but pgtable.c, but it's the
simplest possible solution to this problem and the functions not used
anywhere else.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 arch/loongarch/include/asm/page.h    | 3 +++
 arch/loongarch/include/asm/pgtable.h | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/include/asm/page.h b/arch/loongarch/include/asm/page.h
index afb6fa16b826..44027060c54a 100644
--- a/arch/loongarch/include/asm/page.h
+++ b/arch/loongarch/include/asm/page.h
@@ -75,6 +75,9 @@ typedef struct { unsigned long pgprot; } pgprot_t;
 #define pfn_to_kaddr(pfn)	__va((pfn) << PAGE_SHIFT)
 #define sym_to_pfn(x)		__phys_to_pfn(__pa_symbol(x))
 
+struct page *dmw_virt_to_page(unsigned long kaddr);
+struct page *tlb_virt_to_page(unsigned long kaddr);
+
 #define virt_to_pfn(kaddr)	PFN_DOWN(PHYSADDR(kaddr))
 
 #define virt_to_page(kaddr)								\
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 8b5df1bbf9e9..af3acdf3481a 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -363,9 +363,6 @@ static inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *pt
 extern pgd_t swapper_pg_dir[];
 extern pgd_t invalid_pg_dir[];
 
-struct page *dmw_virt_to_page(unsigned long kaddr);
-struct page *tlb_virt_to_page(unsigned long kaddr);
-
 /*
  * The following only work if pte_present() is true.
  * Undefined behaviour if not..
-- 
2.39.2

