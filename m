Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9991227A454
	for <loongarch@lists.linux.dev>; Tue,  5 Aug 2025 14:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754404003; cv=none; b=hLqELSgmVg8a9I+m7VLwUJk5NRXGf+bgxBHLDwoVLsSljOs77WNK1yxmjqwjUDFrcyO9Tibx/vin5/GKtrj2TDOusXHE8cFBxgTIANakrTcey4hQG1rNwm+22JOKWDDqzenV64lawbubgyKkXdVbv7X3KMFaIoTYZ+fhYJ32PhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754404003; c=relaxed/simple;
	bh=dUvJbK84nrPOQrC8AFlAi1Pi4GwbCctj5hOdwNI27js=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rpmp6DDOa+2jVwG16J0pUZFPk0PkU+ugDdlIGNeOi/5ajxDNOHbFST38RN5q+yvjiL1PiKSfzhxMs1L9EPSgr3TS+dSFzjBIup2DoIs94obKds3BKhrmcfY8R7rKnHGs+gaTBNCyd8MvO0kxIzjWVMkp+TmDOZXhnhTu3uOn1Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLH+Tw4j; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLH+Tw4j"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55b88369530so6962369e87.0
        for <loongarch@lists.linux.dev>; Tue, 05 Aug 2025 07:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754403999; x=1755008799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fypRqRD7duJ7p6/XnMiehAY4t+I2qqoeS7XCKLtEaPI=;
        b=MLH+Tw4j8kZ8OQrDQqqxObRz033GPszPuy6aiSPLTuWk4tV1vLcxntDaZW4GEewIU4
         i4Z1ndviNACdWGooYIA01/jI7iFr/jVpb2iRII6+d57TSbkjgULIBPj0BYsPU4moGKbQ
         dfFkNzoyqmIYR7lGdtr/gqDjo9HVuELZZurGE+04T6WeJljOiywmbdv632i+ro6zt6Q1
         BbKsb5rXgdWPlnHDWv1yZy8/S2Hyxuw9gSwzZgFzJCI45xZxm+7UY4On+uF2IYGYqxPE
         daTzSxf/mnJSJvgrnrEAtDBZTfO/JGVoEjy4/u601LnY/hK4X/f62eCFG++BjQHgTkWF
         Xjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754403999; x=1755008799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fypRqRD7duJ7p6/XnMiehAY4t+I2qqoeS7XCKLtEaPI=;
        b=lzrMnDaR5e5fY0SNCtCrgPncvNXy9drnRpuJG88TKlaAUMPT+eEZNc3qdGWIZu7CbH
         +a7/uktFvl/7REwR51fkY10KM5FGhjNdWFZwPGPGT+jH/hw1vnjey7gEFl1lkbXHTrcn
         0daUTNJlpAZ3YH4H7bWgrdNupdjrC3OjlQHwFqliXO/x2d2E6L3VvSrMyxcO1328peV/
         TbriMbEYFb82P8JoxHSzM/hiQV/cN5PlTJqRbyK3CD9dc/0QqBO33vkgejJFRzZjMN12
         xGL+HD7KODgTzW1pl3ZJDVMQlpf1hC1pTnhnG9Rk6EHPYsXmgwFeh+K7ZT43hJYzf5F/
         L5Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUR8MrunWvce+FdaK+gsVZqrT55ylkS7HS4xTHQBh+IqmxFfDMm5aGtXulpzMYlFFX4S2zM7Bob+Qw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUgnhlF0R6cOwERpwK1gIZfv6SKpO2nhae5bPNNlKyzGuRF6Di
	vW+eLenKWiloFLVSC3ckUCi/RkSjNs9WkVnWjtCzZCFrXjg5eBAeS+oUAw1/7rlhTyc=
X-Gm-Gg: ASbGncs+vMJvmbZ43ahgFfa8jkJokVAisGSB2AYs2cnlqBshraEHzaLd6YSVd2n3LP0
	AVYjlVE1mXVvb+GJUlcIyx7I2o843ByjTUYIZdjHNuo8KS6Aw38lfxEKCIecP4PX8ktqVg1F2uS
	Rr++1NQ5sOCsqjGPQSR6pOESVaecfMiJI0U+/ANmWeajyCyCCuH8ekUdVigma6xuuSDoSsUvqC9
	B1XagcLfCwPrcSrDwRlFfqNklZpWHMUlkje2d0oRGIF3Xvw/UacrXGP6atcTSfcFhSntabCwPIy
	37PisIIoKff/sYrD27HvKtKWnMJaZXXAnrOaQBotChwz6HnkCZ8NPwL5FH1gZbBujIuEvDLnl2i
	Ruf4UrOQhnhrIJxqO+9KcwGpDglhSF4S25RcAeU3uf8AwPmZa55cQaXcRjNYdctxlJ7KnCw==
X-Google-Smtp-Source: AGHT+IE4tVfY0GDnGQOdh7BehbCQ960f1sYrnnyIro3xm6jwPaApab0fDljnNDBd9SZqMzry0nuyew==
X-Received: by 2002:a05:6512:a8e:b0:55b:5b29:61ef with SMTP id 2adb3069b0e04-55b97b89544mr4329067e87.56.1754403997895;
        Tue, 05 Aug 2025 07:26:37 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:37 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	zhangqing@loongson.cn,
	chenhuacai@loongson.cn,
	trishalfonso@google.com,
	davidgow@google.com
Cc: glider@google.com,
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
Subject: [PATCH v4 4/9] kasan/xtensa: call kasan_init_generic in kasan_init
Date: Tue,  5 Aug 2025 19:26:17 +0500
Message-Id: <20250805142622.560992-5-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805142622.560992-1-snovitoll@gmail.com>
References: <20250805142622.560992-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call kasan_init_generic() which handles Generic KASAN initialization
and prints the banner. Since xtensa doesn't select ARCH_DEFER_KASAN,
kasan_enable() will be a no-op.

Note that arch/xtensa still uses "current" instead of "init_task" pointer
in `current->kasan_depth = 0;` to enable error messages. This is left
unchanged as it cannot be tested.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
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

