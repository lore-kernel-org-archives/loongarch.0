Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7642A2EBDF1;
	Thu, 26 Jun 2025 15:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951980; cv=none; b=XL6cVltvceafeO3DAcMkVok4+cjcRjIA7Ydtbz4LQ63bTqS/7nNpKTrzGCOjhtX6QFAmWgO6iu3+yjjt3sYODqnx5TCSG7U0gHjxxMgTYe/fuGpeWYui5uIxEQ5u5dd6+EgcdUJUga0IlMjMYNqKcj5G1y9Z+Ak6loUnQeCuMrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951980; c=relaxed/simple;
	bh=afvhZBgmT2YwrMa1SlTy5Vlucrmbj6usF3J+30vljzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M07e4kCletBe1Errbzb97Wn+mLITJd8xDgz0G4+sviEOVajonP0UId89tJ5hfBbsgRgvFMLaLuejXFUBQuIEENtkE3qWx+INBAwNgJrgw9AjAmTYUtMQMkLFIVUsY2x/qD0IojBWJPT/tjrSj7PTCEDqQ7foRgNfUiz3S6ectWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WY+7T2H6; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WY+7T2H6"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553dceb345eso1130157e87.1;
        Thu, 26 Jun 2025 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951976; x=1751556776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBJYqNEFUsGcSKAGhcxt9dDlG97Ga+bpIV5ghyvlETw=;
        b=WY+7T2H6hkSmkcDDMnZsvndyG3kP8nSd1cUo72tTEyJs9Ml5oOksUqv++MUQ/EJfUW
         6Z9Scy1UbgFjIHdWKseXAhVdIiTCvs0GVlpd3aHb/KZhJ6VjUW6hRD894APEuIt4/JwN
         DnvIRiGGO/9TtehsZ4yD76F77ZDCsZ+89SOXRiSuLdjyoWqb98eM3DmClS3mnvSk863E
         +71C/zXCvAfwiZtvo4n/G741fUoRm/gn7L9Lqud4c/zbnkTcu9mJTBNqpFoPlMCuOnrX
         AyfFcpEyj1nlMqasFVcwlOzmYG9vSjIojhZGvdcKDe79iOkXIjYI8fEPOpwVnqoztHxi
         FMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951976; x=1751556776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBJYqNEFUsGcSKAGhcxt9dDlG97Ga+bpIV5ghyvlETw=;
        b=fBY9ytwq+NlJqaXVrOk0k5UoVhwVup6tn7IQgds6uNC1RxZdK3wMIidp9QgV/soiII
         /8O4wo0u+ZPRHbNvcasssRsFxwVJ0l2wTpTwHxJZT2DiepKgt5PJjPoezpDpbV39yW+9
         Y1aaiN/CiyOsmGEsSsif7p0KbyXfx1+EyY4R1VKZTenFpOCJXgRPSl8B3hYQBBsKSwll
         XlI4kTgQYPd8IfXQRrBqjd5htAntFM9S+v31Mr3OeB59UV50qYW5B8AFVBdSGNWV9JPU
         hKexqIthk+hIUcQv3VIMOHaTSsrA3x6/7zvPHrDmeRLQXMtK8HmqF5CUSEsS6dagPXXk
         NRZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2SdeWt2HQBRdYBoz258QIp6PdLja4iVWjeGgMdwd1HOGwFFkOJxSBD/hXpZh0mRpnoIjn@lists.linux.dev, AJvYcCVzpkAH6jSbrpTO5hbZmnOH/fGsitHCSYJjAQa8vKKKxSkB1+SBdgwibx/ClAuEcR8xUeQ4ICVQOvSg@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3zMIy13ONroFO35it2AW0ERl4AOOWaXK3rvRh57BEHM8GnKVG
	JBHTtkdtTW6Uv12bgi3KU9mFl7iu1sG/OsxDZyRkbSnNu1i8JD7mOt7d
X-Gm-Gg: ASbGncvq7MMpUFciPLi5w1vO6gcW4g2/LXqTWLmjsGcBTMO++JDgvgG2u4+gLtJJmIc
	JwxOhxCFWs6yqrrqOyUe5kFaJvKYeZMsOKH9qXa96vp4wU02VWdM6UnTDPzzIX2UVjTAvx5SM9y
	65bb6LBr/B+loaZ5MkOjkkd97ejU48cg6DVe4bmdSvJqVJB3SDTuk1n1cl6RXopbnCZstiAtnT2
	7t41IGnxX8ZFn96DZ2vw2j6fUryZtNU3Tkb+1dxD8yStO/57E6a5JweB/NEcfRDC0HoE2UZR7fr
	9Gj73r8z8TfajbGjC+ui8D218aMlCUOuCPF/lF8bxu2dBmJ/gEuXL0HF0dJQIXdQzM+azF0fBeq
	TMUCWkVsfER32pKI8PKg1EDH6hach62rfcACIrqrv
X-Google-Smtp-Source: AGHT+IEFT2kc8D9hjhRCI4Kut+1atHj8fN6ClIv95YfFL1i2Q+3r8LuVnLNmbJZfRzfJp4+oWdZNgw==
X-Received: by 2002:a05:6512:3dab:b0:553:26f6:bbfd with SMTP id 2adb3069b0e04-554fdce00cdmr2633203e87.8.1750951976245;
        Thu, 26 Jun 2025 08:32:56 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:55 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	akpm@linux-foundation.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: arnd@arndb.de,
	rppt@kernel.org,
	geert@linux-m68k.org,
	mcgrof@kernel.org,
	guoweikang.kernel@gmail.com,
	tiwei.btw@antgroup.com,
	kevin.brodsky@arm.com,
	benjamin.berg@intel.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	snovitoll@gmail.com
Subject: [PATCH v2 08/11] kasan/s390: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:44 +0500
Message-Id: <20250626153147.145312-9-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626153147.145312-1-snovitoll@gmail.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call kasan_init_generic() which enables the static flag
to mark generic KASAN initialized, otherwise it's an inline stub.
Also prints the banner from the single place.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/s390/kernel/early.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/s390/kernel/early.c b/arch/s390/kernel/early.c
index 54cf0923050..7ada1324f6a 100644
--- a/arch/s390/kernel/early.c
+++ b/arch/s390/kernel/early.c
@@ -21,6 +21,7 @@
 #include <linux/kernel.h>
 #include <asm/asm-extable.h>
 #include <linux/memblock.h>
+#include <linux/kasan.h>
 #include <asm/access-regs.h>
 #include <asm/asm-offsets.h>
 #include <asm/machine.h>
@@ -65,7 +66,7 @@ static void __init kasan_early_init(void)
 {
 #ifdef CONFIG_KASAN
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 #endif
 }
 
-- 
2.34.1

