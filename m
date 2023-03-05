Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2E83D6A
	for <loongarch@lists.linux.dev>; Sun,  5 Mar 2023 20:57:05 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id f13so30776534edz.6
        for <loongarch@lists.linux.dev>; Sun, 05 Mar 2023 12:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGKYuc2vAADzU7zrublYEPfm3g/rR/f1WGM6/LkI/sI=;
        b=Kyfi0rKd//Upk3aCZ6+jEG9xTzcSdlW+B4Aq9cgOCJ266SK3vfnm1tkdI2RPt7pXRd
         /5aOeEcgds2MgdAfgu2vZ1D4O2oNH7M5sa2NOtN4h/AkNwUegzm7gLjpT0kO6pcW6qkN
         jUlWXb9vbFEAS8p5MHABZ051K4kPPEz7uW/XkPkwfrldKLKAK3VUxzQ76PP6WuUmbCo4
         W4owoRB/SZcwmYTEwgauoIzzd9uD4xjahT3Oy+xbDxewMszjPaqvxoA5P3DQ83osbq3B
         o/ohA5FKrX/NeY3inuy+snM+9n/GXWddpPIah/eoPJbvAxP7nmH97DSy2iKSgiLWiKT5
         xnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGKYuc2vAADzU7zrublYEPfm3g/rR/f1WGM6/LkI/sI=;
        b=4rCHAPvI55GBL95vu4ethzmTokV9BPxv3P973ocVzaEWnAHvElw5KNkSnBsZZm5Vr0
         Ox/6RrUiMYv64uxaVoHiIfLUzTIMCjsPGfLl2kb6b9adaP5gn4dK312ee7F8GPuFnsBQ
         lxaJr6sHenmCgdGEyoqYw24LWfc6f/mypg7NFsqAtlVLw1T2gv1XESD+Fww5aicMPCDr
         F1IydLM41m9UGVZnP9GBpzDLvKnWhSpKsOtVuuj8Y3oLQj/k6VvwuvELLksEhwV8/3m3
         qW8IFDRolfRnxUmBCnGQ/QgLq5mBfRNxUKjQRrT//CIxybYUnWWwU1Cn4BLtKMm+IJV4
         nuLQ==
X-Gm-Message-State: AO0yUKXAGLW1Wxje7yM3zSv++2fe0ltPMIczwAg+EZtMNsW4dOo3OCyk
	kx/EoqRvK6tYTFvyoYuzUU15WnSRcCxZeg7t
X-Google-Smtp-Source: AK7set8Lt+GpLOMrecu3JmpD5k2zZkktGUUIlGi4aPXwTlL56+J+rJ7Pb8VCnD8RZciPK4neeAqKzA==
X-Received: by 2002:aa7:c408:0:b0:4bb:f229:9431 with SMTP id j8-20020aa7c408000000b004bbf2299431mr8871097edq.19.1678049824164;
        Sun, 05 Mar 2023 12:57:04 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:57:03 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 07/10] locking/x86: Wire up local_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:25 +0100
Message-Id: <20230305205628.27385-8-ubizjak@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305205628.27385-1-ubizjak@gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement target specific support for local_try_cmpxchg.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/x86/include/asm/local.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/include/asm/local.h b/arch/x86/include/asm/local.h
index 349a47acaa4a..4bcc72906524 100644
--- a/arch/x86/include/asm/local.h
+++ b/arch/x86/include/asm/local.h
@@ -122,6 +122,8 @@ static inline long local_sub_return(long i, local_t *l)
 
 #define local_cmpxchg(l, o, n) \
 	(cmpxchg_local(&((l)->a.counter), (o), (n)))
+#define local_try_cmpxchg(l, po, n) \
+	(try_cmpxchg_local(&((l)->a.counter), (po), (n)))
 /* Always has a lock prefix */
 #define local_xchg(l, n) (xchg(&((l)->a.counter), (n)))
 
-- 
2.39.2

