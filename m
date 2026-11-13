Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532016;
	b=M+/39ORj1r3wdHWcDOlKXl3hHCXstmJrm/I5WXBNDo4H50YB7HjW5njiYXczmMe99N+b
	 n7CEtozL8uYbxb1oLF7eDyZ+ERTibKuyJqZoHi63JtbT/Z5ULUnDxutxsuFPsm/FPvoeA
	 cbZGrv0VPzU5Jj/MGlUZKID2JxZwqXGL8nwVQ28CEY8f22WdmYFQaWR0xKDXbVtIF+2G3
	 ZS/R/NU34IkQjbqNg26Phj6+q15zUs0GHoUjSwGKrbq2l5sUU/BPJveARFcOMyv9Ekp91
	 YGifag2yOfzbAcuQlC6RhP38woj3SfvmbQYypUHF2z5ORNH2oLrukrpbfBGrkixiH/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NKYkMYlyfAhnpmLGIPz+YvV5NZYvXGnBV/EqnVTYPBE=;
	b=YYUpPqyizSmRHPn2QnyuIP0FPfSyGs2guxJNzd/IoDOUjBuLym7YZ1JPz4mfoMYa9y62
	 KqoCji0rPieG8jfwLPvWW2s1c6l5ZIjZqApuBz6JaoKlDzxVNM7lkUiQyKtWV3zDCC5vP
	 vFDGZbPXDOydN/j6XS2q9MDgOnNcSoljmn/s/Qlf+QBepFR9+4AqeUz1B+r5sIfvsr63S
	 X6nsf3h2wverDoL1V0/wL6w9eKlJdF/tx0tWpN7YbqraCva+InG9g5FMIofzrduR0UNks
	 ZqpnpUHAqtbOXT7tcmpMCYLqF7kpG/t3iiqGfH5CjZq5FdLdjaBT9NEgL3ocdGWEdOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AHRpRJZi;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C1A606A327
	for <loongarch@lists.linux.dev>; Fri, 13 Nov 2026 01:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C1A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AHRpRJZi
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a49a022221so4314361fa.3
        for <loongarch@lists.linux.dev>; Thu, 12 Nov 2026 17:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532014; x=1795136814; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKYkMYlyfAhnpmLGIPz+YvV5NZYvXGnBV/EqnVTYPBE=;
        b=AHRpRJZidoH/G/UtPy4fQ1b0ll+CJ/StxVbDGccg4uQAlGwnKPjMStmL4qtTJKl4D6
         snEmM5uF2Dgk0YFFJ1hdFSMmHABIQcmHoEOqUce0+nELaOHTT7dTc2SpZ99hA9Wg4MHF
         9wutJMr4donYliHM2GPhGFB1sFkHNlNy2yIBICCmT+9ja+pVchJLVpFyu+Z9k/ZTRkHm
         icuvPyI7zNzNzhqKHdKJqroHs6XYWSgpCAbJ+PimTqi2mYnWyr6fpbRP2b4ctELenUkC
         QrAAezdkV/SkgqsUq4iz9qEPWa2dv9wbvxqdljk61Xp46LlmWX1wEc7k3b0bCsiKzCnx
         CPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532014; x=1795136814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKYkMYlyfAhnpmLGIPz+YvV5NZYvXGnBV/EqnVTYPBE=;
        b=vZ0p70z1PcBhWZss1/r4/8hshmonFZNG7rH3+PsrbmoBJsW4/jMkobbJmaDU04NWgo
         sKAsTVuosVlcm7AD9rNbLCoIbnvMSHxam/D1Dk/0nZFrVi8ueQ2Sl4UxbHwJC5TKhV6y
         UEc71Mx9VTrFyfXBJa9F7fAo244C3E0LGV6GZkeMOewrscpR0Q3rWxuF8Wm6/qigjYRb
         l4ZWT0Uck1L5xmfnBtWmHGCTexEm6QMRGp21G0oKF+f8y/G2AmZyyWtPM7lkdtMOxMHX
         0MEbP32oXDsX7l762d+xLuYRYk9s9QArNlrFy250aSduI0iLcbPme0YRNMmp2y9P/el8
         l7uw==
X-Forwarded-Encrypted: i=1; AL+hErFe3TGOQRc1BUnSrW7TEt285Ym9q4KXX1oxNtiPyk3i6CLR/ezKvXccpVEFkmrk81Eb7qBUQb7hejs=@lists.linux.dev
X-Gm-Message-State: APuU4Z+j50Mg627ZaZxUDOW+ESCthrsTQ//X+YlqBeq2sXF8FcAjESPT
	MMzQ3GNGmK3wQeIars6cUqzRRn17rDZCmmb1gbZW04awKtUSeUmyiR/p
