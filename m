Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D55A2ECEA6;
	Thu, 26 Jun 2025 15:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951953; cv=none; b=OI1cz5bisM5xw269qhskZQAtAf8HYwFY18su/x7WFUFiDpUqoVp4hulkj1m3Pf03mK32Jc49+0EPkVc+uEtBTR+zxFyrX12vIatDL8HbM9SiHF8vpcrcohGEgwkbXFxJzZZ/h9WRWBkDvNxK7CwJPNkTewFkVPvn3mErx35nXTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951953; c=relaxed/simple;
	bh=saCtcS6Cr0jusyPkwN8sq8hOZ3afQESk56CskNDvtIk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kEg5+ECMxap9c2Oh1FSYPx5H02rfCgnYPTHeN+CpHi6tuXHtj7fNPnXAG1fzPFbTY+/I6Fg3e6rrhlR2BhwRqwdnd4in3lhtRT4MBnQCOQWSJIhjKeMmCwTNlyBA4egylZV+lElzwPxXbm60lASUnXd1hL5snyLUbmz6xYub4VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvss11Nh; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvss11Nh"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b51f5218so1272527e87.0;
        Thu, 26 Jun 2025 08:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951950; x=1751556750; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nxtugr6OI+iAiBoQ5DVdScoZ4wigsSWWp7UsuEUnh5g=;
        b=kvss11Nh6hZ75wTPCgj9defr4b8szoVCdPxkm5bdo2ZXwr+F4kwBNAwT52YMh3X+L3
         y3VcBG30UIRBQRrBRjIGRDoRpSL1KMkILC8jaeHuOm/6opuc5g9IxyBiK/V12HujU+pT
         k4DM0TpiLzWigw7Onv0RMXh1ERew2C1kmkLpnZMUMzlhtlq3uH+So/VA6VLr04h2efUu
         ucbBGsultjtshxLrAQvJg0iezh7gORyiUtpO+VzBIqiBB4xjWhQsUImo+/reHvr1iFNe
         1tE5vkC6m5RmJ3ZBDgEEvj2Hu/rDCS/Yq8t5q1j+Ajq0I3gU61DR368A2PucLM7mOdO+
         navA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951950; x=1751556750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nxtugr6OI+iAiBoQ5DVdScoZ4wigsSWWp7UsuEUnh5g=;
        b=D7bhIMgNiKmQXlI3YF4P/gdQQjtty3n1t+HjQ4V3SU5DiSX0xhbrj11X51LM1vxR73
         MaR7UqzmY2Y9es+8HE7XJp/WNmqOo9k6EL+nuC9ih1gEjlLzv6qv9IPhsnyN3XKJcxb+
         HgFIbp9vtAzRZKTsIPH6ZLKg/s3OpRMQ3m5WA8VIDHcUig9C4KI+vwPPD6aGD42Nhtqc
         +mZT1Ms5HKQge2fPrN+EniXrBy4Tr6TuaFgzhQTrNroaAG/RiKawOIFKr3xCGriaKrj9
         MCNKdHZxU40tjA+to1jGFIXyI/I0FGKT/mOI1QYGGKvQJGOUmjLAgtSXNUl+Wbrwjy8E
         /RAw==
X-Forwarded-Encrypted: i=1; AJvYcCVqImoi4INm6F5lo8wKYwOb/Rou2E/2qrzZZdGZm5Ng97tbIIjIbk+Gu6n9N9Zwuheaii591HRv1quh@lists.linux.dev, AJvYcCXUSxkSu1olomfiofHoFFOurUJUb0F0Bfno3JHWTmOmf0M9sVYPVTNR7UL9fm4W7pdZEXk+@lists.linux.dev
X-Gm-Message-State: AOJu0YxfP+j2DehJrLu8D1LF15kexG+GMRg/1VAXpMlnmntJ4gzuXAAD
	qwEiKekAjwYuszORULiwTrlS+1E1HBqQIfJwgE2ipXbspK1xVQr97PaQ
X-Gm-Gg: ASbGncvgjiYPqtoTl998EHKcfjfe/pMD0A4iIMm2A9CzVNvFpJ+yKWkXONXXYBnwXCC
	bWFP6MQrLGbxhzQbFeaBr+Z8W1RrRt3d7iF3G3N4475rg0DaljmxlxR7ECCGiHa/YxVRDQnI4kX
	6gVXfs/RvRiZuC+eMBxR6GbNSJo4jgClStpDCdrkom7w4clHoYRCXiEh57DbAxuk4KHru95TCIA
	j6F7hAsSjvUX+ICa2786tBo+DTwMujM45srscFOvCeScFVDNmyC7HO3hszOE5YX8pYCwS+uBqnt
	MxBpNGVw9wLFlBwuKXaEaKr/ZKJ78YawTPJuHUWj8ZcdJwlRjtBmXDCBs9BMOd/eSkQMVYc7Zot
	AcdfuywPQrIwmIQfacjfVjrQZlqxtzA==
X-Google-Smtp-Source: AGHT+IGGt6yu06Z/Fb2uJjOxPY5fFcWkWfnfjRjUezmHyuS+t/QogNEJZXQVSUvZn1n0IiNOe7m/dw==
X-Received: by 2002:a05:6512:1193:b0:553:ccef:e31f with SMTP id 2adb3069b0e04-5550b4749c2mr141485e87.13.1750951949806;
        Thu, 26 Jun 2025 08:32:29 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:29 -0700 (PDT)
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
Subject: [PATCH v2 04/11] kasan/xtensa: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:40 +0500
Message-Id: <20250626153147.145312-5-snovitoll@gmail.com>
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

Note that arch/xtensa still uses "current" instead of "init_task" pointer
in `current->kasan_depth = 0;` to enable error messages. I haven't changed
this because I can't test the change.

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

