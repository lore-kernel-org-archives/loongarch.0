Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0FE2F6F9A
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 14:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762494; cv=none; b=Nq4DAL4wA0kCszn7VLtLlA8K0jBPw6s+h2VMY88uxGWnqO4KhhzcEHCEJ//0bv29fbYq2DYVousHvlmUr8YMJm7cSXmBglfrhCopHkBktVfdfQC93s9XeBs2+sSkdIm5gI2rNNM6+XZB5kLFkGOgYU0uRu6Beovh1OHmqBuu/QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762494; c=relaxed/simple;
	bh=Xk0SjVcNNZnQp2HkpSSqHyE9VWiAO/AKIvYCRFHkldY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QMASVaeh6PQIB4lF6r/ezRv0Y72kOVtueHL7bBlO69hj8PEWuvBWi8Sar0EALHYbQfapNb9KFEr0BCU1+/MAIyHkvxlawo/iV0XfbgXM/2iLJWJircPbhIkQk29jxXYiZIlWrVKFbq33Iz+S6LaFEdiOrcwtRxEMfNewt/ALCvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOWMlc8x; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOWMlc8x"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553d771435fso1179485e87.3
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 07:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762491; x=1753367291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lUgc2mQ1RFMODut/DxjH0e3nH7UxMqXiDg2xTFsSSw=;
        b=nOWMlc8xf5eJlIjWAevUOgnsuyd3QMRsJMo9jLsF40rAViSrxUcybLLnQWC/EMghnm
         JbV7rHK3DGU6H41KReuKfOvdkPMKXxRIe38Yn74VBcPqFZ4b5WA5+YwQkt53g9UaX7xj
         3GU2xqSs9AFcwDjoScnkYorVI9Jo/CFuAlQthL/Qm8lLE0MNhi65mNt5MaeQqhOjvQMK
         6C+ga1kmcSvOILp3q0u39jsijOyUpGF6953Q76EHza+AzLN0pzkuQ8p20fFLNOg1F+11
         QcQ5BNMORn7gQRolrRX8dktS/KyS93QL4xLUlu4sny1joidyqnNb0Xhrsdt0vPz30nBT
         aa1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762491; x=1753367291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lUgc2mQ1RFMODut/DxjH0e3nH7UxMqXiDg2xTFsSSw=;
        b=ZfwkkgCr8uF4vzcXILLpyM5a3Scoiectkt9QePWeEi4Ox5xbn2yjqxrm/jSbasp3ol
         LCdNI/lcaufCYW+McfqvXApgZsHyTMYG89thb0Nn8h1m4AJ7qXK5thTPzhT1ApHO8mUy
         9aQ+nQH61r3DMM7LsTdTaWU8Fua4GUfCZd0ajIkNpg6alqBcUUN87SoT/vjrFBKjknDE
         pM/Vt4DhiN76bc0WMwU+MOwhAUd3zL7HDBy3SxAlyyjLynrVVqznz0prmSwizDYFoQmu
         j7KezppVonVdGIJxG0TkBFMz1CsXN2cWvpPmqK0q6/ugSCSFWcmdYkeRqqcB5YKgK9y3
         5LtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7XsBa5287MCqoEIj+YJYdzQzPGYH2S/W8xnpOAbN3IPss7EJQbVAl9lWmrLaBPWa+lQKLgwnfLtE=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpm5M1L47tFBTiS2IVe01uSW59QOwLcIn5ia3ybsIyFjh9DrEF
	MYP9y2uZjPrY0jBO3v5IRgG16hVY8iMYycT8SGfVXCoqbDKRRd7GA2pV
X-Gm-Gg: ASbGnctXhVY6urELBN+Tk9hwaLPKGRtfe+P8dove758qRZGpKzMBh6C7++NH3+nCNlN
	7iOhWFxmC44NWa0eUU4luT5w2NKGmy9f0awRYGo9BwKsp8jnxcSYggFpUlDBWkzCJ5q1FyH1ihw
	5BhyyP1Jb88j9Q6pMkqhobvDECccaxjWLlf+U9I/t00EtvzPSrfcrB0rXL567oLT2gEG9K/9wNY
	+zmiPnQg/68u6q2fREbrKdiXpmQYG8zaMtjCN7QIsM9oYUd7WrJI2Lzf0NBK3gST01eNnJyPXkY
	ZF4Po7SaGTcdhl4X3aa+ONL8I9OxB0aBWPx99o2aGTJqGtnWi0Jk6cO5Zbrmzbkg5/jWNc5G8Jh
	eas5nhFHt4wiwAw5Am5ByZAIJTYuzlpu7woPZ/w8VtgoAess91PWpr7yWDSR+04DtGCZ1
X-Google-Smtp-Source: AGHT+IHDhctOdPCboINtKeXrLTUszqbBiUuSpXqwZ8iJGfUdyizY8inGgvaZnyh7hxTvzKTa8fgC6w==
X-Received: by 2002:a05:6512:618:20b0:553:23f9:bb37 with SMTP id 2adb3069b0e04-55a233b2fbemr1641277e87.40.1752762490421;
        Thu, 17 Jul 2025 07:28:10 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:28:09 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org
Cc: ryabinin.a.a@gmail.com,
	glider@google.com,
	dvyukov@google.com,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH v3 09/12] kasan/x86: call kasan_init_generic in kasan_init
Date: Thu, 17 Jul 2025 19:27:29 +0500
Message-Id: <20250717142732.292822-10-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717142732.292822-1-snovitoll@gmail.com>
References: <20250717142732.292822-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call kasan_init_generic() which handles Generic KASAN initialization
and prints the banner. Since x86 doesn't select ARCH_DEFER_KASAN,
kasan_enable() will be a no-op, and kasan_enabled() will return
IS_ENABLED(CONFIG_KASAN) for optimal compile-time behavior.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/x86/mm/kasan_init_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 0539efd0d21..998b6010d6d 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -451,5 +451,5 @@ void __init kasan_init(void)
 	__flush_tlb_all();
 
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 }
-- 
2.34.1

