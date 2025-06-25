Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78CB29B226
	for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 09:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845218; cv=none; b=gtKdj5oSyJMEXQInCt9C+b2BM+9Mvf5Y0ekyqsWfDTYizJqenGiE5eSX5tEGLAsDv+IiheoOE3/W9xMFJY9u4VK2vbu5I3ifvUh34q3MOWE2oa4cRrb+lnNZyRf8sNWElsmhulY1JynfvhPtFkYPmXVCe4NncSRF2ftq2sX640s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845218; c=relaxed/simple;
	bh=9TRhdQ972K330SQZmWrhzPzVpDmeg4Vy1yztZoga44U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=beH7eUTUdAwU2MZaEs5VYWqk85yCq6UfTck99fNdezuka8FGDOsdgklEqbHtIvds+uAOvvmQaduM0dDXfeOhCu0Y1RQshy1c6v8551e1WfpQS+9rXKOiY7r9dFnyadSukp3pkaYWwqohAmrppWdeFMkGYEupVpl6m1LpApFZ2so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=da1PYVOj; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="da1PYVOj"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32b553e33e6so54955151fa.2
        for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 02:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845214; x=1751450014; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEyx1UFRvpVo+G4N42POvQdsD1hWzSpAcJ0U0Tlc1dQ=;
        b=da1PYVOjx1ttQN6+hoFu9oNvpoTxKEMoZGfo5EnHgMOK+DioX0Awa+IS5YJZWYEOac
         mttK6liY39BjNJvAKn3zc3s4pW2JfefZOMa5tDudVl4HLC3LVNECk36+Fe/9Fcp8ziqS
         WJvCCAfkgtlIrkUtTMv8ha2IOcfTCYrTywOs7OUQxgke1cVvS91DCIMsQYkaW/NpwnvR
         pZcdtsPq3srYGjmeHt92ekRimGgV58/HTvGQGqIg4E3iu9yd3wC7l8bMxZN5CGoSgWY6
         ZEpqMGLDq7Lf8rAyLs6UIiC4CKjd/btHQL5glvTR1I5v0/Yj6RRyAf1/z90o9fVA3Acj
         aVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845214; x=1751450014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEyx1UFRvpVo+G4N42POvQdsD1hWzSpAcJ0U0Tlc1dQ=;
        b=MXGA5GkJ++K6xrMIobQJ2CyVDfY+o16MqyMnUXWiYZsUZ6rPzz+xpTYJO8OVqkbf6o
         Ht2LpDGax+SMKQQO1U5uFnFkrP0mb0Pupo65Wqz9JDSrG2t7NP67qlGj/j1Q7WGKJNCd
         e3c74dqimQcOCSidrsmX4K3s5D0PvJyRQjIuT/uIq9PlYRKSFWpE6s4DgMHa+VHh2z3R
         w/uZyDx/FA+yUTF9VnFU4bmd4zgsvQsdLeVCd3kovH6gwTrn6+d5/QytfKzDYSRXtfeR
         zD76VHoqa/4gtLQsZOykuSnh9SiPErMVWdiUAkGd8oDFQNu4vKeeE7FZEq+FvFKzmlKu
         gQBA==
X-Forwarded-Encrypted: i=1; AJvYcCVZQ7TtFp66RjRoundXbpQtSgnde6JwjGFrv2oT+YmlUQjvGDI9KeHlzCAjcOFrVO6dUJzwXSbxXxA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc4K0cZ1tO8IXoxwAuxIkH1lTmIXC+7eDUjrJ40sFL37t8RHm3
	cD3PcxXtV+jDOiCAQqaGPvJ9kXtua+0HCjzmyd5IjEgyDcwy0n0BNtmH
X-Gm-Gg: ASbGncs/GXxoVtR/H3gQdnasW4tB/hWATWdouWvwY5lbuv2V+S+fL859wyp+im/Drpp
	91fPWu6SZ6YUKxLxe93xO+o84j8EpaFm40+c8QBo0oLaRDyuDe/l5eXenQETSIiTt2JtOb6CRpI
	hiB1Ga0SbN9VyWjhKeVz8U8jRVNzV2aVMTi+ZmawfwikXbk96D8OvHiPyRkf1soI21S1RSSSoPn
	qZ1sS1pvktvhsu8T/tJj2zv4cgpF5mHwN+FTWZtLw+bdAcbAI2UA6kYD2u+EgrIvbItLpz4ZVt/
	EyMB6MmISRbFWpeJ2zLFDO0KXrkDsT/Rvj1JstjD8onLKHfqNaR2IjLCNqisSgg93UUPHfTaNW7
	gviPfTYQGc3xssZIKvuST4QMc273hwA==
X-Google-Smtp-Source: AGHT+IEcjLY1beu9wht7welDNsEE9aAi3GLekIAB8d1qrA4KC0EwxtCdVmkKJY06lTM1Yl9RfqTm0Q==
X-Received: by 2002:a05:651c:514:b0:32b:3c94:992d with SMTP id 38308e7fff4ca-32cc65755dbmr8009981fa.28.1750845213516;
        Wed, 25 Jun 2025 02:53:33 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:53:33 -0700 (PDT)
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
Subject: [PATCH 8/9] kasan/s390: call kasan_init_generic in kasan_init
Date: Wed, 25 Jun 2025 14:52:23 +0500
Message-Id: <20250625095224.118679-9-snovitoll@gmail.com>
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
Also prints the banner from the single place.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/s390/kernel/early.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kernel/early.c b/arch/s390/kernel/early.c
index 54cf0923050..da7a13d9ab7 100644
--- a/arch/s390/kernel/early.c
+++ b/arch/s390/kernel/early.c
@@ -65,7 +65,7 @@ static void __init kasan_early_init(void)
 {
 #ifdef CONFIG_KASAN
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 #endif
 }
 
-- 
2.34.1

