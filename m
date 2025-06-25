Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA10929A9F5
	for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845193; cv=none; b=h9HW+Pu7y7tJ6kYCN22CHy6qkQ/jiJH3+9Kz/b1gGdK6yhve4HW1cUzLpldhZp+hxyRX00VniD1R+MEzPWFt6x8Kpq/I14K9fFO7XeUbUQkNx72JBFaXqYssOF/8kJp1zuymxWe7IhOV6eM9FVRyICYbUBPgnEDnB22Ncw9HyBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845193; c=relaxed/simple;
	bh=zq/W/p2aekVSufwziK4dkt9mQbwxASXZ/X4u9Ay/wd0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f8ZE5YFOrxXYbUR8dXJsmP+F2wRF60JAETs05YKPwC0LPQixoosjpMhJTtZvMOH1Oi/6oNRkL2L8H6KWCblQ6/9uuh9jB0ysmI4gvb2vAQc0DjMGG30AlNUDtI72G4pDzFZ3xqnxmiG2819V/61y3pxqndVPZQn8mtXp09BOTJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXpeRi9c; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXpeRi9c"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32addf54a00so50566431fa.1
        for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 02:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845190; x=1751449990; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQiI3pji6r3skZCyeT+2q6FDZmdcyPERVGy1ENHzh48=;
        b=OXpeRi9c5zGd+okum9b5JBxzDe1bjCp6HrZcJLM6yHADkZ9rEst2MnD6Jt960wpGhq
         wHkS3ZX9mM6ARf42n1Q2338PYoxUSdy64vIWyVmCHipwTtwKRXNaDm4ph+FLJ9cYm2rD
         x5AxMli8ZutEOCO+MHOAYr6589bPKZpAxzOCJjyWh/dzfAQveuPI6O3qMbH2zJrfNMyB
         H04PCIbHSOgd5P14zD71Mqeq1GlwfB/IY63kz2Vh3lWiisQoCHHRRH7oF5y6LpzfMtcO
         bURJoswIbtLLuX972gFHRUL8QZpfnl8WUaOG9PTkI0AcOIBQH0VmgFsRu1RXDFVg3B4t
         DKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845190; x=1751449990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQiI3pji6r3skZCyeT+2q6FDZmdcyPERVGy1ENHzh48=;
        b=ZC857g6uSJYg3qt5aGhUaPBM4xnbrkr0c5KfwLFmaV6eucIrhBMm354jh6u0ej2pOb
         pAUv0wFkzfPd86H19txop/vem5rmyaUUrk9Amfqezr+ORUpLQeqOwi1hFM85Xl3dtqqD
         xPnvbMo+YfVcP5osRDBJTEOmTVfm7v8lGWuK8Cylpzk/OKhUO3FTcakVPVdI4qHDu1Bd
         oGs6mjmUIF0W2elxYNzlpi9y0N9VbCZErq4BjW8MMTjUiVitNwoIkBDvNaPBk4D7X0ai
         PkbXW0ksau4hb3xv5eE4JW6THXD4CfUDZPgniNB6xm+gAh7ouSkB9/Nm0/X9/WaG5dcH
         OJNA==
X-Forwarded-Encrypted: i=1; AJvYcCXrEap42B0Sc/6aopGppktB2Ppz2hGxWs99ZI/F5lsNhVAfMnlVI1LnN5kB3Z3KL8QxYoehJ6ylFuc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxo7znNswaVGKGT03Ka1mOBCg9V/7Dwm1il3onT3Up+H87lUkfd
	rcw4pOLDBpQCE47ojpSssefmQcS+rC3sXk0McFrLcdtAAkRXABOmhoVb
X-Gm-Gg: ASbGncv0w1Eha/+9QFQsI925c5KRat/lFxiH+xTceGrXAfkldlMvQLt+Q9fH86to+Hg
	FH3f3piF3t2GvgKHl6JGwhnnhzFc/q93NKwxxdUornlJEIhPtFkj75YsWeoZjROeVcLrgxsMDWp
	j6egDExlj33Yr1UvNgzCQ8FJXG6+C17jkFZcLOXewe8ZfkP4+1w244GQn8F391rHogos4Jid4bb
	y8d6RYlp2SfGDq296PPUDTUg97ReRvHZgxPLjdkcoVHEHSNp7HC88V7DMwgjqXmTKsKkabWR76n
	9ZyCYRz8BeCoEm2w4cwQteNOhEjVIMG85IJsIB1q5A3xDHL1stGJXWl75JkJkR5svVDAMx95v/y
	qp1W3MvpV/IDiXrrIg6OHjXp9gWc+Qy/VeqRb57eT
X-Google-Smtp-Source: AGHT+IEfK1Xq7ZnXyT0Os2Uk+Tl7A2yRnzkJG2IvrwiF+G9b2Q8GisEMs1F3MxkK27tqhocl20BnLg==
X-Received: by 2002:a2e:a54d:0:b0:32a:7270:5c29 with SMTP id 38308e7fff4ca-32cc6421a2bmr9358961fa.2.1750845189565;
        Wed, 25 Jun 2025 02:53:09 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:53:09 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
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
	akpm@linux-foundation.org
Cc: guoweikang.kernel@gmail.com,
	geert@linux-m68k.org,
	rppt@kernel.org,
	tiwei.btw@antgroup.com,
	richard.weiyang@gmail.com,
	benjamin.berg@intel.com,
	kevin.brodsky@arm.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH 4/9] kasan/xtensa: call kasan_init_generic in kasan_init
Date: Wed, 25 Jun 2025 14:52:19 +0500
Message-Id: <20250625095224.118679-5-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625095224.118679-1-snovitoll@gmail.com>
References: <20250625095224.118679-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call kasan_init_generic() which enables the static flag
to mark generic KASAN initialized, otherwise it's an inline stub.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/xtensa/mm/kasan_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/mm/kasan_init.c b/arch/xtensa/mm/kasan_init.c
index f39c4d83173..0524b9ed5e6 100644
--- a/arch/xtensa/mm/kasan_init.c
+++ b/arch/xtensa/mm/kasan_init.c
@@ -94,5 +94,5 @@ void __init kasan_init(void)
 
 	/* At this point kasan is fully initialized. Enable error messages. */
 	current->kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 }
-- 
2.34.1

