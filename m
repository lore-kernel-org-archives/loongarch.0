Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B082EAD0B;
	Thu, 26 Jun 2025 15:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951967; cv=none; b=V3hClpzU10OA9Ym0wvlDKh6ZzQCVNruQuIzIHEm/fh8Dh+chxWZ2DrWTBOdvMp0B7Velj4Z7oO8sU/k+IdCME/E1gCZ1RLLI2bh3Hdmqo89w0mag5r/C2E8vPyKB06rrY5r38XYemuWfVfVi8QgHGlMFiB3eX3Ja2oKMorqilHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951967; c=relaxed/simple;
	bh=1bsIoJnTa3HRlOHipkzCrnkofhvWQ1TFV1zo7BXGqvY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UjNeWL+0HlbAHGTt3XDYnNvOf74+3L5OMzoevMloI5j4q39TlCpFi2CYwggBRCDyK+t0LMcp/MC/cC1uJKehR8Opm9r1sIwdgyzEHjOWeBMGGQH55EOwpP9Cu4HEYGuEqoSXYL25x9N6136C9Sp2DaLn7NQZTIAZ3g96lq863UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0ou48B4; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0ou48B4"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b3b250621so10474041fa.2;
        Thu, 26 Jun 2025 08:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951963; x=1751556763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAzHyennbJbJNQdO/m8GiAxn8DKdiS3FDiXvLMA3BPc=;
        b=A0ou48B4jvqfAak+THPmArbZdhVlE5REwi/Fhwx9Y2Xg13JjfSBcpOY5Ehpuf9Ptoj
         vXkmU9lQA1rjbZzHCbesgbaUIfoo6mVsAfZ8Riv/Wa+mfnZdO71xZWDuOrM3OatXJHi0
         WLFocsP+0n84bbAI2O+4u0SQdaPquTEvdReMpADI7b6vxlbjPAMDUleKUfVgHTuVHGkT
         z2GVr4WkKwnedsSVdPVXb+uEKYQ92+jRoQcp7ptEgbBFrE7yP4NWo3KxQWhEAEO1YnIl
         FqjLQSFAEX0WT7yqUI5kjFCG7eK2AyEPgc5wdV9MjksZoOOKssK1ye3RTBUHPbMOsJVc
         lHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951963; x=1751556763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAzHyennbJbJNQdO/m8GiAxn8DKdiS3FDiXvLMA3BPc=;
        b=OfY7yZamjfmsrOTXS2dlZaV3jX/8IFNIUIx6/Okj0C5T8OzReRiMnTgGoUaRBUoy4O
         GSb0hqsxLsSAQfL1Kt1KxiKQm38HwTWzUyfKY6iy6bqTQneKVbiwZtt5RJ1WamS+dDP2
         Y1Fkt4kiLyRGIX9i0yDPTG0TakI3Oo3Tap8TxQQU/CD2baVFjqwdovKFaom3wLss50Li
         THrFXWbC1/enRk6JAF3RB7PqIXqy3CURe5J/ngvfINWic9S8YxhOd7GvzXwwhzS3I8yE
         oMiqYJ+4Vlk0CjD7dGoV51rGx3ReFwuU7OsmnruFVfLPN+PYqfq7dZhYLo+BkxAQhtCd
         fR+A==
X-Forwarded-Encrypted: i=1; AJvYcCX3yaj/taDu04qBzePnWwE7qfrRH3oGSSg9Jct0g5IpyLyOE9KGQLzWYAlMZJUgopjk/dTcDORGsMWi@lists.linux.dev, AJvYcCXoM8CWadTCsG1gN2CDXoFnLgVYd4RYvIaDhXV+n+M9935iIO2G5mQxrGXOYxEyA1qXqVjs@lists.linux.dev
X-Gm-Message-State: AOJu0YxQisI2+1Y/BTiKuQvvY88trn3/D4fXhhbjvoq8WIauD0Rdt+3V
	5RcJKR6D/G6Ce0b03ucbb64aCGVIbqrGfiYIJsxA4zpNcBtpd6nwqZp1
X-Gm-Gg: ASbGnctehakPgCUGzBpRa+WJpGQJetAuW9C+jFZPiYV7DcJL5zkty6z4ehlribWkw30
	D8UsjoktvxN/gNRvssM2tPzNeByg+nB1y7UCh42apxsL5prt2bN42es9QKXkR3E678bzolKMnmD
	JEtAsbhjcbxS/KN7/B4Wh6T2JXCiuVbOL2DhQ3EDRXCVe7MfhTJcC4wu2G783Vmyfjsgp5i3nKt
	RlAWVM8mCN0BdKf8eZfLuVq45KuZCaZKk9WODVEgbJc8lDneaTaggkCOS2fuHtfkBk7hALsRk/h
	QhnW0i1vcMiQ+zaFQeGS2yKVjil0LbaGNGohXyM43uWQwVwmF4obq1K3V9FhXrmvw9srI9197qt
	+IXFy6gD478iC5RpvO/GyEwSUruhOdQ==
X-Google-Smtp-Source: AGHT+IFtddewk+sZIWQ3c8HpfmVyVU50AdMchy9LvQ1Hdy+bQ74fAWulfETp69JVrreL6trc7kJUOQ==
X-Received: by 2002:a05:6512:2392:b0:553:5d4a:1ce4 with SMTP id 2adb3069b0e04-5550b467d15mr132805e87.2.1750951963311;
        Thu, 26 Jun 2025 08:32:43 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:42 -0700 (PDT)
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
Subject: [PATCH v2 06/11] kasan/um: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:42 +0500
Message-Id: <20250626153147.145312-7-snovitoll@gmail.com>
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

Delete the key `kasan_um_is_ready` in favor of the global static flag in
linux/kasan-enabled.h which is enabled with kasan_init_generic().

Note that "kasan_init_generic" has __init macro, which is called by
kasan_init() which is not marked with __init in arch/um code.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v2:
- add the proper header `#include <linux/kasan.h>`
---
 arch/um/include/asm/kasan.h | 5 -----
 arch/um/kernel/mem.c        | 4 ++--
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/um/include/asm/kasan.h b/arch/um/include/asm/kasan.h
index f97bb1f7b85..81bcdc0f962 100644
--- a/arch/um/include/asm/kasan.h
+++ b/arch/um/include/asm/kasan.h
@@ -24,11 +24,6 @@
 
 #ifdef CONFIG_KASAN
 void kasan_init(void);
-extern int kasan_um_is_ready;
-
-#ifdef CONFIG_STATIC_LINK
-#define kasan_arch_is_ready() (kasan_um_is_ready)
-#endif
 #else
 static inline void kasan_init(void) { }
 #endif /* CONFIG_KASAN */
diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
index 76bec7de81b..058cb70e330 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -21,9 +21,9 @@
 #include <os.h>
 #include <um_malloc.h>
 #include <linux/sched/task.h>
+#include <linux/kasan.h>
 
 #ifdef CONFIG_KASAN
-int kasan_um_is_ready;
 void kasan_init(void)
 {
 	/*
@@ -32,7 +32,7 @@ void kasan_init(void)
 	 */
 	kasan_map_memory((void *)KASAN_SHADOW_START, KASAN_SHADOW_SIZE);
 	init_task.kasan_depth = 0;
-	kasan_um_is_ready = true;
+	kasan_init_generic();
 }
 
 static void (*kasan_init_ptr)(void)
-- 
2.34.1