X-Gm-Gg: AYBFou1SnWGcQF4pJkfbfb3Uq37sS98J+3l0+GHzDwAbhrN2ERiEwcobGpTBJeA1Uy9
	gfSAA0IBDDpPTMEoXO8Na2siHqUU28Zojyz08UsCKHTSIYO/6vhUq2BwnEoUprz3cr8H3lC6T7I
	dGFLdaXhZbBszeJzWvux9PXzcNupxJILUJ/K7r1OCUUF8c7F9n66mrFy6z4VRdiVfIhy+V9SfJu
	/It4PqI78ZEIJ3y80h2zRLFizJD04RdyEvivsVrTI/JOUP4mG8j01DuyxOyiIRkB6o1gowgCICY
	NrNwX1cGo3OqXrj2yVD6Lqe3eIR20kq79kdDeb/kEPUskXBIa3RUz3M9oFAjDZ2YbbPXutfRYp+
	3JLUa1d7AOQzXzo3RPGjvrr3JzUgYyxfv6lRmgkEy/MxKP3BL7x9Cwsd3aLoG8mG8sv76xrJLYQ
	wIdX8IM8lVo2gWGh6PBQ2g64T3nSiqvcLX4u1Y8+z8/hPrrB6EwXyDBDGY3ebosF2IIlmEoHMT+
	bLnEjs/ns02pPzJOpKjGSWv/wvAfUulLeaXbQwp+Ew7LyWu0kRhAJCaJybBElnfvhiN6Z6p+3Hr
	CNvgE/SqZA3JLanl+N8nrPs48IJkBwFGFPnhHoOIA86XpQz2oQNFxaANmO8estiozh7ddR0ccOn
	+Oe6T7wH3uA==
X-Received: by 2002:a05:651c:b2c:b0:3ae:25c8:dc9a with SMTP id 38308e7fff4ca-3ae2b4b75c8mr3543631fa.5.1794532014041;
        Thu, 12 Nov 2026 17:06:54 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d183bsm3133941fa.31.2026.11.12.17.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:06:52 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH v2 02/10] loongarch: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 05:06:07 +0400
Message-ID: <20261113010631.139191-3-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113010631.139191-1-safocl88@gmail.com>
References: <20261113010631.139191-1-safocl88@gmail.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257

Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 arch/loongarch/include/asm/idle.h      | 2 +-
 arch/loongarch/include/asm/smp.h       | 4 ++--
 arch/loongarch/include/asm/switch_to.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/idle.h b/arch/loongarch/include/asm/idle.h
index f7f2b7dbf..9913191cb 100644
--- a/arch/loongarch/include/asm/idle.h
+++ b/arch/loongarch/include/asm/idle.h
@@ -4,6 +4,6 @@
 
 #include <linux/linkage.h>
 
-extern asmlinkage void __arch_cpu_idle(void);
+asmlinkage void __arch_cpu_idle(void);
 
 #endif /* __ASM_IDLE_H  */
diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
index dd1457065..c21a5b60e 100644
--- a/arch/loongarch/include/asm/smp.h
+++ b/arch/loongarch/include/asm/smp.h
@@ -87,8 +87,8 @@ struct secondary_data {
 };
 extern struct secondary_data cpuboot_data;
 
-extern asmlinkage void smpboot_entry(void);
-extern asmlinkage void start_secondary(void);
+asmlinkage void smpboot_entry(void);
+asmlinkage void start_secondary(void);
 
 extern void calculate_cpu_foreign_map(void);
 
diff --git a/arch/loongarch/include/asm/switch_to.h b/arch/loongarch/include/asm/switch_to.h
index ab9e0292c..aa5d3da68 100644
--- a/arch/loongarch/include/asm/switch_to.h
+++ b/arch/loongarch/include/asm/switch_to.h
@@ -21,7 +21,7 @@ struct task_struct;
  * This function is used whilst scheduling to save the context of prev & load
  * the context of next. Returns prev.
  */
-extern asmlinkage struct task_struct *__switch_to(struct task_struct *prev,
+asmlinkage struct task_struct *__switch_to(struct task_struct *prev,
 			struct task_struct *next, void *sched_ra, void *sched_cfa);
 
 /*
-- 
2.56.1

