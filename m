Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420162EB5B4;
	Thu, 26 Jun 2025 15:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951996; cv=none; b=MLJTHbLhlzHfsH9CJlyj/D9smkCmKd7xesuP9n79w3/wS1WHNxfkCaHdil22m0q4CArRn92KFzFpmCFsOypR0mIQMZT5es1J4Eq2cHfqAgIZfPBb+rb0VlvnT4q2P1qWgF6jeTjDAFjlR6VXrmITRqvjn6k3AYDsbhOVNObsk5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951996; c=relaxed/simple;
	bh=PO73mn2x5YD52HxkHa1DEufvZN68reU9EhZDSWAODRM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ppvBT0p60B78ckeRex/o6uu+/B6qxo0oapzjm1K3Gsr9AicggnjpxBC3vruhOPomCfqgAIwLd1N7MrwiDVvRWngQVb6SIPuCbiXJSZHIw7XfZ1itwLtHr3vWCBFTDSe2l8ybk5KqsqKElZdTPeDo2mPrGW7gGkNmP2Gfi0evX5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+nPnQQU; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+nPnQQU"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54d98aa5981so1655432e87.0;
        Thu, 26 Jun 2025 08:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951992; x=1751556792; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSxJD4SCtsi5mR6YtVjdi0UPNRveg1OSTrY+9IeINk8=;
        b=D+nPnQQUx2p58BdMhmfhRtWOK1Q32uGnHroy/UDBObX2kK/gGtpze0y5WFj8TJIo0d
         qrbTWEfdm41rnAmNBaH5FdRr89HYSHSlEb/NiONYq/CYvoIEX5epDgHB6HfMWvHDk0VO
         cTzPyvcyRHYKaEIng9lUb3yHpQbcnqnAtvf4l6NO8YR4yl80WNHAYQRoxODS8+i8j54K
         r+aq0aXCWwdH2lK/GKyMF5OecLRNMs3Cno8jjrDuyMQLMoEvv/GcFeekUY6pyphC6EhR
         eJur1MHwZXrk+6mtZmM4yT4nJtzk5b1zfGOOh3Go35D0zwMhXZgGM/TWNCCTIfIzJS62
         YSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951992; x=1751556792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSxJD4SCtsi5mR6YtVjdi0UPNRveg1OSTrY+9IeINk8=;
        b=anvHAn4SrO0rJl+tEpHEzjaEspEqQS73dUp4c4s0CWsMmk6B5/sx5pMB0b0+yaCfu1
         jlVQDQJOqJDTCHuH2eU1Emd1yRmhqt2aLnsDKdkgexzCs82m+we/32CkdT/Am4Ao8cP7
         jF3kp2ef8fp9atsTQE9JAi79Dq7uA62O0SDSn1DSINZ3d7fxLQt18NIpiZHTuXNo7kwK
         bzNnPR0IOyrlpvIZw1hpRpq1o+ZEq4Ci+mCEZNHK/Pa62LLnB6M/fdJK9xFz9CL4RG0/
         PlvRrd6MMzWv0ldNUx986ayrQJaZmxW3DCIaIDxgSsr2dOVhTaSmXccx6VmlkTsml97r
         EhBw==
X-Forwarded-Encrypted: i=1; AJvYcCXU4UyzHmWMxNwGktdwVGlXwG536bRZwaPdVH6cLjad5wlcRW6oIS5vhfcXlZ12W/xZK/qZix1UJnvR@lists.linux.dev, AJvYcCXoZL62StxGMzvkb620kAO8iTUJV2+A85IAmJBTuKpvS3+yBitSdX+c5PsrPz0oW9q0DK9i@lists.linux.dev
X-Gm-Message-State: AOJu0YwllJW8qg3SW7T4YOso895AliFvAtGs01Nz6wPgiHO1v2YqPFbk
	TYsNyak5cFBynIWFympIUr0ntoXAZwwLLecRtQvjheMt/P3LY1U4dTeF
X-Gm-Gg: ASbGnctCWIejriXiI2DPGQxsKpaKmn0X75zfzeVEv20WFv2ilhyLk7qkt2cFAapq6FQ
	11onzXDd7Dg520edTn17FcbZ3gFzCeRRHywO+pJwHXtPhq+BX4EuhjZTp9JaYkCywc5FCNceUzw
	n76iJJ1wxYjTw0jYZVIFNassBzOnFr9n+1XZfFnJS6i5vHnVXiE9U8dKSlYiWiIYIQ3NSKFZ/34
	BSmlm1M4O+TZ3XICo6p1VBiCaSfsp7ojXcMlUq6E4TQF0kCHuKRBUlsGwEK7vFzlOZ3P9JbH2NT
	HrmKOMzPlC+Dy4rCHSpxkXy4D9FnEX6/BhkURx6QdQL6EbFRpWdpzqF6gSD9zlday6gpFcKa/km
	E/eUEyhU8+c4HigFimWgRakTxfT7jpA==
X-Google-Smtp-Source: AGHT+IFoZkRuIIumANr6hYYRzr1inmKBevr4v8neJa1j+iQaqRjcvodg6bFFAhrpbTZKPBtQIm3EXA==
X-Received: by 2002:a05:6512:15a1:b0:553:2882:d79b with SMTP id 2adb3069b0e04-554fdd1b90dmr3161154e87.32.1750951992214;
        Thu, 26 Jun 2025 08:33:12 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:33:10 -0700 (PDT)
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
Subject: [PATCH v2 10/11] kasan/riscv: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:46 +0500
Message-Id: <20250626153147.145312-11-snovitoll@gmail.com>
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
 arch/riscv/mm/kasan_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 41c635d6aca..ba2709b1eec 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -530,6 +530,7 @@ void __init kasan_init(void)
 
 	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
 	init_task.kasan_depth = 0;
+	kasan_init_generic();
 
 	csr_write(CSR_SATP, PFN_DOWN(__pa(swapper_pg_dir)) | satp_mode);
 	local_flush_tlb_all();
-- 
2.34.1

