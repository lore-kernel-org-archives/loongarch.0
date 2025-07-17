Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF332F7CFA
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 14:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762484; cv=none; b=TwDEGBK3skgZhq3o9VgZsYWNbMtGAdRvfL6knUlxVs8Qk4FaY/85yZaV1vemoxif2GgoV670S4zXM17FNwBIohu8ffv9CedL9TZQsq6qhH9vH/1Yfpn9ntiqdXIaODKVHdfPzXh49Fqh3/sqoqisUDk9IrxZzJROtxxym9/8+oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762484; c=relaxed/simple;
	bh=dUvJbK84nrPOQrC8AFlAi1Pi4GwbCctj5hOdwNI27js=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gvjoH//bDErRvYZ3SnI4aru5cHNhrmTYikkXdafAVCyineiVHlVAWXWpZtPvTPlPP3dFl9uq/JtIzPUUp6NnRW0SfHDSLoU3qSck+srnLC5si0WG4FILVyBfNSEj2mf/FIf7pnnBpMyywoZDgU/pZki/VDr7l2nLVGNYm062UPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OReEjWoX; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OReEjWoX"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553d771435fso1179270e87.3
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 07:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762481; x=1753367281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fypRqRD7duJ7p6/XnMiehAY4t+I2qqoeS7XCKLtEaPI=;
        b=OReEjWoXdBX0BSVfIT5SIzohqMUMEfchbrbVgmDsX4KolbhIsVokC78uBYW2iis2gV
         GakZwApuzZ6yYV77+1GVkY9eid9SRvRdM2CB7kJ8VnOeMdfbuUBum1fk2+zR/lqsgh9x
         TXy0iIvHfCmd4yvi9wGBg4M062WExawwQ0d562/xoEgDXpRb6lCeV2HhHTA9h5geFoS3
         kh726SIKrdDa+aoY8hRE83bjFP4ovdVNv2xa14AeSluPC/LGGf+pTPpJlVEyvqhmc4qz
         BPsNBBu6Jzfllx9/PtRob2CVRZC+Iru8zkHyokroRLbl9QOVAcJVmaGixnNxgTonj2yE
         Wg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762481; x=1753367281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fypRqRD7duJ7p6/XnMiehAY4t+I2qqoeS7XCKLtEaPI=;
        b=Ig15sQdcZSG3RPE/ZP0P9+ZSnnP6Na8pj+jLtcZrf4pfq6fS2Cx7HUyNqqHuw6bKJu
         BN6zlY0IaS57e+1X0uuFFzSNyNTjiwpua0oIE0UGKN6MPPan3lhwnn4bGtAwQS7F3Lm/
         LrLaJmaHXw/jXABZ7BjGxsWWdPIi0w7IzQnh+QSMtaroVcV8V++yOiKY9RJW2PMB84d0
         bKmpZuuTDrDQbBspI1giAJszsp4v2dmk4OaZHoKNC1sIzDVW/M634/fQZyQv4yE0RSZ4
         FQA3IsCEoog7PgniI6v4ykxsH+ssw4vPqv63vjwcbsY8Wu2Fp1UHYwevDgZYdIOx1BC5
         5WAA==
X-Forwarded-Encrypted: i=1; AJvYcCW4/tWsnVuj2r2/DXn7nI1yn43DSFJbj963MDPVUgY1PUmd42rZ9S7YAekLjxCiZWqXgc+8eHc+Xoc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwN1j+Fh7w6v9a4M7Hd035QkF4ETd2iTvdo8z0lx/7woxoadu3A
	OZUtpe/DhR5tzABS2EKQv+JemFEZeZlUHyH4a6xILuse4uGxcxdTJl55
X-Gm-Gg: ASbGncuWVJygWP4i6HbVxNVAT+aZLERk7FoF4/DrLuXavJ5R4f/yBPjtirSKWWu135x
	oFupHRIZNUi+tWryXqHqO9GH1y62gabGPSJbzYDGbJHUFQ6RG3+J+s7gLBSBHwuj3FCyS3OiPy1
	tHuo6gwzpITzuPqPi2mIcI76FxigsGoRZLQyS8/7qJ6ghmgF5JoksY/RIiQ2E+b410k8MvIwgmy
	1aj/tf3keXoEyA/pCbYL0XMI8BXdGXzbZ8MJpYgK49L9Zu7jqHJRa8XDSIuFNshVhjo6C4FLb7L
	mk+DnyIX4TNIbmujTBrzpJ65Y1vLhEwi+dZDe/JNEiwkG7nDENN3QOYpNdT3UNxZrwSBv3kaUk+
	ngRdjasaPNh0786a4NEA1E+eUwFJP4z7VJ/+Jvze27GQ/C4UdsicBraz6H4i1YmJiEQ1s
X-Google-Smtp-Source: AGHT+IFLVShq7sQke2+sS90z+vGxECzG8DIPcMIPlB0XqE9wZj6ZkLlHMF4FaDTA86AkwLv8/0lA9Q==
X-Received: by 2002:a05:6512:63c4:10b0:553:ae47:685f with SMTP id 2adb3069b0e04-55a233b1914mr1997025e87.38.1752762480616;
        Thu, 17 Jul 2025 07:28:00 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:27:59 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org
Cc: ryabinin.a.a@gmail.com,
	glider@google.com,
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
Subject: [PATCH v3 06/12] kasan/xtensa: call kasan_init_generic in kasan_init
Date: Thu, 17 Jul 2025 19:27:26 +0500
Message-Id: <20250717142732.292822-7-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717142732.292822-1-snovitoll@gmail.com>
References: <20250717142732.292822-1-snovitoll@gmail.com>
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

