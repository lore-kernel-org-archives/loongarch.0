Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7481C3A
	for <loongarch@lists.linux.dev>; Fri,  1 Jul 2022 14:49:52 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id c6-20020a17090abf0600b001eee794a478so6661721pjs.1
        for <loongarch@lists.linux.dev>; Fri, 01 Jul 2022 07:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3vqMPQtU37IxiTme7xHTFWRTRc8mWdx5vr6fec9+J5c=;
        b=bNd6Nz2tuQ8R/dyalSpVz0eAwvX1ZuyBJDD5Pz/SKSg8M6UK04QQwzG2FZO5gs4P/R
         pI3JSFMDvapCYRRi/CxUyTP6RUrNX2XYbfL355Wn6qynoMq4cjMSFaRw8ytF1BCvedoP
         LH7x6YykB+vW27KJpBtO7+0e4435+5bohAJiwik9rsbHlMsUfJ24mlqYZpfSbbLXWKns
         0bLJwuXfg60PyN+lqlO3utXiJACyr2urFQ1MDz+J/vWrd2KLVzoRO3P/InGu6CwikJPJ
         jWV3Xr6doQXDEyx4hrXmLZgW6Rz4mNGcbAhqUkxFRqlhh7F5QbCJa03exc6Pwhrj2PPg
         SiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=3vqMPQtU37IxiTme7xHTFWRTRc8mWdx5vr6fec9+J5c=;
        b=iUkiFKdvEtqsc6mTaR6VNSjqlVJs1p9YAM0QYH2VfJHwgegRyEQ4xTLLX/a+ezV61B
         orzKD3XHYzWwsMP3p43eD6gwmHs5pVKs02p5ke/jPWR05Bu60QHpRV/3umv5912/drnm
         i5K3izbx1PQsyOl75lZofzZ9X4ytX2USFJwYpb49K35Usw96agnt2jOX+mD9PFCGCxmz
         ZoPYxc4qZkCfyuXtZVHOywHm8AbU+d9BEa8RwJU9fyssONXkzJ31YEiOGVHd0gbGmTGe
         KAoi7Kbc8/56NyyeXklcNYfzBLXU+b/mmvXRiVJnWO/1pbz6lX9VXzeyB/DWAOQK/lRB
         tJXQ==
X-Gm-Message-State: AJIora9YH9z1AJ+zkMHSkvN4H4W23oaSx8Ji5rYoeSX+iD0d9P3otGg7
	VjEd1uS5G8yowFqvA1UDLos=
X-Google-Smtp-Source: AGRyM1s3a/8qDkZ1jLM98EE1MomStP2B4y1Fufcw9fKblb53FNAn7/gurQKxKjYhxHDYg3omITWF0w==
X-Received: by 2002:a17:90b:3d86:b0:1ee:ec85:ec07 with SMTP id pq6-20020a17090b3d8600b001eeec85ec07mr19086770pjb.81.1656686991826;
        Fri, 01 Jul 2022 07:49:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x15-20020a170902ec8f00b001663cf001besm729235plg.174.2022.07.01.07.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:49:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Guo Ren <guoren@kernel.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/3] LoongArch: page.h: Add missing include file
Date: Fri,  1 Jul 2022 07:49:44 -0700
Message-Id: <20220701144946.2528972-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220701144946.2528972-1-linux@roeck-us.net>
References: <20220701144946.2528972-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building loongarch:tinyconfig fails with the following error.

./arch/loongarch/include/asm/page.h: In function 'pfn_valid':
./arch/loongarch/include/asm/page.h:42:32: error: 'PHYS_OFFSET' undeclared

Add the missing include file.

Fixes: 09cfefb7fa70 ("LoongArch: Add memory management")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/loongarch/include/asm/page.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/include/asm/page.h b/arch/loongarch/include/asm/page.h
index 3dba4986f6c9..8cee37f832aa 100644
--- a/arch/loongarch/include/asm/page.h
+++ b/arch/loongarch/include/asm/page.h
@@ -5,6 +5,7 @@
 #ifndef _ASM_PAGE_H
 #define _ASM_PAGE_H
 
+#include <asm/addrspace.h>
 #include <linux/const.h>
 
 /*
-- 
2.35.1

