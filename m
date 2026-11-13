Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528908;
	b=TpcqVUYObFJY+8+hQCqupgQHjBs0AD92DvLsl7G3lm0fOA9A4pvnkZnLYT6ShlXH//L9
	 U8ZGbg+4TU1ORqFxvo/RNoFNrPcBGwPuChiKjT22fL6x9C8dE5HUT/lEE3f6fEVXoeD4Z
	 WL5TNlasHs8h5HVLN8brrezIOsLtJDLqBo+MmXlOXvERE36akpodFa/hdE7QPBh5I37Q5
	 txMM8JM5foAQyBpYRSfrnuHiwe5HXRbK1jdPRFRO3rgo+nVGYJ0EJNdDsmTqikJ0uRJxi
	 45NwhLcCBdlKlqXYXn+xhx0c+Bzkh2+MPu7w9JesSECiLuaFvL3pL+0A6ECb8YuXDrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=d1TISz9BJ+a5QOSJr7M6z9zKZhHkNytH1MrYfjk3YS8=;
	b=xxt8KZ90mllQPCBf9V2UnA2Ze5i4uk++uSt7UIGbHKE1d1ZSGOEk30klxO8tcPZVn0/b
	 6Z9DmG1SajgyHgheOH8JbvI/noNVK5SDRQMlumIHfGeL4Pc1q3rY87sebVkPBPHRUQgLS
	 jDrKhCJ1XsrtfaILEExEYO8vuxWDQ6J+9ADFD1Rp7hkGJHMJukPx9oBzW9om0vFZemgXb
	 dx5nlIr4j/fM8y8Q2GN2EV9a5RdsIFo6KG0KzRK0LYxE7H+gdqeTDcs+FfPpxlBha/nF7
	 gvDgK5qRClWhNIEPrXRISesm44ZCgl7OmetsN2nYpvXvxXvTqVhKx06KOOwNRVG3fEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rRfJm87o;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4062606A333
	for <loongarch@lists.linux.dev>; Fri, 13 Nov 2026 00:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4062606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rRfJm87o
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c14f6f58aeso403436e87.2
        for <loongarch@lists.linux.dev>; Thu, 12 Nov 2026 16:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528906; x=1795133706; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d1TISz9BJ+a5QOSJr7M6z9zKZhHkNytH1MrYfjk3YS8=;
        b=rRfJm87oQdN5PrSEwqm/Qqsugfvb9HGMF2GKeKSsy9zEuCFFkQ11zDQoQMHCyyiAnu
         1HQuRwBxsZ88+8NXu+C1vh8uG/jgSZ3NZRozRTBgzkdYXBXE8Fgso1W1raZE/O8HzXgr
         yv8QBCxLcoNruo93E9p9Ddmvbrn5OWR7OWkhu5bQLuM1hh9IxNoOy0uyD/WaTc23HWpe
         BlpIJAyFoL9hpxTvKJlki5qGLDwPBev5a493Q+gOpm/2+BkJBptwLMU0ayIuYESdC2Jj
         bHHkCtRjhLjPQwL/IOZyvpLhuipFCkDUCEs3unCfJNaGiMZPb7RyBOw73MGsjZbWumed
         U+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528906; x=1795133706;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1TISz9BJ+a5QOSJr7M6z9zKZhHkNytH1MrYfjk3YS8=;
        b=baR0o3G57A001vFWc8WTP4NuUJe/vnjuazM8arPpnvlM1dL7q6d77cl1IBzPDKrKvE
         HHcgH+9Pbvqc2IHAcy+F7KxzC2k5ECUodYokBIH2ut7Y4mY5QMj4MfFZ3gTCKHTjOJvk
         qcdAlhENKNgq/WOgQCY/daqK9wXIhuINy1samI3Cl+WvbM90Skj3BIPuhkdz6qlnXU1E
         mW9DRMU7VK6nVv/RHYP0brrWwZTJWifCOpxj1s6n6Q+g4QS8MuVy1DVi69xUS4EX/pFi
         ZSlJaV/Ir4cy+fq+PXgaZW7AEdVURgJEOq+DpOLZtrWeQW7l6N7+/Ro8E4oxnaEBUiNw
         aZag==
X-Forwarded-Encrypted: i=1; AL+hErHPiQxT6cF7K8blaMm5sZN5pMQ2drz5uTvZuoZBN5MnCa9qsoYvSBVsPo48ymtd5mVjyhXY4IeYHT0=@lists.linux.dev
X-Gm-Message-State: APuU4Z95LvdnBHOrTMxkfKQ/RMM3ks4pm+5uIiulZJsAP3gZE5TLaNt8
	pifpb2EG42Zf1lRupei/al+fkpns7r3KwajDk/UWiU+GhNrv6r/m3nxK
X-Gm-Gg: AYBFou0x0s+8puWGsFytXSAxhJybD8zlwlpvn/m1onrPNfCCvTsXX/P+3/gBXEI8t+u
	qwnr5R+DY7no0i1qv7yGtx7bWOSYOKn85NztMCGzJQmcbCjHuLzIqYpZetFb3Y4BZ8OABessEht
	OmXXdKO2rp/Ws4Uo6gk3/UoRutGzyu2OlgVPWCL02jVy90/wJI9J+ulYNcwRO4TZSFeYZXwtm5y
	12qh4iNvG2Pb6kpXG5jco8x9sHfWxim/prqKppN/FIlCOINLqodVvQNoR7ME0DrluAhyWWgeCFC
	m/MEkg3Xdb44Q3cmoz9ohbp7ZA0vxvU1Qe8SD+e/yWdl432be7FkmgcwgIiW7pRtyBimyxUF2dD
	l0Wvch+ULi2MNDu9ZkrIfzvyT9nLYwnlQEilNHOUWJy4pbwP83Sz7XQfjz7oU4MvWffW0lVcpZh
	JSjPJNAjA1bop+RSHtB4II+Y5xvFnVquYjJoQjlMuASwitnOCotAnsl2c6uRC9T5y618d4vNnye
	3GjkF18Qjxjde/yZ+RXpuw37fwf+Rksp6L8e9xHNyl4PEjo7bTH7ReO1NzGcwHkERo8eC4ZkYmg
	3v1j7Go1dBFN31bofbDzEVqrVA3HdIQ2Dhrs+ISuLB1mkvLL4CWz4VmgwzfJDcxd4kcEoVcUWmT
	cK0iXy4tY1Q==
X-Received: by 2002:a05:6512:b92:b0:5bf:bd7e:197a with SMTP id 2adb3069b0e04-5c17079aab8mr424399e87.16.1794528905892;
        Thu, 12 Nov 2026 16:15:05 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm200968e87.36.2026.11.12.16.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:15:05 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH 02/10] loongarch: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 04:14:08 +0400
Message-ID: <20261113001432.128201-3-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113001432.128201-1-safocl88@gmail.com>
References: <20261113001432.128201-1-safocl88@gmail.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Compiling a kernel module with a C++ compiler results in a duplicate
echo ‘extern’ specifier error.
This occurs because the code contains , and
expands to  when processed by a C++ compiler.
The  specifier must be removed.
https://bugzilla.kernel.org/show_bug.cgi?id=222257

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

